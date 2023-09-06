import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learn_leap/core/core.dart';
import 'package:learn_leap/core/domain/user_domain.dart';
import 'package:learn_leap/views/home/components/components.dart';
import 'package:learn_leap/views/home/viewmodels/tutor_home_viewmodel.dart';

class TutorsHomeView extends ConsumerStatefulWidget {
  const TutorsHomeView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TutorsHomeViewState();
}

class _TutorsHomeViewState extends ConsumerState<TutorsHomeView> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(tutorHomeViewmodel).getAllCourses();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final vm = ref.watch(tutorHomeViewmodel);
    final currentUser = ref.watch(userDomainProvider).currentUser.value;
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
                      AppText.heading4("Welcome  ${currentUser?.firstName}"),
                      AppText.regular("Get started by creating a course"),
                    ],
                  ),
                  TextButton(
                    onPressed: () {
                      NavigationService.instance
                          .navigateTo(NavigatorRoutes.createCourseView);
                      // Navigator.of(context).push(
                      //   MaterialPageRoute(
                      //     builder: (_) => CreateCourseView(),
                      //   ),
                      // );
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
              Expanded(
                child: ValueListenableBuilder(
                    valueListenable: vm.courseList,
                    builder: (context, items, child) {
                      return SingleChildScrollView(
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 40,
                            ),
                            if (vm.isBusy)
                              const CircularProgressIndicator.adaptive()
                            else if (vm.isIdle && items.isEmpty)
                              AppText.regular("No Course available.")
                            else if (vm.isError)
                              Text(vm.getError)
                            else if (vm.isIdle && items.isNotEmpty)
                              ...List.generate(
                                items.length,
                                (index) => TutorCourseCard(
                                  course: items[index],
                                ),
                              )
                          ],
                        ),
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
