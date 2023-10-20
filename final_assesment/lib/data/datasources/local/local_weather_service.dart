import 'package:final_assesment/domain/domain.dart';
import 'package:hive_flutter/hive_flutter.dart';

class LocalWeatherService {
  void addFavoriteWeather({required WeatherModel weatherModel}) {
    final favoriteWeatherBox = Hive.box<FavoriteWeather>('favoriteWeather');

    var favoriteWeathers = favoriteWeatherBox.get('favorites');

    if (favoriteWeathers == null) {
      favoriteWeatherBox.put(
          'favorites', FavoriteWeather(favoritedWeathers: [weatherModel]));
    } else {
      if (!favoriteWeathers.favoritedWeathers.contains(weatherModel)) {
        List<WeatherModel> updatedFavoriteData = [
          ...favoriteWeathers.favoritedWeathers, weatherModel
        ];
        favoriteWeatherBox.put('favorites',
            FavoriteWeather(favoritedWeathers: updatedFavoriteData));
      }
    }
  }

  List<WeatherModel> getFavoriteWeather() {
    final favoriteWeatherBox = Hive.box<FavoriteWeather>('favoriteWeather');
    var favoriteWeathers = favoriteWeatherBox.get('favorites');

    if (favoriteWeathers == null) {
      return [];
    }

    return favoriteWeathers.favoritedWeathers;
  }
}
