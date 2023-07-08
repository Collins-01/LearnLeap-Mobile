import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learn_leap/navigations/navigations.dart';
import 'package:learn_leap/utils/utils.dart';
import 'package:learn_leap/views/widgets/widgets.dart';

import 'viewmodels/signup_viewmodel.dart';

class SignUpView extends ConsumerWidget {
  SignUpView({super.key});
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final NavigationService _navigationService = NavigationService.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context, ref) {
    final vm = ref.watch(signUpViewModel);
    return LoaderPage(
      // busy: vm.isBusy,
      busy: false,
      cancelRequest: () => vm.cancelRequest(),
      child: Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SafeArea(
            child: Stack(
              children: [
                Positioned.fill(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppText.heading2("Sign up"),
                          AppText.caption(
                              "Sign up to access all the features and resources available to you."),
                          const SizedBox(
                            height: 60,
                          ),
                          AppTextField(
                            title: "Email",
                            controller: emailController,
                            hintText: "example@gmal.com",
                            validator: FieldValidators.email,
                          ),
                          AppTextField(
                            title: "Password",
                            controller: passwordController,
                            hintText: "********",
                            isPassword: true,
                            validator: FieldValidators.password,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 50,
                  left: 0,
                  right: 0,
                  child: AppButton.long("Sign up", onTap: () {
                    if (!_formKey.currentState!.validate()) {
                      return;
                    }
                    vm.signUp(emailController.text, passwordController.text);
                  }),
                ),
                Positioned(
                  bottom: 10,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: InkWell(
                      onTap: () {
                        _navigationService
                            .navigateToReplace(NavigationRoutes.loginView);
                      },
                      child: Text.rich(
                        TextSpan(
                          text: "Already have an account? ",
                          style: body,
                          children: [
                            TextSpan(
                              text: "Log in",
                              style: body.copyWith(
                                color: AppColors.blue,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
