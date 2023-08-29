import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learn_leap/core/data/network/network.dart';
import 'package:learn_leap/views/view_states/view_states.dart';
import 'package:learn_leap/widgets/widgets.dart';

import '../../../core/data/remote/auth/auth.dart';
import '../../../core/core.dart';

class LoginViewModel extends BaseViewModel {
  final AuthRepository _authRepository;
  LoginViewModel(this._authRepository);
  final NavigationService _navigationService = NavigationService.instance;

  login(String email, String password) async {
    try {
      changeState(const ViewModelState.busy());
      await _authRepository.login(email, password);
      changeState(const ViewModelState.idle());
      _navigationService.navigateToReplace(NavigatorRoutes.dashBoardView);
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

final loginViewModel =
    ChangeNotifierProvider.autoDispose<LoginViewModel>((ref) {
  return LoginViewModel(ref.read(authRepository));
});
