import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:formz/formz.dart';
import 'package:el_tiempo_en_galve_app/features/stations/domain/entities/station.dart';
import 'package:el_tiempo_en_galve_app/features/stations/presentation/providers/inputs/base_input.dart';
import 'package:el_tiempo_en_galve_app/features/stations/presentation/providers/stations_provider.dart';



final createStationFormProvider = StateNotifierProvider.autoDispose<StationsNotifier, CreateStationFormState>((ref) {
  //Recordar a nuestro provider que está escucharndo al token!!!
  final createStation = ref.watch(stationsProvider.notifier).createStation;
  return StationsNotifier(onSubmitCallback: createStation);
});

class StationsNotifier extends StateNotifier<CreateStationFormState> {
  final Future<bool> Function(Map<String,dynamic> stationLike) onSubmitCallback;

  StationsNotifier({
    required this.onSubmitCallback
  }): super( CreateStationFormState());

  changeStationTypeSelected(StationType stationType){
    stationType == StationType.ecowitt 
    ? state = state.copyWith(stationType: stationType, stationMac: state.stationMac ?? const BaseInput.pure())
    : state = state.copyWith(stationType: stationType, stationMac: null);
  }
  
  onNameChange(String value){
    final newName = BaseInput.dirty(value);
    state = state.copyWith(
      stationName: newName, isValid: Formz.validate([
        newName, 
        state.stationLocalization, 
        if(state.stationMac != null) state.stationMac!
        ])
    );
  }
  onLocationChange(String value){
    final newLocation = BaseInput.dirty(value);
    state = state.copyWith(
      stationLocalization: newLocation, isValid: Formz.validate([
        newLocation, 
        state.stationName, 
        if(state.stationMac != null) state.stationMac!
        ])
    );
  }
  onMacChange(String value){
    if(state.stationType != StationType.ecowitt) return;
    final newMac = BaseInput.dirty(value);
    state = state.copyWith(
      stationMac: newMac, isValid: Formz.validate([
        newMac, 
        state.stationName, 
        state.stationLocalization
        ])
    );
  }
  Future<bool> onFormSubmit() async {
    _touchEveryField();
    if(!state.isValid) return false;
    return await onSubmitCallback(_toStationLike());
  }
  //En realidad, HAY DOS TIPOS DE CREACIONES.
  //Ecowit. Hay que cifrar la MAC
  //Wunderground. Que es así xD.
  _toStationLike(){
    return {   
      "name": state.stationName.value,
      "type": state.stationType.name,
      "location" : state.stationLocalization.value,
      if(state.stationMac != null)"authStation": state.stationMac!.value,
    };
  }
  
  _touchEveryField(){
    final name = BaseInput.dirty(state.stationName.value);
    final localization = BaseInput.dirty(state.stationLocalization.value);
    final mac = state.stationMac == null ? null : BaseInput.dirty(state.stationMac!.value);

    state = state.copyWith(
      isLoading: true,
      stationName: name,
      stationLocalization: localization,
      stationMac: mac,
      isValid: Formz.validate([
        name, localization,
        if(mac != null) mac
      ])
    );
  }
}

class CreateStationFormState{
  final BaseInput stationName;
  final BaseInput stationLocalization;
  final StationType stationType;
  final BaseInput? stationMac;
   final bool isValid;
  final bool isLoading;

  CreateStationFormState({
    this.stationName = const BaseInput.pure(), 
    this.stationLocalization = const BaseInput.pure(), 
    this.stationType = StationType.ecowitt, 
    this.stationMac = const BaseInput.pure(), 
    this.isValid = false,
    this.isLoading = false});

  //Y creamos el método para "actualizar el estado"
  CreateStationFormState copyWith({
    BaseInput? stationName,
    BaseInput? stationLocalization,
    StationType? stationType,
    BaseInput? stationMac,
    bool? isValid,
    bool? isLoading,
  }) => CreateStationFormState(
    stationName:  stationName ?? this.stationName,
    stationLocalization:  stationLocalization ?? this.stationLocalization,
    stationType:  stationType ?? this.stationType,
    stationMac:  stationMac,
    isValid: isValid ?? this.isValid,
    isLoading: isLoading ?? this.isLoading,
  );
}