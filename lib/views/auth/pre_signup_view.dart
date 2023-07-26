import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:learn_leap/navigations/navigation_routes.dart';
import 'package:learn_leap/navigations/navigations_service.dart';
import 'package:learn_leap/views/widgets/app_button.dart';

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
              SvgPicture.asset(
                "assets/svg/signin2.svg",
              ),
              const Spacer(),
              AppButton.long("Sign up as a Tutor", onTap: () {
                NavigationService.instance
                    .navigateToReplace(NavigationRoutes.resgisterView);
              }),
              const SizedBox(height: 25),
              AppButton.long("Sign up as a Student", onTap: () {
                NavigationService.instance
                    .navigateToReplace(NavigationRoutes.resgisterView);
              }),
            ],
          ),
        ),
      ),
    );
  }
}
