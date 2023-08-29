// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:learn_leap/core/core.dart';

class CreateCourseTextField extends StatelessWidget {
  final String title;
  final TextEditingController controller;
  final bool isCourseType;
  final void Function()? onTap;
  final String hintText;
  final bool isDescription;
  final TextInputType? keyboardType;

  const CreateCourseTextField({
    Key? key,
    required this.title,
    required this.controller,
    this.isCourseType = false,
    this.onTap,
    this.keyboardType,
    required this.hintText,
    this.isDescription = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText.regular(
            title,
            fontWeight: FontWeight.w500,
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            height: isDescription ? null : 50,
            child: TextFormField(
              keyboardType: keyboardType,
              // enabled: isCourseType,
              onTap: onTap,
              controller: controller,
              maxLines: isDescription ? 6 : null,
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: mediumStyle,
                contentPadding: const EdgeInsets.only(
                  left: 12,
                  top: 12,
                  right: 12,
                ),
                border: const OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 0.5,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
