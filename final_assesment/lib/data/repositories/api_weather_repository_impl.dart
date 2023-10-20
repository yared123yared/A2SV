import 'package:final_assesment/data/data.dart';
import 'package:final_assesment/domain/domain.dart';
import 'package:final_assesment/service_locator.dart';
import 'package:final_assesment/utils/resources/data_state.dart';

class APIWeatherRepositoryImpl extends APIWeatherRepository {
  final APIWeatherService _apiWeatherService;

  APIWeatherRepositoryImpl()
      : _apiWeatherService = serviceLocator<APIWeatherService>();
  @override
  Future<DataState<APIWeatherResponse>> getWeatherData(
      {required APIWeatherRequest weatherRequest}) async {
        print("HERE IS TH DATA ##### ${_apiWeatherService.getWeatherData(request: weatherRequest)}");
    return await _apiWeatherService.getWeatherData(request: weatherRequest);
  }
}
