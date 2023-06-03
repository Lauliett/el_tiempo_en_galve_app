import 'package:flutter/material.dart';

class CustomDropdownButtonFormField<T> extends StatelessWidget {

  final String textLabel;
  final Function(T)? onChanged;
  final List<DropdownMenuItem<T>> items;
  final T selectedValue;

  
  const CustomDropdownButtonFormField({
    super.key, 
    required this.textLabel, 
    required this.onChanged, 
    required this.items,
    required this.selectedValue,
  });


  @override
  Widget build(BuildContext context) {

    return SizedBox(
      height: 75,
      child: DropdownButtonFormField(
                decoration: const InputDecoration(
                  label: Text("Tipo de estacion"),
                ),
                items: items,
                value: selectedValue,
                onChanged: (value) {   
                  if (value !=null)  onChanged!(value);               
                },),
    );
  }
}

