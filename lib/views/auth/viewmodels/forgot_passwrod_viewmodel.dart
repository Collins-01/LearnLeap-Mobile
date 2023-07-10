import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learn_leap/navigations/navigations.dart';
import 'package:learn_leap/views/view_states/view_states.dart';
import 'package:learn_leap/views/widgets/widgets.dart';

import '../../../core/data/network/exceptions/exceptions.dart';
import '../../../core/data/network/network.dart';
import '../../../core/data/remote/auth/auth.dart';

class ForgotPasswordViewModel extends BaseViewModel {
  final AuthRepository _authRepository;
  final NavigationService _navigationService = NavigationService.instance;
  ForgotPasswordViewModel(this._authRepository);

  forgotPassword(String email) async {
    try {
      changeState(const ViewModelState.busy());
      // await _authRepository.forgotPassword(email);
      changeState(const ViewModelState.idle());
      // _navigationService.navigateToReplace(NavigationRoutes.checkEmailView);
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

  cancelRequest() {
    // _authRepository.cancelRequest();
  }
}

final forgotPasswordViewModel =
    ChangeNotifierProvider.autoDispose<ForgotPasswordViewModel>((ref) {
  return ForgotPasswordViewModel(ref.read(authRepository));
});
