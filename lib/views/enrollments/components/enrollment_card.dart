import 'package:flutter/material.dart';
import 'package:learn_leap/core/core.dart';
import 'package:learn_leap/extensions/extensions.dart';
import 'package:learn_leap/models/data_models/data_models.dart';
import 'package:learn_leap/views/enrollments/enrollment_info_view.dart';
import 'package:learn_leap/widgets/widgets.dart';

class EnrollmentCard extends StatelessWidget {
  final Enrollment course;
  const EnrollmentCard({
    Key? key,
    required this.course,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => EnrollmentInfoView(
              enrollment: course,
            ),
          ),
        );
      },
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
                url: course.image,
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppText.caption("01/09/2023 5:51"),
                        AppText.caption(
                          course.author,
                        )
                      ],
                    )
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
