// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learn_leap/core/core.dart';
import 'package:learn_leap/models/data_models/course_model.dart';
import 'package:learn_leap/views/home/components/course_card.dart';
import 'package:learn_leap/views/home/viewmodels/course_grid_section_viewmodel.dart';
import 'package:responsive_grid/responsive_grid.dart';

class CourseGridSection extends ConsumerStatefulWidget {
  final String type;
  const CourseGridSection({
    super.key,
    required this.type,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CourseGridSectionState();
}

class _CourseGridSectionState extends ConsumerState<CourseGridSection> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(courseGridSectionViewModel).getCourses(widget.type);
    });
  }

  @override
  Widget build(BuildContext context) {
    var vm = ref.watch(courseGridSectionViewModel);
    return vm.state.when(
      idle: () {
        return SingleChildScrollView(
          child: ResponsiveGridRow(
            children: [
              ...List.generate(
                10,
                (index) => ResponsiveGridCol(
                  xs: 6,
                  md: 3,
                  child: CourseCard(
                    course: Course.dummyData,
                  ),
                ),
              ),
            ],
          ),
        );
      },
      error: (e) => Center(
        child: Column(
          children: [
            AppText.heading5(e.title),
            const SizedBox(
              height: 8,
            ),
            AppText.regular(e.message),
          ],
        ),
      ),
      busy: () => const Center(child: CircularProgressIndicator.adaptive()),
    );
  }
}
