import 'package:equatable/equatable.dart';
import 'package:final_assesment/domain/domain.dart';

abstract class WeatherState extends Equatable {
  @override
  List<Object?> get props => [];
}

class WeatherInit extends WeatherState {}

class WeatherInProgress extends WeatherState {}

class WeatherSuccess extends WeatherState {
  final WeatherModel weatherData;

  WeatherSuccess({required this.weatherData});

  @override
  List<Object?> get props => [weatherData];
}

class WeatherFailed extends WeatherState {
  final String message;

  WeatherFailed({required this.message});

  @override
  List<Object?> get props => [message];
}

class FavoriteWeatherInProgress extends WeatherState {}

class FavoriteWeatherSuccess extends WeatherState {
  final List<WeatherModel> weatherData;

  FavoriteWeatherSuccess({required this.weatherData});

  @override
  List<Object?> get props => [weatherData];
}

class FavoriteWeatherFailed extends WeatherState {
  final String message;

  FavoriteWeatherFailed({required this.message});

  @override
  List<Object?> get props => [message];
}



