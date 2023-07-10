import 'package:dio/dio.dart';
import 'package:learn_leap/core/data/network/exceptions/get_error.dart';
import '../failure.dart';

class CancelRequestException extends DioException implements Failure {
  @override
  final RequestOptions requestOptions;
  CancelRequestException(this.requestOptions)
      : super(requestOptions: requestOptions);
  @override
  String get message => "Request was cancelled, please try again.";

  @override
  String get title => "Request Cancelled";
  @override
  String getErrorInfo(error, [String key = '']) {
    return getErrorInfoFromResponse(error);
  }
}
