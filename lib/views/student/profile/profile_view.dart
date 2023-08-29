import 'package:flutter/material.dart';

import '../../../core/core.dart';
import '../../../widgets/widgets.dart';
import 'components/profile_Icon.dart';
import 'components/profile_card.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  // final NavigationService _navigationService = NavigationService.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Gap.h16,
                Center(child: AppText.heading3("Profile")),
                Gap.h24,
                const Center(child: ProfileImage()),
                Gap.h16,
                Center(child: AppText.heading3("Tommy Jason")),
                Gap.h8,
                Center(
                    child: AppText.small(
                  "tommyjason@gmail.com",
                  color: AppColors.primaryColor.withOpacity(0.2),
                )),
                Gap.h24,
                GestureDetector(
                  onTap: () {
                    // _navigationService
                    //     .navigateTo(NavigatorRoutes.accountInfoView);
                  },
                  child: const ProfileCard(
                    title: "Account Info",
                  ),
                ),
                Gap.h8,
                GestureDetector(
                  onTap: () {
                    // _navigationService
                    //     .navigateTo(NavigatorRoutes.changePasswordView);
                  },
                  child: const ProfileCard(
                    title: "Change Password",
                  ),
                ),
                Gap.h24,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
