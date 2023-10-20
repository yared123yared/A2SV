// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:final_assesment/domain/domain.dart';

part 'weather_model.g.dart';

@HiveType(typeId: 1)
class WeatherModel extends Equatable {

@HiveField(0)
final String weatherDescription;

@HiveField(1)
final String cityName;

@HiveField(2)
final List<DailyWeatherModel> dailyWeatherCondition;
  const WeatherModel({
    required this.weatherDescription,
    required this.cityName,
    required this.dailyWeatherCondition,
  });

  WeatherModel copyWith({
    String? weatherDescription,
    String? cityName,
    List<DailyWeatherModel>? dailyWeatherCondition,
  }) {
    return WeatherModel(
      weatherDescription: weatherDescription ?? this.weatherDescription,
      cityName: cityName ?? this.cityName,
      dailyWeatherCondition: dailyWeatherCondition ?? this.dailyWeatherCondition,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'weatherDescription': weatherDescription,
      'cityName': cityName,
      'dailyWeatherCondition': dailyWeatherCondition.map((x) => x.toMap()).toList(),
    };
  }

  factory WeatherModel.fromMap(Map<String, dynamic> map) {
    return WeatherModel(
      weatherDescription: map['weatherDescription'] as String,
      cityName: map['cityName'] as String,
      dailyWeatherCondition: List<DailyWeatherModel>.from((map['dailyWeatherCondition'] as List<int>).map<DailyWeatherModel>((x) => DailyWeatherModel.fromMap(x as Map<String,dynamic>),),),
    );
  }

  String toJson() => json.encode(toMap());

  factory WeatherModel.fromJson(String source) => WeatherModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [weatherDescription, cityName, dailyWeatherCondition];
}
