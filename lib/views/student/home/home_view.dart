import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learn_leap/views/student/home/components/home_card_section.dart';
import 'package:learn_leap/views/student/home/components/tabs.dart';

import '../../../core/core.dart';
import '../../../widgets/widgets.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  final TextEditingController _controller = TextEditingController();
  final PageController _pagecontroller = PageController(initialPage: 0);

  late int _selected = 0;
  List<String> course = [
    "All",
    "CSC",
    "MTH",
    "PHY",
    "CHM",
    "GLY",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                AppText.heading3("Welcome Love!"),
                Gap.h4,
                AppText.small("Get started today by enrolling for a course"),
                Gap.h16,
                Row(
                  children: [
                    Expanded(
                      child: AppTextField(
                        title: "Search",
                        controller: _controller,
                        hintText: "Looking for course material.....",
                        prefixIcon: const Padding(
                          padding: EdgeInsets.all(12.0),
                          child: SizedBox(
                            height: 19.222,
                            width: 18.764,
                            child: Icon(Icons.search_outlined),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
