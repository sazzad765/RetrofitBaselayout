import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_retrofit/api/api_client.dart';
import 'package:flutter_retrofit/core/model/base_response.dart';
import 'package:flutter_retrofit/utils/shared_preferences.dart';


class BaseService extends ChangeNotifier with SharedPref {
  BaseService({required RestClient client}) : _client = client;

  final RestClient _client;

  RestClient get client => _client;

  BaseResponse<T> errorResponse<T>(Object obj) {
    print("Objects: $obj");
    switch (obj.runtimeType) {
      case DioError:
        final res = (obj as DioError).response;
        var message = res!.data['message'];
        var newResponse = BaseResponse<T>(
          statusCode: res!.statusCode ?? 404,
          message: message ?? res!.statusMessage,
        );
        return newResponse;
      default:
        return BaseResponse<T>(message: 'Error', statusCode: 404);
    }
  }
}
