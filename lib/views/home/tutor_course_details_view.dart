// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:learn_leap/core/core.dart';
import 'package:learn_leap/extensions/extensions.dart';
import 'package:learn_leap/models/data_models/course_model.dart';
import 'package:learn_leap/widgets/widgets.dart';

class TutorCourseDetailsView extends StatelessWidget {
  final Course course;
  const TutorCourseDetailsView({
    Key? key,
    required this.course,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppText.heading3(course.title),
        centerTitle: true,
        actions: const [
          // IconButton(
          //   onPressed: () {},
          //   icon: const Icon(
          //     Icons.delete,
          //     color: Colors.red,
          //   ),
          // )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: SizingConfig.defaultPadding,
        ),
        child: Column(
          children: [
            //
            AppImage(
              fit: BoxFit.cover,
              borderRadius: const BorderRadius.all(
                Radius.circular(8),
              ),
              url: course.backgroundImage,
              height: context.getDeviceHeight * 0.3,
              width: context.getDeviceWidth,
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppText.heading5("Enrollments"),
                      Row(
                        children: [
                          AppText.regular("800"),
                          const SizedBox(
                            width: 5,
                          ),
                          const Icon(
                            Icons.keyboard_arrow_down_outlined,
                          ),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppText.heading5("Reviews"),
                      Row(
                        children: [
                          AppText.regular("300"),
                          const SizedBox(
                            width: 5,
                          ),
                          const Icon(
                            Icons.keyboard_arrow_down_outlined,
                          ),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppText.heading5("Type"),
                      AppText.regular(course.type),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppText.heading5("Media"),
                      AppText.regular("Audio"),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppText.heading5("Date"),
                      AppText.regular("01/09/2023"),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(
              height: context.getDeviceHeight / 10,
            ),
            AppButton.long(
              "Delete",
              buttonColor: Colors.red,
              onTap: () {},
            )
          ],
        ),
      ),
    );
  }
}
