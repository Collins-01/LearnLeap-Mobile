import 'package:flutter/material.dart';

import '../../../../core/core.dart';
import '../../../../widgets/widgets.dart';

class EditAccountCard extends StatelessWidget {
  const EditAccountCard(
      {super.key,
      required this.controller,
      required this.title,
      required this.text});
  final String title;
  final String text;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText.button(title),
        Gap.h12,
        AppTextField(
          hintText: text,
          controller: controller,
          title: 'vvv',
        )
      ],
    );
  }
}

class EditAccountCard2 extends StatelessWidget {
  const EditAccountCard2(
      {super.key,
      required this.controller,
      required this.title,
      required this.text});
  final String title;
  final String text;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText.button(title),
        Gap.h12,
        GestureDetector(
          // onTap: () => showOccupationBottomSheet(
          //   context,
          // ),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 21, horizontal: 16),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(16)),
              color: AppColors.blue,
            ),
            child: Row(
              children: [
                Expanded(
                  child: AppText.regular(
                    text,
                    color: AppColors.blue,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Icon(
                  Icons.keyboard_arrow_down_rounded,
                  color: AppColors.blue,
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
