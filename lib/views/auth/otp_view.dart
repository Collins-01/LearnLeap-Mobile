import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learn_leap/utils/utils.dart';
import 'package:learn_leap/views/auth/viewmodels/otp_viewmodel.dart';

import '../widgets/widgets.dart';

class OtpView extends ConsumerWidget {
  final String email;
  OtpView({super.key, required this.email});
  final ValueNotifier<String> _currentCode = ValueNotifier("");
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vm = ref.watch(verifyOtpViewModel);
    return LoaderPage(
      busy: vm.isBusy,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Stack(
            children: [
              Positioned.fill(
                child: Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText.heading2("Verify OTP"),
                      AppText.caption(
                          "Sign up to access all the features and resources available to you."),
                      const SizedBox(
                        height: 100,
                      ),

                      //* OTP Field
                      OtpTextField(
                        numberOfFields: 5,
                        borderColor: AppColors.primaryColor,
                        //set to true to show as box or false to show as dash
                        showFieldAsBox: true,
                        fieldWidth: 45,
                        obscureText: true,
                        //runs when a code is typed in
                        onCodeChanged: (String code) {
                          _currentCode.value = code;
                          //handle validation or checks here
                        },
                        //runs when every textfield is filled
                        onSubmit: (String verificationCode) {
                          vm.verifyOtp(verificationCode, email);
                        }, // end onSubmit
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 50,
                left: 0,
                right: 0,
                child: AppButton.long("Verify", onTap: () {
                  final v = _currentCode.value;
                  if (v.length < 5) {
                    AppFlushBar.showError(
                        title: "Incomplete Code",
                        message:
                            "Please make sure the length of he code you entered is up to 5.");
                  }
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
