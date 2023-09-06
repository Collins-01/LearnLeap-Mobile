import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learn_leap/core/domain/user_domain.dart';

import '../../core/core.dart';

class SplashScreenView extends ConsumerStatefulWidget {
  const SplashScreenView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SplashScreenViewState();
}

class _SplashScreenViewState extends ConsumerState<SplashScreenView> {
  _handleOnApplicationStartup() async {
    await ref.read(userDomainProvider).init();
    if (ref.read(userDomainProvider).currentUser.value != null) {
      NavigationService.instance
          .navigateToReplace(NavigatorRoutes.dashBoardView);
    } else {
      NavigationService.instance.navigateToReplace(NavigatorRoutes.loginView);
    }

    // await ref.read(appDomain).init(
    //   onSuccess: () async {
    //     // NavigationService.instance.navigateToReplace(NavigatorRoutes.loginView);
    //     await ref.read(userDomainProvider).init();
    //     if (ref.read(userDomainProvider).currentUser.value != null) {
    //       NavigationService.instance
    //           .navigateToReplace(NavigatorRoutes.dashBoardView);
    //     } else {
    //       NavigationService.instance
    //           .navigateToReplace(NavigatorRoutes.loginView);
    //     }
    //   },
    //   onFailure: () {
    //     NavigationService.instance.navigateToReplace(NavigatorRoutes.loginView);
    //   },
    // );
  }

  @override
  void initState() {
    _handleOnApplicationStartup();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AppText.heading1("LearnLeap"),
      ),
    );
  }
}
