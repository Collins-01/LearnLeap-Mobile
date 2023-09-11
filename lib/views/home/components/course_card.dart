import 'package:flutter/material.dart';
import 'package:learn_leap/core/utils/utils.dart';
import 'package:learn_leap/models/data_models/course_model.dart';
import 'package:learn_leap/views/home/course_detail_view.dart';
import 'package:learn_leap/widgets/widgets.dart';

class CourseCard extends StatelessWidget {
  final Course course;
  const CourseCard({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => CourseDetailsView(course: course),
            ),
          );
        },
        child: Card(
          color: Colors.grey.shade100,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          child: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            height: 200,
            width: 200,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppImage(
                  height: 120,
                  width: 200,
                  fit: BoxFit.cover,
                  url: course.backgroundImage,
                ),
                const SizedBox(
                  height: 8,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 5,
                    left: 6,
                    right: 6,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText.heading6(course.title),
                      const SizedBox(
                        height: 3,
                      ),
                      AppText.caption(
                        course.type,
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppText.caption(
                            course.author,
                          ),
                          Row(
                            children: [
                              AppText.caption("4.5"),
                              const Icon(
                                Icons.star,
                                size: 13,
                                color: Colors.amber,
                              )
                            ],
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
      ),
    );
  }
}
