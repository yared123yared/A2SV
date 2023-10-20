
import 'package:final_assesment/domain/domain.dart';
import 'package:final_assesment/utils/utils.dart';

abstract class APIWeatherRepository {
  Future<DataState<APIWeatherResponse>> getWeatherData(
      {required APIWeatherRequest weatherRequest});
}