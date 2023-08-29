import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learn_leap/core/domain/app/app.domain.dart';

import '../../core/core.dart';

class SplashScreenView extends ConsumerStatefulWidget {
  const SplashScreenView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SplashScreenViewState();
}

class _SplashScreenViewState extends ConsumerState<SplashScreenView> {
  _handleOnApplicationStartup() async {
    await ref.read(appDomain).init(
          onSuccess: () {
            NavigationService.instance
                .navigateToReplace(NavigatorRoutes.loginView);
          },
          onFailure: () {},
        );
  }

  @override
  void initState() {
    _handleOnApplicationStartup();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: AppText.heading1("LearnLeap"),),
    );
  }
}
