import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learn_leap/core/utils/utils.dart';
import 'package:learn_leap/views/create_course/create_course_view.dart';
import 'package:learn_leap/views/home/viewmodels/tutor_home_viewmodel.dart';

class TutorsHomeView extends ConsumerStatefulWidget {
  const TutorsHomeView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TutorsHomeViewState();
}

class _TutorsHomeViewState extends ConsumerState<TutorsHomeView> {
  @override
  void initState() {
    ref.read(tutorHomeViewmodel).getAllCourses();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final vm = ref.watch(tutorHomeViewmodel);
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: SizingConfig.defaultPadding,
            vertical: 40,
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText.heading4("Welcome Tutor Ryan"),
                      AppText.regular("Get started by creating a course"),
                    ],
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => CreateCourseView(),
                        ),
                      );
                    },
                    child: AppText.button(
                      "Create",
                      color: AppColors.primaryColor,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const Expanded(
                child: Column(
                  children: [],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
