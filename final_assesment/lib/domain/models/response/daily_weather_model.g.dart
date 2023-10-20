// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_weather_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DailyWeatherModelAdapter extends TypeAdapter<DailyWeatherModel> {
  @override
  final int typeId = 2;

  @override
  DailyWeatherModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DailyWeatherModel(
      date: fields[0] as String,
      weatherIconUrl: fields[1] as String,
      humidity: fields[2] as String,
      windspeed: fields[3] as String,
      maxTemperature: fields[4] as String,
      minTemperature: fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, DailyWeatherModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.date)
      ..writeByte(1)
      ..write(obj.weatherIconUrl)
      ..writeByte(2)
      ..write(obj.humidity)
      ..writeByte(3)
      ..write(obj.windspeed)
      ..writeByte(4)
      ..write(obj.maxTemperature)
      ..writeByte(5)
      ..write(obj.minTemperature);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DailyWeatherModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
