import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learn_leap/core/router/router_argument_keys.dart';
import 'package:learn_leap/models/create_account_model.dart';
import 'package:learn_leap/views/view_states/view_states.dart';
import 'package:learn_leap/widgets/widgets.dart';

import '../../../core/data/network/network.dart';
import '../../../core/data/remote/auth/auth.dart';
import '../../../core/core.dart';

class SignUpViewModel extends BaseViewModel {
  final AuthRepository _authRepository;
  SignUpViewModel(this._authRepository);
  final NavigationService _navigationService = NavigationService.instance;

  signUp(
      String email, String password, String firstName, String lastName) async {
    try {
      changeState(const ViewModelState.busy());
      await _authRepository.signup(
        CreateAccount(
            firstName: firstName,
            lastName: lastName,
            email: email,
            password: password,
            role: ''),
      );
      changeState(const ViewModelState.idle());
      _navigationService.navigateToReplace(NavigatorRoutes.otpVerificationView,
          argument: {RoutingArgumentKey.email: email});
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

final signUpViewModel =
    ChangeNotifierProvider.autoDispose<SignUpViewModel>((ref) {
  return SignUpViewModel(
    ref.read(authRepository),
  );
});
