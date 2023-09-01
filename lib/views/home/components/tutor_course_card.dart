// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:learn_leap/core/utils/utils.dart';
import 'package:learn_leap/extensions/extensions.dart';
import 'package:learn_leap/models/data_models/data_models.dart';
import 'package:learn_leap/widgets/widgets.dart';

class TutorCourseCard extends StatelessWidget {
  final Course course;
  const TutorCourseCard({
    Key? key,
    required this.course,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppImage(
                fit: BoxFit.cover,
                borderRadius: const BorderRadius.all(
                  Radius.circular(8),
                ),
                url: course.backgroundImage,
                height: context.getDeviceHeight * 0.26,
                width: context.getDeviceWidth,
              ),
              const SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppText.button(course.title),
                        AppText.caption(course.type)
                      ],
                    ),
                    const SizedBox(height: 5),
                    AppText.medium(
                      course.description,
                      maxLines: 3,
                      fontWeight: FontWeight.w400,
                    ),
                    const SizedBox(height: 5),
                    AppText.caption("01/09/2023 5:51")
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
