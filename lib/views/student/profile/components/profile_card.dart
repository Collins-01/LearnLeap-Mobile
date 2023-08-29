import 'package:flutter/material.dart';
import '../../../../core/core.dart';
import '../../../../widgets/widgets.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({
    super.key,
    // required this.img,
    required this.title,
  });
  // final String img;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
            height: 48,
            width: 48,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColors.primaryColor.withOpacity(0.1),
              borderRadius: const BorderRadius.all(
                Radius.circular(12),
              ),
            ),
            child: Container(
              color: Colors.red,
            )
            // SvgPicture.asset(
            //   img,
            //   height: 24,
            //   width: 24,
            // ),
            ),
        Gap.w16,
        Expanded(
          child: AppText.medium(
            title,
            fontWeight: FontWeight.w500,
          ),
        ),
        Icon(
          Icons.keyboard_arrow_right_outlined,
          color: AppColors.primaryColor.withOpacity(0.5),
        )
      ],
    );
  }
}
