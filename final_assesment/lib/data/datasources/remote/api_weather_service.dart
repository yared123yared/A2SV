import 'dart:convert';
import 'dart:io';

import 'package:final_assesment/domain/domain.dart';
import 'package:final_assesment/service_locator.dart';
import 'package:final_assesment/utils/utils.dart';
import 'package:http/http.dart' as http;

class APIWeatherService {
  final http.Client _httpClient;

  APIWeatherService() : _httpClient = serviceLocator<http.Client>();

  Future<DataState<T>> getWeatherData<T>(
      {required APIWeatherRequest request}) async {
    print("WE ARE IN SERVICE ####");
    try {
      final url = Uri.parse(
          '${AppStrings.baseUrl}&q=${request.queryString}&num_of_days=7&tp=3&format=json');
      final httpResponse = await _httpClient.get(url);
      if (httpResponse.statusCode == HttpStatus.ok) {
        final decodedResponse = jsonDecode(httpResponse.body);
        return DataSuccess(
            APIWeatherResponse.fromMap(decodedResponse) as T);
      } else {
        throw HttpException('Failed to fetch', uri: url);
      }
    } on HttpException catch (error) {
      return DataFailed(error);
    }
  }
}
