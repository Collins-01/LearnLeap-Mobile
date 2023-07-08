import 'package:dio/dio.dart';
import '../failure.dart';

///Time Out Exception [When there is a connection timeou with the request]
class DeadlineExceededException extends DioException with Failure {
  DeadlineExceededException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'title: $title message: $message';
  }

  @override
  String get message => "The connection has timed out, please try again.";

  @override
  String get title => "Network error";
}
