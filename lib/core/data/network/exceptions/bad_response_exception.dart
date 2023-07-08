import 'package:dio/dio.dart';
import 'package:harmony_social/core/data/network_service/exceptions/failure.dart';

class BadResponseException extends DioException with Failure {
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
  String toString() {
    return "Error was:\nTitle: $title\nMessage: $message ";
  }
}
