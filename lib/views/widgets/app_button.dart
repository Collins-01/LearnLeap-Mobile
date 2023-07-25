import 'package:flutter/material.dart';
import 'package:learn_leap/extensions/extensions.dart';
import 'package:learn_leap/utils/utils.dart';

import 'app_text.dart';

class AppButton extends StatelessWidget {
  final String title;
  final void Function()? onTap;

  const AppButton.long(this.title, {super.key, this.onTap});
  // const AppButton({Key? key, required this.title, this.onTap})
  //     : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 55,
        width: context.getDeviceWidth,
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: const BorderRadius.all(
            Radius.circular(12),
          ),
        ),
        alignment: Alignment.center,
        child: AppText.heading6(
          title,
          color: Colors.white,
        ),
      ),
    );
  }
}
