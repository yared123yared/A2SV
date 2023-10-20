// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'daily_weather_model.g.dart';

@HiveType(typeId: 2)
class DailyWeatherModel extends Equatable {

  @HiveField(0)
   final String date;

   @HiveField(1)
  final String weatherIconUrl;

  @HiveField(2)
  final String humidity;

  @HiveField(3)
  final String windspeed;

  @HiveField(4)
  final String maxTemperature;

  @HiveField(5)
  final String minTemperature;

  const DailyWeatherModel({
    required this.date,
    required this.weatherIconUrl,
    required this.humidity,
    required this.windspeed,
    required this.maxTemperature,
    required this.minTemperature,
  });

  DailyWeatherModel copyWith({
    String? date,
    String? weatherIconUrl,
    String? humidity,
    String? windspeed,
    String? maxTemperature,
    String? minTemperature,
  }) {
    return DailyWeatherModel(
      date: date ?? this.date,
      weatherIconUrl: weatherIconUrl ?? this.weatherIconUrl,
      humidity: humidity ?? this.humidity,
      windspeed: windspeed ?? this.windspeed,
      maxTemperature: maxTemperature ?? this.maxTemperature,
      minTemperature: minTemperature ?? this.minTemperature,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'date': date,
      'weatherIconUrl': weatherIconUrl,
      'humidity': humidity,
      'windspeed': windspeed,
      'maxTemperature': maxTemperature,
      'minTemperature': minTemperature,
    };
  }

  factory DailyWeatherModel.fromMap(Map<String, dynamic> map) {
    return DailyWeatherModel(
      date: map['date'] as String,
      weatherIconUrl: map['weatherIconUrl'] as String,
      humidity: map['humidity'] as String,
      windspeed: map['windspeed'] as String,
      maxTemperature: map['maxTemperature'] as String,
      minTemperature: map['minTemperature'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory DailyWeatherModel.fromJson(String source) => DailyWeatherModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      date,
      weatherIconUrl,
      humidity,
      windspeed,
      maxTemperature,
      minTemperature,
    ];
  }
}
