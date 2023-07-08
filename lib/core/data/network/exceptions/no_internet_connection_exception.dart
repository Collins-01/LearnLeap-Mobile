import 'package:dio/dio.dart';

import '../failure.dart';

///No Internet Connection
class NoInternetConnectionException extends DioException with Failure {
  NoInternetConnectionException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'title: $title message: $message';
  }

  @override
  String get message => "No internet connection, please try again";

  @override
  String get title => "No Network";
}
