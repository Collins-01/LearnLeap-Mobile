import 'package:flutter/material.dart';
import 'package:learn_leap/utils/utils.dart';
import 'package:learn_leap/views/widgets/widgets.dart';

class ResetPasswordView extends StatelessWidget {
  ResetPasswordView({super.key});
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: SizingConfig.defaultPadding),
        child: SafeArea(
          child: Stack(
            children: [
              Positioned.fill(
                child: Padding(
                  padding: EdgeInsets.only(top: SizingConfig.topPadding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText.heading2("Reset password"),
                      AppText.caption("Set a new password for your login"),
                      const SizedBox(
                        height: 60,
                      ),
                      AppTextField(
                        title: "Password",
                        controller: passwordController,
                        hintText: "********",
                        isPassword: true,
                      ),
                      AppTextField(
                        title: "Confirm Password",
                        controller: confirmPasswordController,
                        hintText: "********",
                        isPassword: true,
                      ),
                    ],
                  ),
                ),
              ),
              const Positioned(
                bottom: 50,
                left: 0,
                right: 0,
                child: AppButton.long("Continue"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
