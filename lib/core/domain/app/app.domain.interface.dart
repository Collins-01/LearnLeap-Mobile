import 'package:flutter/foundation.dart';

abstract class IAppDomain {
  Future<void> init({VoidCallback? onSuccess, VoidCallback? onFailure});
}
