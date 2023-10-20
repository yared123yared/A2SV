import 'package:equatable/equatable.dart';
import 'package:final_assesment/domain/domain.dart';

abstract class WeatherEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class FetchWeatherData extends WeatherEvent {
  final APIWeatherRequest apiWeatherRequestData;

  FetchWeatherData({required this.apiWeatherRequestData});

  @override
  List<Object?> get props => [apiWeatherRequestData];
}

class FetchFavoriteWeatherData extends WeatherEvent {}

class SaveFavoriteWeatherData extends WeatherEvent{
  final WeatherModel weatherModel;

  SaveFavoriteWeatherData({required this.weatherModel});

}
