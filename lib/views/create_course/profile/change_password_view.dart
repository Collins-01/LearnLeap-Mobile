import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/core.dart';
import '../../../widgets/widgets.dart';

// final resetPasswordViewModel =
//     ChangeNotifierProvider.autoDispose<ResetPasswordViewModel>((ref) {
//   return ResetPasswordViewModel();
// });

class ChangePasswordView extends ConsumerWidget {
  ChangePasswordView({super.key});
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confitrmPasswordController =
      TextEditingController();
  final TextEditingController previousPasswordController =
      TextEditingController();
  // final NavigationService _navigationService = NavigationService.instance;
  // final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context, ref) {
    // final vm = ref.watch(ResetPasswordViewModel);
    return LoaderPage(
      // busy: vm.isBusy,
      busy: false,
      // cancelRequest: () => vm.cancelRequest(),
      child: Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Gap.h6,
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
                            color: AppColors.primaryColor.withOpacity(0.2),
                          )),
                      alignment: Alignment.center,
                      child: const Icon(Icons.keyboard_arrow_left_outlined),
                    ),
                  ),
                  Gap.h32,
                  AppText.heading2("Create New Password"),
                  Gap.h8,
                  AppText.regular(
                    "Please, enter a new password below different from the previous password",
                    fontWeight: FontWeight.w400,
                    color: AppColors.primaryColor.withOpacity(0.5),
                  ),
                  Gap.h32,
                  AppTextField(
                    controller: previousPasswordController,
                    hintText: "Enter previous password",
                    isPassword: true,
                    validator: FieldValidators.password,
                    title: '',
                  ),
                  Gap.h16,
                  AppTextField(
                    controller: passwordController,
                    hintText: "New Password",
                    isPassword: true,
                    validator: FieldValidators.password,
                    title: '',
                  ),
                  Gap.h16,
                  AppTextField(
                    controller: confitrmPasswordController,
                    hintText: "Confirm Password",
                    isPassword: true,
                    validator: FieldValidators.password,
                    title: '',
                  ),
                  const Gap.h(125),
                  AppButton(
                    onTap: () {
                      // if (!_formKey.currentState!.validate()) {
                      //   return;
                      // }
                      // vm.login(emailController.text, passwordController.text);
                      // _navigationService.goBack();
                    },
                    title: "Create new password",
                  ),
                  Gap.h8,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
