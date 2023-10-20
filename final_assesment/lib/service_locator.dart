import 'package:final_assesment/data/data.dart';
import 'package:final_assesment/presentation/blocs/blocs.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

GetIt serviceLocator = GetIt.instance;

Future<void> serviceLocatorInit() async {
  serviceLocator.registerSingleton<http.Client>(http.Client());
  serviceLocator.registerFactory<APIWeatherService>(() => APIWeatherService());
  serviceLocator.registerFactory<APIWeatherRepositoryImpl>(
      () => APIWeatherRepositoryImpl());
  serviceLocator.registerSingleton<LocalWeatherService>(LocalWeatherService());
  serviceLocator.registerSingleton<WeatherBloc>(WeatherBloc());
}
