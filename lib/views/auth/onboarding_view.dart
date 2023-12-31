import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:learn_leap/widgets/app_button.dart';
import '../../../core/core.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 33.0, vertical: 33),
          child: Column(
            children: [
              SvgPicture.asset(
                "assets/svg/onboarding.svg",
              ),
              const Spacer(),
              AppButton.long("Get Started", onTap: () {
                NavigationService.instance
                    .navigateToReplace(NavigatorRoutes.loginView);
              }),
            ],
          ),
        ),
      ),
    );
  }
}
