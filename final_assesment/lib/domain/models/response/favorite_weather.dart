import 'package:final_assesment/domain/domain.dart';
import 'package:hive/hive.dart';
part 'favorite_weather.g.dart';

@HiveType(typeId: 3)
class FavoriteWeather{

  @HiveField(0)
  final List<WeatherModel> favoritedWeathers;

  FavoriteWeather({required this.favoritedWeathers});
  
}