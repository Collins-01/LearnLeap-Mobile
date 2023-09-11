import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learn_leap/core/domain/user_domain.dart';
import 'package:learn_leap/views/home/course_grid_section.dart';

import '../../../core/core.dart';
import '../../../widgets/widgets.dart';

class StudentHomeView extends ConsumerStatefulWidget {
  const StudentHomeView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<StudentHomeView>
    with SingleTickerProviderStateMixin {
  final TextEditingController _controller = TextEditingController();
  // final PageController _pagecontroller = PageController(initialPage: 0);

  List<String> courses = [
    "All",
    "CSC",
    "MTH",
    "PHY",
  ];
  @override
  Widget build(BuildContext context) {
    var user = ref.watch(userDomainProvider).currentUser.value;
    return DefaultTabController(
      length: courses.length,
      initialIndex: 0,
      animationDuration: const Duration(milliseconds: 500),
      child: Scaffold(
        body: SafeArea(
          child: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Gap.h20,
                  AppText.heading3("Welcome ${user?.firstName}!"),
                  Gap.h4,
                  AppText.small("Get started today by enrolling for a course"),
                  Gap.h16,
                  Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: 48,
                          child: TextField(
                            controller: _controller,
                            decoration: InputDecoration(
                              suffixIcon: _controller.text.isNotEmpty
                                  ? IconButton(
                                      onPressed: () {
                                        _controller.clear();
                                      },
                                      icon: const Icon(
                                        Icons.clear,
                                        size: 15,
                                      ),
                                    )
                                  : const SizedBox.shrink(),
                              hintStyle: mediumStyle,
                              hintText:
                                  "Search for any course of your choice..",
                              border: const OutlineInputBorder(),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TabBar(tabs: [
                    ...List.generate(
                      courses.length,
                      (index) => Tab(
                        text: courses[index],
                      ),
                    )
                  ]),
                  const SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: TabBarView(
                      children: [
                        ...List.generate(
                          courses.length,
                          (index) => CourseGridSection(
                            type: courses[index],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/*
 SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        ...List.generate(
                          course.length,
                          (index) => GestureDetector(
                            onTap: () {
                              _pagecontroller.jumpToPage(index);
                              _selected = index;
                              setState(() {});
                            },
                            child: Tabs(
                                title: course[index],
                                backgroundColor: _selected == index
                                    ? AppColors.primaryColor.withOpacity(0.1)
                                    : Colors.white,
                                textColor: _selected == index
                                    ? AppColors.textColor
                                    : AppColors.primaryColor.withOpacity(0.5)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Gap.h8,
                  Expanded(
                    child: PageView.builder(
                      controller: _pagecontroller,
                      scrollDirection: Axis.horizontal,
                      physics: const NeverScrollableScrollPhysics(),
                      // onPageChanged: (int page) {
                      //   setState(() {
                      //     _selected = page;
                      //   });
                      // },
                      itemCount: course.length,
                      itemBuilder: (context, index) => SingleChildScrollView(
                        child: HomeCardSection(
                          section: course[index],
                        ),
                      ),
                    ),
                  ),
                  Gap.h16,
*/
