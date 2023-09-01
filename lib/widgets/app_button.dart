import 'package:flutter/material.dart';
import 'package:learn_leap/core/utils/utils.dart';

class AppButton extends StatelessWidget {
  final String title;
  final void Function()? onTap;
  final Color? buttonColor;

  const AppButton.long(this.title, {super.key, this.onTap, this.buttonColor});
  const AppButton({Key? key, required this.title, this.onTap, this.buttonColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55,
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor ?? AppColors.primaryColor,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(12),
            ),
          ),
        ),
        child: AppText.heading6(
          title,
          color: Colors.white,
        ),
      ),
    );
  }
}
// InkWell(
//       onTap: onTap,
//       child: Container(
//         height: 55,
//         width: context.getDeviceWidth,
//         decoration: BoxDecoration(
//           color: AppColors.primaryColor,
//           borderRadius: const BorderRadius.all(
//             Radius.circular(12),
//           ),
//         ),
//         alignment: Alignment.center,
//         child: AppText.heading6(
//           title,
//           color: Colors.white,
//         ),
//       ),
//     );