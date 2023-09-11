import 'package:flutter/material.dart';

import '../../../../core/core.dart';

class Tabs extends StatelessWidget {
  const Tabs({
    Key? key,
    required this.title,
    required this.backgroundColor,
    required this.textColor,
  }) : super(key: key);
  final Color backgroundColor;
  final String title;
  final Color textColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: const BorderRadius.all(Radius.circular(16)),
      ),
      width: 75,
      height: 36,
      child: Center(
        child: AppText.medium(
          title,
          fontWeight: FontWeight.w600,
          color: textColor,
        ),
      ),
    );
  }
}
