import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learn_leap/core/domain/user_domain.dart';

import '../../../core/core.dart';
import '../../../widgets/widgets.dart';
import 'components/profile_card.dart';

class ProfileView extends ConsumerWidget {
  const ProfileView({super.key});

  // final NavigationService _navigationService = NavigationService.instance;
  @override
  Widget build(BuildContext context, ref) {
    var currentUser = ref.watch(userDomainProvider).currentUser.value;
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
                Center(
                  child: Container(
                    height: 120,
                    width: 120,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.primaryColor,
                    ),
                    child: AppText.heading1(
                      "${currentUser!.lastName.characters.first}${currentUser.firstName.characters.first}",
                      color: Colors.white,
                    ),
                  ),
                ),
                Gap.h16,
                Center(
                  child: AppText.heading3(
                    "${currentUser.lastName} ${currentUser.firstName}",
                  ),
                ),
                Gap.h8,
                Center(
                    child: AppText.medium(
                  currentUser.email,
                )),
                Gap.h24,
                GestureDetector(
                  onTap: () {
                    // _navigationService
                    //     .navigateTo(NavigatorRoutes.accountInfoView);
                  },
                  child: const ProfileCard(
                    title: "Account Info",
                    icon: Icons.account_box_outlined,
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
                    icon: Icons.lock_open,
                  ),
                ),
                Gap.h8,
                GestureDetector(
                  onTap: () {},
                  child: const ProfileCard(
                    title: "Logout",
                    icon: Icons.login,
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
