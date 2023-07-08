import 'package:flutter/material.dart';
import 'package:learn_leap/views/splash_screen.dart';

import '../views/auth/auth.dart';
import 'navigation_routes.dart';

class RouteGenerators {
  static Route<dynamic> generateRoutes(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case NavigationRoutes.splashScreenView:
        return MaterialPageRoute(
          builder: (_) => const SplashScreenView(),
        );
      case NavigationRoutes.forgotPasswordView:
        return MaterialPageRoute(
          builder: (_) => ForgotPasswordView(),
        );
      case NavigationRoutes.resgisterView:
        return MaterialPageRoute(
          builder: (_) => SignUpView(),
        );
      case NavigationRoutes.loginView:
        return MaterialPageRoute(
          builder: (_) => LoginView(),
        );
      // case NavigationRoutes.checkEmailView:
      //   return MaterialPageRoute(
      //     builder: (_) => CheckEmailView(),
      //   );

      case NavigationRoutes.resetPasswordView:
        return MaterialPageRoute(
          builder: (_) => ResetPasswordView(),
        );
      // case NavigationRoutes.uploadAvatarView:
      //   return MaterialPageRoute(
      //     builder: (_) => const UploadAvatarView(),
      //   );
      // case NavigationRoutes.createBioView:
      //   var avatar = routeSettings.arguments as File;
      //   return MaterialPageRoute(
      //     builder: (_) => CreateBioView(avatar: avatar),
      //   );

      // case NavigationRoutes.feedInfoView:
      //   var feed = routeSettings.arguments as Feed;
      //   return MaterialPageRoute(
      //     builder: (_) => FeedInfoView(feed: feed),
      //   );
      // case NavigationRoutes.photosView:
      //   // final List<String> images = routeSettings.arguments as List<String>;
      //   return MaterialPageRoute(
      //     builder: (_) => const PhotosView(
      //       images: [],
      //     ),
      //   );
      // case NavigationRoutes.baseView:
      //   return MaterialPageRoute(
      //     builder: (_) => BaseView(),
      //   );
      // case NavigationRoutes.notificationsView:
      //   return MaterialPageRoute(
      //     builder: (_) => const NotificationsView(),
      //   );
      // case NavigationRoutes.chatView:
      //   // final reciverId = routeSettings.arguments as String;
      //   return MaterialPageRoute(
      //     builder: (_) => const ChatView(
      //         // receiverId: reciverId,
      //         ),
      //   );
      // case NavigationRoutes.uploadPhotosView:
      //   return MaterialPageRoute(
      //     builder: (_) => const UploadProfilePhotosView(),
      //   );
      // case NavigationRoutes.profileView:
      //   return MaterialPageRoute(
      //     builder: (_) => const ProfileView(),
      //   );
      // case NavigationRoutes.searchView:
      //   return MaterialPageRoute(
      //     builder: (_) => SearchView(),
      //   );
      // case NavigationRoutes.filterView:
      //   return MaterialPageRoute(
      //     builder: (_) => const FilterView(),
      //   );
      // case NavigationRoutes.inCompleteRegistrationView:
      //   return MaterialPageRoute(
      //     builder: (_) => InCompleteRegistrationView(),
      //   );
      // case NavigationRoutes.confettiView:
      //   var firstName = routeSettings.arguments as String;
      //   var avatarUrl = routeSettings.arguments as String;
      //   return MaterialPageRoute(
      //     builder: (_) => ConfettiView(
      //       avatarUrl: avatarUrl,
      //       firstName: firstName,
      //     ),
      //   );
      // case NavigationRoutes.onboardingView:
      //   return MaterialPageRoute(
      //     builder: (_) => const OnboardingView(),
      //   );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text("No route defined for ${routeSettings.name}"),
            ),
          ),
        );
    }
  }
}
