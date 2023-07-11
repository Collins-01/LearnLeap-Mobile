import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learn_leap/core/domain/app/app.domain.interface.dart';

class AppDomainImpl extends IAppDomain {
  @override
  Future<void> init({VoidCallback? onSuccess, VoidCallback? onFailure}) async {
    await Future.delayed(const Duration(seconds: 2));
    //* Check if it's first time
    // * Check if user exists on the device
    onSuccess?.call();
  }
}

final appDomain = Provider<IAppDomain>((ref) {
  return AppDomainImpl();
});
