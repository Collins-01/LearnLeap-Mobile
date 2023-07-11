import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learn_leap/core/data/remote/auth/auth.dart';
import 'package:learn_leap/navigations/navigations.dart';
import 'package:learn_leap/views/view_states/view_states.dart';

class VerifyOtpViewModel extends BaseViewModel {
  late final AuthRepository _authRepository;
  VerifyOtpViewModel(this._authRepository);

  verifyOtp(String code) async {
    changeState(const ViewModelState.busy());
    await Future.delayed(const Duration(seconds: 3));
    changeState(const ViewModelState.idle());
    await NavigationService.instance
        .navigateToReplace(NavigationRoutes.baseView);
  }
}

final verifyOtpViewModel = ChangeNotifierProvider<VerifyOtpViewModel>((ref) {
  return VerifyOtpViewModel(ref.read(authRepository));
});
