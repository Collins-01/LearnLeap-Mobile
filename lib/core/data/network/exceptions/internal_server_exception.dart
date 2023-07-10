import 'package:dio/dio.dart';

import '../failure.dart';
import 'get_error.dart';

class InternalServerErrorException extends DioException implements Failure {
  final RequestOptions request;
  final Response? serverResponse;
  InternalServerErrorException(this.request, [this.serverResponse])
      : super(requestOptions: request, response: serverResponse);

  @override
  String toString() {
    return "Error was:\nTitle: $title\nMessage: $message ";
  }

  @override
  String get title => "Server Error";
  @override
  String get message => "An Unknown error occcured, please try again later";

  @override
  String getErrorInfo(error, [String key = '']) {
    return getErrorInfoFromResponse(error);
  }
}
