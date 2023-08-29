import 'package:flutter/material.dart';

import '../../../core/core.dart';
import '../../../widgets/widgets.dart';
import 'components/edit_card.dart';

class EditAccountView extends StatelessWidget {
  EditAccountView({super.key});

  // final NavigationService _navigationService = NavigationService.instance;

  final TextEditingController controller = TextEditingController();
  final TextEditingController controller1 = TextEditingController();
  final TextEditingController controller2 = TextEditingController();
  final TextEditingController controller3 = TextEditingController();

  // final List<TextInputFormatter> inputFormatters;

  // final FocusNode? focusNode;

  // final TextInputAction? textInputAction;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          // _navigationService.navigateToReplace(
                          //     NavigatorRoutes.accountInfoView);
                        },
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(12),
                              ),
                              border: Border.all(
                                color: AppColors.primaryColor.withOpacity(0.2),
                              )),
                          alignment: Alignment.center,
                          child: const Icon(Icons.keyboard_arrow_left_outlined),
                        ),
                      ),
                      const Gap.w(47),
                      AppText.heading3("Edit Account"),
                    ],
                  ),
                  Gap.h24,
                  EditAccountCard(
                    controller: controller,
                    title: "Your name",
                    text: "Amoda Ogunlere",
                  ),
                  Gap.h24,
                  EditAccountCard2(
                    controller: controller1,
                    title: "Occupation",
                    text: "Manager",
                  ),
                  Gap.h24,
                  EditAccountCard(
                    controller: controller2,
                    title: "Employer",
                    text: "Overlay Design",
                  ),
                  Gap.h24,
                  EditAccountCard(
                    controller: controller3,
                    title: "Phone number",
                    text: "(1) 3256 8456 888",
                  ),
                  Gap.h24,
                  EditAccountCard(
                    controller: controller,
                    title: "Email",
                    text: "tommyjason@mail.com",
                  ),
                  Gap.h26,
                  AppButton(
                    title: "Save",
                    onTap: () {
                      // _navigationService
                      //     .navigateToReplace(NavigatorRoutes.accountInfoView);
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
