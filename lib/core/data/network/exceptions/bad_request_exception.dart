import 'package:dio/dio.dart';
import 'package:learn_leap/core/data/network/exceptions/get_error.dart';
import 'package:learn_leap/core/data/network/failure.dart';

const _unkownErrorString = "An error occured, please try again. ";

class BadRequestException extends DioException implements Failure {
  final RequestOptions request;
  final Response? serverResponse;
  final String errorKey;

  BadRequestException(this.request, [this.serverResponse, this.errorKey = ''])
      : super(requestOptions: request, response: serverResponse);

  @override
  String get title => "Invalid Request";
  @override
  String get message {
    if (serverResponse == null) {
      return _unkownErrorString;
    } else {
      return getErrorInfo(serverResponse?.data, errorKey);
    }
  }

  @override
  String getErrorInfo(error, [String key = '']) {
    return getErrorInfoFromResponse(error);
  }
}
