// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:learn_leap/core/core.dart';
import 'package:learn_leap/extensions/context_extension.dart';
import 'package:learn_leap/widgets/widgets.dart';

import '../../models/data_models/data_models.dart';

class CourseDetailsView extends StatelessWidget {
  final Course course;
  const CourseDetailsView({
    Key? key,
    required this.course,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: AppText.heading3(course.title),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: SizingConfig.defaultPadding),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppImage(
                url: course.backgroundImage,
                height: context.deviceHeightPercentage(percentage: 28),
                width: context.getDeviceWidth,
              ),
              const SizedBox(
                height: 10,
              ),
              AppText.heading4("Description"),
              const SizedBox(
                height: 5,
              ),
              AppText.regular(course.description),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  AppText.heading5(
                    "Author:  ",
                    color: AppColors.primaryColor,
                  ),
                  AppText.heading5(course.author)
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  AppText.heading5(
                    "Type:  ",
                    color: AppColors.primaryColor,
                  ),
                  AppText.heading5("Audio")
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  AppText.heading5(
                    "Date:  ",
                    color: AppColors.primaryColor,
                  ),
                  AppText.heading5("18/10/2003")
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              AppButton.long(
                "Enroll",
                onTap: () {
                  // ignore: avoid_print
                  print("Enrolling");
                },
              ),
              const SizedBox(
                height: 100,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
