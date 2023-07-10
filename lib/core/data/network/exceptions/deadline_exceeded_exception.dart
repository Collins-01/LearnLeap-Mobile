import 'package:dio/dio.dart';
import '../failure.dart';
import 'get_error.dart';

///Time Out Exception [When there is a connection timeou with the request]
class DeadlineExceededException extends DioException implements Failure {
  DeadlineExceededException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'title: $title message: $message';
  }

  @override
  String get message => "The connection has timed out, please try again.";

  @override
  String get title => "Network error";
  @override
  String getErrorInfo(error, [String key = '']) {
    return getErrorInfoFromResponse(error);
  }
}
