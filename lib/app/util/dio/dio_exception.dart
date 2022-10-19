// ignore_for_file: file_names

import 'package:dio/dio.dart';

class DiorException implements Exception {
  late String errorMessage;

  DiorException.fromDioError(DioError dioError) {
    switch (dioError.type) {
      case DioErrorType.connectTimeout:
        errorMessage = 'Connection timed out';
        break;
      case DioErrorType.sendTimeout:
        errorMessage = 'Request send timed out';
        break;
      case DioErrorType.receiveTimeout:
        errorMessage = 'Receiving time out';
        break;
      case DioErrorType.response:
        errorMessage = _handleStatusCode(dioError.response?.statusCode);
        break;
      case DioErrorType.cancel:
        errorMessage = 'Request to the server was cancel';
        break;
      case DioErrorType.other:
        if (dioError.message.contains('SocketException')) {
          errorMessage = 'No internet';
        }
        errorMessage = 'Unexceptd error occurred';
        break;
      default:
        errorMessage = 'Something went wrong';
    }
  }

  String _handleStatusCode(int? statusCode) {
    switch (statusCode) {
      case 400:
        return 'Bad request';
      case 401:
        return 'Authentication failed';
      case 403:
        return "The authenticated user is not allowed to access the spcified HTTP method";
      case 404:
        return "The request resource does not exist";
      case 405:
        return "Method not allowed, Please check the allow header";
      case 415:
        return "Unsupport media type. The request content type or version numver is valid";
      case 422:
        return "Data validation failed";
      case 429:
        return "Too many request";
      case 500:
        return "Internal server error";
      default:
        return 'Oops somthing went wrong';
    }
  }

  @override
  String toString() => 'DiorException(errorMessage: $errorMessage)';
}
