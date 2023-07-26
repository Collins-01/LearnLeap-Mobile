import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
          child: Column(
            children: [
              SvgPicture.asset(
                "assets/svg/signin1.svg",
              ),
              AppText.heading2("Sign in"),
              const SizedBox(height: 10),
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
                isPassword: false,
                validator: FieldValidators.password,
              ),
              AppText.body(
                "Forgot password?",
                color: const Color(0xFF92929F),
              ),
              const SizedBox(height: 10),
              InkWell(
                onTap: () {},
                child: Container(
                  height: 55,
                  width: double.infinity,
                  decoration:  BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(12),
                    ),
                    border: Border.all()
                  ),
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset("assets/svg/google.svg"),
                      const SizedBox(width: 16),
                      AppText.body(
                        "Login with Google",
                        color: Colors.black,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Center(
                child: InkWell(
                  onTap: () {
                    _navigationService
                        .navigateTo(NavigationRoutes.preRegisterView);
                  },
                  child: Text.rich(
                    TextSpan(
                      text: "Don't have an account? ",
                      style: body.copyWith(
                        color: Colors.black,
                      ),
                      children: [
                        TextSpan(
                          text: "Sign up",
                          style: body.copyWith(
                            color: AppColors.primaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 25),
              AppButton.long("Sign in", onTap: () {
                if (!_formKey.currentState!.validate()) {
                  return;
                }
                vm.login(emailController.text, passwordController.text);
              })
            ],
          ),
        ),
      ),
    );
  }
}


//  Stack(
//               children: [
//                 Positioned.fill(
//                   child: Padding(
//                     padding: EdgeInsets.only(top: SizingConfig.topPadding),
//                     child: Form(
//                       key: _formKey,
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           AppText.heading2("Sign in"),
//                           AppText.caption(
//                               "Sign in to access all the features and resources available to you."),
//                           const SizedBox(
//                             height: 60,
//                           ),
//                           AppTextField(
//                             title: "Email",
//                             controller: emailController,
//                             hintText: "example@gmal.com",
//                             validator: FieldValidators.email,
//                           ),
//                           AppTextField(
//                             title: "Password",
//                             controller: passwordController,
//                             hintText: "********",
//                             isPassword: true,
//                             validator: FieldValidators.password,
//                           ),
//                           Align(
//                             alignment: Alignment.centerRight,
//                             child: InkWell(
//                               onTap: () {
//                                 _navigationService.navigateTo(
//                                     NavigationRoutes.forgotPasswordView);
//                               },
//                               child: AppText.body(
//                                 "Forgot password?",
//                                 color: AppColors.blue,
//                               ),
//                             ),
//                           )
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//                 Positioned(
//                   bottom: 50,
//                   left: 0,
//                   right: 0,
//                   child: AppButton.long("Sign in", onTap: () {
//                     if (!_formKey.currentState!.validate()) {
//                       return;
//                     }
//                     vm.login(emailController.text, passwordController.text);
//                   }),
//                 ),
//                 Positioned(
//                   bottom: 10,
//                   left: 0,
//                   right: 0,
//                   child: Center(
//                     child: InkWell(
//                       onTap: () {
//                         _navigationService
//                             .navigateTo(NavigationRoutes.resgisterView);
//                       },
//                       child: Text.rich(
//                         TextSpan(
//                           text: "Don't have an account? ",
//                           style: body,
//                           children: [
//                             TextSpan(
//                               text: "Sign up",
//                               style: body.copyWith(
//                                 color: AppColors.blue,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),