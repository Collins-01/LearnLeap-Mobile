import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learn_leap/utils/utils.dart';
import 'package:learn_leap/views/widgets/widgets.dart';

import '../../navigations/navigations.dart';
import 'viewmodels/login_viewmodel.dart';

class LoginView extends ConsumerWidget {
  LoginView({super.key});
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final NavigationService _navigationService = NavigationService.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context, ref) {
    final vm = ref.watch(loginViewModel);
    return LoaderPage(
      // busy: vm.isBusy,
      busy: false,
      cancelRequest: () => vm.cancelRequest(),
      child: Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: SizingConfig.defaultPadding),
          child: SafeArea(
            child: Stack(
              children: [
                Positioned.fill(
                  child: Padding(
                    padding: EdgeInsets.only(top: SizingConfig.topPadding),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppText.heading2("Sign in"),
                          AppText.caption(
                              "Sign in to access all the features and resources available to you."),
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
                          Align(
                            alignment: Alignment.centerRight,
                            child: InkWell(
                              onTap: () {
                                _navigationService.navigateTo(
                                    NavigationRoutes.forgotPasswordView);
                              },
                              child: AppText.body(
                                "Forgot password?",
                                color: AppColors.blue,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 50,
                  left: 0,
                  right: 0,
                  child: AppButton.long("Sign in", onTap: () {
                    if (!_formKey.currentState!.validate()) {
                      return;
                    }
                    vm.login(emailController.text, passwordController.text);
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
                            .navigateTo(NavigationRoutes.resgisterView);
                      },
                      child: Text.rich(
                        TextSpan(
                          text: "Don't have an account? ",
                          style: body,
                          children: [
                            TextSpan(
                              text: "Sign up",
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
