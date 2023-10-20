import 'package:final_assesment/data/data.dart';
import 'package:final_assesment/domain/domain.dart';
import 'package:final_assesment/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:final_assesment/presentation/blocs/blocs.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final APIWeatherRepository _apiWeatherRepository;
  final LocalWeatherService _localWeatherSerive;

  WeatherBloc()
      : _apiWeatherRepository = serviceLocator<APIWeatherRepositoryImpl>(),
        _localWeatherSerive = serviceLocator<LocalWeatherService>(),
        super(WeatherInit()) {
    on<FetchWeatherData>(_onFethWeatherData);
    on<FetchFavoriteWeatherData>(_onFetchFavoriteWeathers);
    on<SaveFavoriteWeatherData>(_onSaveFavoriteWeatherData);
  }

  _onFethWeatherData(FetchWeatherData event, Emitter emit) async {
    emit(WeatherInProgress());
    try {
      final apiData = await _apiWeatherRepository.getWeatherData(
          weatherRequest: event.apiWeatherRequestData);
      if (apiData.error != null) {
        emit(WeatherFailed(message: apiData.error!.message));
      } else {
        WeatherModel weatherModel = WeatherModel(
            cityName: apiData.data!.data['request'].first['query'],
            weatherDescription: apiData.data!.data['current_condition']
                .first['weatherDesc'].first['value'],
            dailyWeatherCondition: []);
        final weatherData = apiData.data!.data['weather'] as List<dynamic>;

        for (var dailyWeather in weatherData) {
          weatherModel.dailyWeatherCondition.add(DailyWeatherModel(
              date: dailyWeather['date'],
              weatherIconUrl:
                  dailyWeather['hourly'].first['weatherIconUrl'].first['value'],
              humidity: dailyWeather['hourly'].first['humidity'],
              windspeed: dailyWeather['hourly'].first['windspeedKmph'],
              maxTemperature: dailyWeather['maxtempC'],
              minTemperature: dailyWeather['mintempC']));
        }
        emit(WeatherSuccess(weatherData: weatherModel));
      }
    } catch (e) {
      emit(WeatherFailed(message: e.toString()));
    }
  }

  _onFetchFavoriteWeathers(FetchFavoriteWeatherData event, Emitter emit) async {
    emit(FavoriteWeatherInProgress());
    try {
      final favoriteWeathers =  _localWeatherSerive.getFavoriteWeather();
      print("favorite ${favoriteWeathers.length}");
      emit(FavoriteWeatherSuccess(weatherData: favoriteWeathers));
    } catch (e) {
      print(e.toString());
      emit(FavoriteWeatherFailed(message: e.toString()));
    }
  }

  _onSaveFavoriteWeatherData(
      SaveFavoriteWeatherData event, Emitter emit) async {
    emit(FavoriteWeatherInProgress());

    try {
      _localWeatherSerive.addFavoriteWeather(weatherModel: event.weatherModel);
    } catch (e) {
      print(e.toString());
      emit(FavoriteWeatherFailed(message: e.toString()));
    }
  }
}
