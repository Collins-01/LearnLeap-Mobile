import 'package:dio/dio.dart';
import 'package:learn_leap/core/data/network/failure.dart';

class BadCertificateException extends DioException with Failure {
  final RequestOptions request;
  final Response? serverResponse;
  final String errorKey;
  BadCertificateException(this.request,
      [this.serverResponse, this.errorKey = ''])
      : super(requestOptions: request, response: serverResponse);

  @override
  String get title => "Bad Certificate";
  @override
  String get message {
    if (serverResponse == null) {
      return 'An unexcepted error occurred.';
    } else {
      return getErrorInfo(serverResponse?.data, errorKey);
    }
  }

  @override
  String toString() {
    return "Error was:\nTitle: $title\nMessage: $message ";
  }
}
