import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learn_leap/widgets/widgets.dart';
import 'viewmodels/signup_viewmodel.dart';
import '../../../core/core.dart';

class SignUpView extends ConsumerWidget {
  final bool isTutor;
  SignUpView({super.key, required this.isTutor});
  final TextEditingController emailController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final NavigationService _navigationService = NavigationService.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context, ref) {
    final vm = ref.watch(signUpViewModel);
    return LoaderPage(
      busy: vm.isBusy,
      // busy: false,
      cancelRequest: () => vm.cancelRequest(),
      child: Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: true,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Image.asset(
                      ImageAssets.signIn3,
                    ),
                    const SizedBox(height: 10),
                    AppTextField(
                      title: "FirstName",
                      controller: firstNameController,
                      hintText: "Collins",
                      validator: (value) =>
                          FieldValidators.string(value, 'FirstName'),
                    ),
                    AppTextField(
                      title: "LastName",
                      controller: lastNameController,
                      hintText: "Oriakhi",
                      validator: (value) =>
                          FieldValidators.string(value, 'LastName'),
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
                    const SizedBox(height: 10),
                    Center(
                      child: InkWell(
                        onTap: () {
                          _navigationService
                              .navigateToReplace(NavigatorRoutes.loginView);
                        },
                        child: Text.rich(
                          TextSpan(
                            text: "Already have an account? ",
                            style: mediumStyle,
                            children: [
                              TextSpan(
                                text: "Login",
                                style: mediumStyle.copyWith(
                                  color: AppColors.primaryColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 25),
                    AppButton.long("Sign Up", onTap: () {
                      if (!_formKey.currentState!.validate()) {
                        return;
                      }
                      vm.signUp(
                        emailController.text,
                        passwordController.text,
                        firstNameController.text,
                        lastNameController.text,
                        isTutor,
                      );
                    }),
                    SizedBox(
                      height: SizingConfig.defaultPadding * 2,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// SafeArea(
//             child: Stack(
//               children: [
//                 Positioned.fill(
//                   child: Padding(
//                     padding: const EdgeInsets.only(top: 50),
//                     child: Form(
//                       key: _formKey,
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           AppText.heading2("Sign up"),
//                           AppText.caption(
//                               "Sign up to access all the features and resources available to you."),
//                           const SizedBox(
//                             height: 60,
//                           ),
//                           AppTextField(
//                             title: "FirstName",
//                             controller: firstNameController,
//                             hintText: "Collins",
//                             validator: (value) => FieldValidators.string(value),
//                           ),
//                           AppTextField(
//                             title: "LastName",
//                             controller: lastNameController,
//                             hintText: "Oriakhi",
//                             validator: (value) => FieldValidators.string(value),
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
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//                 Positioned(
//                   bottom: 50,
//                   left: 0,
//                   right: 0,
//                   child: AppButton.long("Sign up", onTap: () {
//                     if (!_formKey.currentState!.validate()) {
//                       return;
//                     }
//                     vm.signUp(
//                       emailController.text,
//                       passwordController.text,
//                       firstNameController.text,
//                       lastNameController.text,
//                     );
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
//                             .navigateToReplace(NavigationRoutes.loginView);
//                       },
//                       child: Text.rich(
//                         TextSpan(
//                           text: "Already have an account? ",
//                           style: body,
//                           children: [
//                             TextSpan(
//                               text: "Log in",
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
//           ),