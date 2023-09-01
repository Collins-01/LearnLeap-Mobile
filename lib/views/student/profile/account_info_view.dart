import 'package:flutter/material.dart';

import '../../../core/core.dart';
import '../../../widgets/widgets.dart';
import 'components/profile_Icon.dart';

class AccountInfoView extends StatefulWidget {
  const AccountInfoView({super.key});

  @override
  State<AccountInfoView> createState() => _AccountInfoViewState();
}

class _AccountInfoViewState extends State<AccountInfoView> {
  // final NavigationService _navigationService = NavigationService.instance;
  bool move = false;
  // final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            // _navigationService.goBack();
                          },
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(12),
                                ),
                                border: Border.all(
                                  color:
                                      AppColors.primaryColor.withOpacity(0.2),
                                )),
                            alignment: Alignment.center,
                            child:
                                const Icon(Icons.keyboard_arrow_left_outlined),
                          ),
                        ),
                        const Gap.w(47),
                        AppText.heading3("Account Info"),
                      ],
                    ),
                    Gap.h16,
                    const Center(child: ProfileImage()),
                    Gap.h32,
                    AppText.button(
                      "Personal Info",
                      color: AppColors.primaryColor.withOpacity(0.5),
                    ),
                    Gap.h16,
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: AppColors.primaryColor.withOpacity(0.1),
                        ),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(11)),
                      ),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 48,
                            child: Row(
                              children: [
                                Expanded(
                                  child: AppText.medium(
                                    "Your name",
                                    fontWeight: FontWeight.w600,
                                    color:
                                        AppColors.primaryColor.withOpacity(0.5),
                                  ),
                                ),
                                AppText.medium(
                                  "Tommy Jason",
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.primaryColor,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 48,
                            child: Row(
                              children: [
                                Expanded(
                                  child: AppText.medium(
                                    "Occupation",
                                    fontWeight: FontWeight.w600,
                                    color:
                                        AppColors.primaryColor.withOpacity(0.5),
                                  ),
                                ),
                                AppText.medium(
                                  "Manager",
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.primaryColor,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 48,
                            child: Row(
                              children: [
                                Expanded(
                                  child: AppText.medium(
                                    "Employer",
                                    fontWeight: FontWeight.w600,
                                    color:
                                        AppColors.primaryColor.withOpacity(0.5),
                                  ),
                                ),
                                AppText.medium(
                                  "Overlay Design",
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.primaryColor,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Gap.h24,
                    AppText.button(
                      "Contact Info",
                      color: AppColors.primaryColor.withOpacity(0.5),
                    ),
                    Gap.h16,
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: AppColors.primaryColor.withOpacity(0.1),
                        ),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(11)),
                      ),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 48,
                            child: Row(
                              children: [
                                Expanded(
                                  child: AppText.medium(
                                    "Phone number",
                                    fontWeight: FontWeight.w600,
                                    color:
                                        AppColors.primaryColor.withOpacity(0.5),
                                  ),
                                ),
                                AppText.medium(
                                  "(1) 3256 8456 888",
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.primaryColor,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 48,
                            child: Row(
                              children: [
                                Expanded(
                                  child: AppText.medium(
                                    "Email",
                                    fontWeight: FontWeight.w600,
                                    color:
                                        AppColors.primaryColor.withOpacity(0.5),
                                  ),
                                ),
                                AppText.medium(
                                  "tommyjason@mail.com",
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.primaryColor,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Gap.h24,
                    AppText.button(
                      "KYC Status",
                      color: AppColors.primaryColor.withOpacity(0.5),
                    ),
                    Gap.h16,
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: AppColors.primaryColor.withOpacity(0.1),
                        ),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(11)),
                      ),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 48,
                            child: Row(
                              children: [
                                Expanded(
                                  child: AppText.medium(
                                    "Pending",
                                    fontWeight: FontWeight.w600,
                                    color:
                                        AppColors.primaryColor.withOpacity(0.5),
                                  ),
                                ),
                                AppText.medium(
                                  "Picture",
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.primaryColor,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 48,
                            child: Row(
                              children: [
                                Expanded(
                                  child: AppText.medium(
                                    "Pending",
                                    fontWeight: FontWeight.w600,
                                    color:
                                        AppColors.primaryColor.withOpacity(0.5),
                                  ),
                                ),
                                AppText.medium(
                                  "Govt Issued ID",
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.primaryColor,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 48,
                            child: Row(
                              children: [
                                Expanded(
                                  child: AppText.medium(
                                    "Pending",
                                    fontWeight: FontWeight.w600,
                                    color:
                                        AppColors.primaryColor.withOpacity(0.5),
                                  ),
                                ),
                                AppText.medium(
                                  "Address Verification",
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.primaryColor,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Gap.h(75)
                  ],
                ),
              ),
            ),
            Positioned(
                left: 24,
                right: 24,
                bottom: 10,
                child: AppButton(
                    onTap: () {
                      // _navigationService
                      //     .navigateToReplace(NavigatorRoutes.editAccountView);
                    },
                    title: "Edit"))
          ],
        ),
      ),
    );
  }
}
