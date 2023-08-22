import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learn_leap/core/utils/utils.dart';
import 'package:learn_leap/views/auth/viewmodels/forgot_passwrod_viewmodel.dart';

import '../../widgets/widgets.dart';

class ForgotPasswordView extends ConsumerWidget {
  ForgotPasswordView({Key? key}) : super(key: key);

  final TextEditingController emailController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context, ref) {
    final vm = ref.watch(forgotPasswordViewModel);
    return LoaderPage(
        // busy: vm.isBusy,
        busy: false,
        cancelRequest: () => vm.cancelRequest(),
        child: Scaffold(
          backgroundColor: Colors.white,
          resizeToAvoidBottomInset: false,
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.only(
                left: SizingConfig.defaultPadding,
                right: SizingConfig.defaultPadding,
                top: SizingConfig.topPadding,
              ),
              child: GestureDetector(
                onTap: () => FocusScope.of(context).unfocus(),
                child: SizedBox(
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppText.heading2("Forgot password"),
                              AppText.caption(
                                "Can’t remember password, we can recover it for you. Enter your registered email address",
                              ),
                              const SizedBox(
                                height: 60,
                              ),
                              AppTextField(
                                title: "Email",
                                controller: emailController,
                                hintText: "example@gmal.com",
                                validator: FieldValidators.email,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: SizingConfig.bottomPadding,
                        left: 0,
                        right: 0,
                        child: AppButton.long(
                          "Continue",
                          onTap: () {
                            if (!_formKey.currentState!.validate()) {
                              return;
                            }
                            vm.forgotPassword(emailController.text);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
