import 'package:flutter/material.dart';
import '../../../../core/core.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
            height: 100,
            width: 100,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: AppColors.primaryColor.withOpacity(0.2),
                  offset: const Offset(
                    0,
                    5.0,
                  ),
                  blurRadius: 10.0,
                  spreadRadius: 1.0,
                ), //BoxShadow
                const BoxShadow(
                  color: Colors.white,
                  offset: Offset(0.0, 0.0),
                  blurRadius: 0.0,
                  spreadRadius: 0.0,
                ), //BoxShadow
              ],
              color: Colors.white,
            ),
            child: Container(
              color: Colors.red,
            )

            // Image.asset(
            //   ImageAssets.img2,
            //   fit: BoxFit.cover,
            // ),
            ),
        const Positioned(
          top: 76,
          left: 61,
          child: Icon(Icons.edit_outlined),
        )
      ],
    );
  }
}
