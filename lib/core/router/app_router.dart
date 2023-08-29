import 'package:flutter/material.dart';
import 'package:learn_leap/views/dash_board/dash_board_view.dart';
import 'package:learn_leap/views/student/home/home_view.dart';

import '../../views/views.dart';
import '../core.dart';

class AppRouter {
  static PageRoute _getPageRoute({
    required RouteSettings settings,
    required Widget viewToShow,
  }) {
    return MaterialPageRoute(
        builder: (context) => viewToShow, settings: settings);
  }

  static Route<dynamic> generateRoute(RouteSettings settings) {
    Map<String, dynamic> routeArgs = settings.arguments != null
        ? settings.arguments as Map<String, dynamic>
        : {};

    switch (settings.name) {
      case NavigatorRoutes.homeView:
        return _getPageRoute(
          settings: settings,
          viewToShow: const HomeView(),
        );
      case NavigatorRoutes.dashBoardView:
        return _getPageRoute(
          settings: settings,
          viewToShow: DashBoardView(),
        );
      case NavigatorRoutes.splashScreenView:
        return _getPageRoute(
          settings: settings,
          viewToShow: const SplashScreenView(),
        );
      case NavigatorRoutes.loginView:
        return _getPageRoute(
          settings: settings,
          viewToShow: LoginView(),
        );
      case NavigatorRoutes.preSignUpView:
        return _getPageRoute(
          settings: settings,
          viewToShow: const PreSignUpView(),
        );
      case NavigatorRoutes.signUpView:
        return _getPageRoute(
          settings: settings,
          viewToShow: SignUpView(),
        );
      case NavigatorRoutes.otpVerificationView:
        var email = routeArgs[RoutingArgumentKey.email];
        return _getPageRoute(
          settings: settings,
          viewToShow: OtpView(
            email: email,
          ),
        );
      case NavigatorRoutes.forgotPasswordView:
        return _getPageRoute(
          settings: settings,
          viewToShow: ForgotPasswordView(),
        );
      // case NavigatorRoutes.emailVerificationView:
      //   return _getPageRoute(
      //     settings: settings,
      //     viewToShow: EmailVerificationView(),
      //   );
      case NavigatorRoutes.resetPasswordView:
        return _getPageRoute(
          settings: settings,
          viewToShow: ResetPasswordView(),
        );
      default:
        return _getPageRoute(
          settings: settings,
          viewToShow: const Scaffold(),
        );
    }
  }
}
