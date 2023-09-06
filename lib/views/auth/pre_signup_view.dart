import 'package:flutter/material.dart';
import 'package:learn_leap/widgets/app_button.dart';
import '../../../core/core.dart';

class PreSignUpView extends StatelessWidget {
  const PreSignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 33.0, vertical: 33),
          child: Column(
            children: [
              Image.asset(
                ImageAssets.signIn2,
              ),
              const Spacer(),
              AppButton.long("Sign up as a Tutor", onTap: () {
                NavigationService.instance.navigateToReplace(
                    NavigatorRoutes.signUpView,
                    argument: {RoutingArgumentKey.role: true});
              }),
              const SizedBox(height: 25),
              AppButton.long("Sign up as a Student", onTap: () {
                NavigationService.instance.navigateToReplace(
                  NavigatorRoutes.signUpView,
                  argument: {RoutingArgumentKey.role: false},
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
