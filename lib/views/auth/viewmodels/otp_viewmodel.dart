import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learn_leap/core/data/remote/auth/auth.dart';
import 'package:learn_leap/navigations/navigations.dart';
import 'package:learn_leap/views/view_states/view_states.dart';
import 'package:learn_leap/views/widgets/widgets.dart';

import '../../../core/data/network/network.dart';

class VerifyOtpViewModel extends BaseViewModel {
  late final AuthRepository _authRepository;
  VerifyOtpViewModel(this._authRepository);

  verifyOtp(String code, String email) async {
    try {
      changeState(const ViewModelState.busy());
      await _authRepository.verifyOtp(email, code);
      changeState(const ViewModelState.idle());
      NavigationService.instance.navigateToReplace(NavigationRoutes.homeView);
    } on Failure catch (e) {
      changeState(ViewModelState.error(e));
      AppFlushBar.showError(title: e.title, message: e.message);
    } catch (e) {
      final error = UserDefinedExceptions(
        "Unhandled",
        e.toString(),
      );
      changeState(
        ViewModelState.error(error),
      );
      AppFlushBar.showError(title: error.title, message: error.message);
    }
  }
}

final verifyOtpViewModel = ChangeNotifierProvider<VerifyOtpViewModel>((ref) {
  return VerifyOtpViewModel(ref.read(authRepository));
});
