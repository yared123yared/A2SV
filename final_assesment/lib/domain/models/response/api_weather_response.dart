// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class APIWeatherResponse extends Equatable {
  final Map<String, dynamic> data;
  const APIWeatherResponse({
    required this.data,
  });

  APIWeatherResponse copyWith({
    Map<String, dynamic>? data,
  }) {
    return APIWeatherResponse(
      data: data ?? this.data,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'data': data,
    };
  }

  factory APIWeatherResponse.fromMap(Map<String, dynamic> map) {
    return APIWeatherResponse(
      data: Map<String, dynamic>.from((map['data'] as Map<String, dynamic>)),
    );
  }


  factory APIWeatherResponse.fromJson(String source) =>
      APIWeatherResponse.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [data];
}
