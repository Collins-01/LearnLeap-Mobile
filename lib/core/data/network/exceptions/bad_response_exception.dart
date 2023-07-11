import 'package:dio/dio.dart';
import 'package:learn_leap/core/data/network/failure.dart';

import 'get_error.dart';

class BadResponseException extends DioException implements Failure {
  final RequestOptions request;
  final Response? serverResponse;
  final String errorKey;
  BadResponseException(this.request, [this.serverResponse, this.errorKey = ''])
      : super(requestOptions: request, response: serverResponse);

  @override
  String get title => "Invalid Request";
  @override
  String get message {
    if (serverResponse == null) {
      return 'BadResponse exception';
    } else {
      return getErrorInfo(serverResponse?.data, errorKey);
    }
  }

  @override
  String getErrorInfo(error, [String key = '']) {
    return getErrorInfoFromResponse(error);
  }
}
