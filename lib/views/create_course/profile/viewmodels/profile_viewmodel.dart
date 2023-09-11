import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learn_leap/core/core.dart';
import 'package:learn_leap/core/domain/user_domain.dart';
import 'package:learn_leap/views/view_states/view_states.dart';

class ProfileViewModel extends BaseViewModel {
  final UserDomain _userDomain;
  ProfileViewModel(this._userDomain);

  logOut() async {
    await _userDomain.logOut();
    NavigationService.instance.navigateToReplaceAll(NavigatorRoutes.loginView);
  }
}

final profileViewModelProvider =
    ChangeNotifierProvider<ProfileViewModel>((ref) {
  return ProfileViewModel(
    ref.read(userDomainProvider),
  );
});
