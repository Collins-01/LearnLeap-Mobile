String getErrorInfoFromResponse(error, [String key = '']) {
  // _InternalLinkedHashMap<String, dynamic>
  // print("getErrorInfo --> ${error.runtimeType}");
  var message = error['message'];
  if (message is List) {
    return message[0];
  }
  return error['message'];
  // try {
  //   // if (2 + 2 == 4) {
  //   //   return error;
  //   //   // 'An unknown error occurred. [Error is Null]';
  //   // }
  //   if (error is String) {
  //     return error;
  //   } else if (error is List) {
  //     error[0] is String ? error[0] : error[0][0];
  //   } else if (error is Map) {
  //     if (error.isEmpty) {
  //       return 'An unknown error occurred. [Empty Map]';
  //     }
  //     if (key.isNotEmpty) {
  //       return error.values as String;
  //     }
  //     if (error[key] is String) {
  //       return error[key];
  //     }
  //     return 'An unknown error occurred. [Failed Map parsing]';
  //   }

  //   return 'An unknown error occurred. [Not String, Map, List or Matrix]';
  // } catch (e) {
  //   print("Error from Catch ==== $e");
  //   return 'An unknown error occurred. [Error from Catch parsing]';
  // }
}
