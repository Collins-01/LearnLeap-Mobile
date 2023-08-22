import '../../../core/core.dart';
import '../../view_states/view_states.dart';

class SplashViewModel extends BaseViewModel {
  // final LocalCache _localCache = locator();
  final NavigationService _navigationService = NavigationService.instance;

  Future<void> initialise() {
    // bool isLoggedIn = _localCache.getToken() != null;

    return _navigationService.navigateToReplace(NavigatorRoutes.loginView);
    // if (isLoggedIn) {
    //   return _navigationService.navigateToReplace(NavigatorRoutes.loginView);
    // } else {
    //   return _navigationService
    //       .navigateToReplace(NavigatorRoutes.onboardingView);
    // }
  }
}
