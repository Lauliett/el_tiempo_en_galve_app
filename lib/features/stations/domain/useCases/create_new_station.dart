import '../entities/weather_station.dart';

abstract class CreateNewStation{
  WeatherStation createnewStation(String name, String location, String? key, String? id, String? auth, String? userId);
} 

