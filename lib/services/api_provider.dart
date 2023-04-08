import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:tabiblib/core/constants/constants.dart';

class ResponseData {
  ResponseData({
    required this.data,
    required this.isSuccessful,
  });

  dynamic data;
  bool isSuccessful;
}

class ApiProvider {
  ApiProvider(this._client) {
    baseUrl = Constants.baseUrl;
  }

  final Dio _client;

  String? baseUrl;

  Future<ResponseData> launchRequest({
    String? baseUrl,
    required String endPoint,
    required String method,
    Map<String, dynamic>? body,
    Map<String, String>? headers,
    Map<String, dynamic>? queryParams,
  }) async {
    var url = (baseUrl ?? this.baseUrl!) + endPoint;

    var headersWithContentType = {
      "content-type": "application/json",
    };

    if (headers != null) {
      headersWithContentType.addAll(headers);
    }

    try {
      switch (method.toUpperCase()) {
        case "GET":
          var response = await _client.get(url,
              queryParameters: queryParams,
              options: Options(headers: headersWithContentType));

          if (response.statusCode == 200 || response.statusCode == 201) {
            return ResponseData(data: response.data, isSuccessful: true);
          } else {
            return ResponseData(data: response.data, isSuccessful: false);
          }

        case "POST":
          var response = await _client.post(
            url,
            data: jsonEncode(body),
            options: Options(headers: headersWithContentType),
          );

          if (response.statusCode == 200 || response.statusCode == 201) {
            return ResponseData(data: response.data, isSuccessful: true);
          } else {
            return ResponseData(data: response.data, isSuccessful: false);
          }

        case "PUT":
          var response = await _client.put(url,
              data: jsonEncode(body),
              options: Options(headers: headersWithContentType));

          if (response.statusCode == 200 || response.statusCode == 201) {
            return ResponseData(data: response.data, isSuccessful: true);
          } else {
            return ResponseData(data: response.data, isSuccessful: false);
          }

        case "DELETE":
          var response = await _client.delete(url,
              options: Options(headers: headersWithContentType));

          if (response.statusCode == 200 || response.statusCode == 201) {
            return ResponseData(data: response.data, isSuccessful: true);
          } else {
            return ResponseData(data: response.data, isSuccessful: false);
          }
        default:
          return ResponseData(data: {}, isSuccessful: false);
      }
    } on DioError catch (e) {
      if (e.type == DioErrorType.connectionTimeout ||
          e.type == DioErrorType.receiveTimeout) {
        throw Exception("connectTimeout");
      } else if (e.error is SocketException) {
        throw Exception("socketException");
      } else {
        throw Exception("dioError");
      }
    }
  }
}
