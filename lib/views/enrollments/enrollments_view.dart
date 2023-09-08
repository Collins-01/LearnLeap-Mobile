import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learn_leap/models/data_models/data_models.dart';
import 'package:learn_leap/views/enrollments/components/enrollment_card.dart';
import 'package:learn_leap/views/enrollments/viewmodels/enrollment_viewmodel.dart';

import '../../core/utils/utils.dart';

class EnrollmentView extends ConsumerStatefulWidget {
  const EnrollmentView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _EnrollmentViewState();
}

class _EnrollmentViewState extends ConsumerState<EnrollmentView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(enrollmentViewModelProvider).getAllEnrollments();
    });
  }

  @override
  Widget build(BuildContext context) {
    var vm = ref.watch(enrollmentViewModelProvider);
    return Scaffold(
      appBar: AppBar(
        title: AppText.heading3("Enrollments"),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: SizingConfig.defaultPadding),
        child: ValueListenableBuilder(
          valueListenable: vm.enrolledCourses,
          builder: (context, items, child) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  // if (vm.isBusy)
                  //   const Center(child: CircularProgressIndicator.adaptive())
                  // else if (vm.isIdle && items.isEmpty)
                  //   Center(
                  //     child: AppText.regular(
                  //       "No enrolled course available.",
                  //     ),
                  //   )
                  // else if (vm.isError)
                  //   Text(vm.getError)
                  // else if (vm.isIdle && items.isNotEmpty)
                  ...List.generate(
                    // items.length,
                    10,
                    (index) => EnrollmentCard(
                      course: Enrollment(
                        type: 'PHY',
                        author: 'Albert Einstein',
                        image:
                            'https://images.unsplash.com/photo-1518837695005-2083093ee35b?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80',
                        time: DateTime.now(),
                        description:
                            'Mollit tempor tempor reprehenderit duis. Nisi id do dolor irure aliquip cillum consequat. Aute velit aliquip velit sit. Esse quis sunt qui veniam aliqua ex laboris amet cillum id. Officia velit consequat eu non culpa minim sunt velit adipisicing dolor elit et ea irure. Quis eu enim sit occaecat reprehenderit consectetur mollit quis minim. Reprehenderit duis duis aliquip non dolor esse qui nisi magna.',
                        id: '11',
                        title: 'Waves',
                        courseId: '',
                      ),
                    ),
                  )
                ],
              ),
            );
          },
        ),

        // Column(
        //   children: [
        //     EnrollmentCard(
        //       course: Course(
        //         type: 'PHY',
        //         author: 'Albert Einstein',
        //         backgroundImage:
        //             'https://images.unsplash.com/photo-1518837695005-2083093ee35b?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80',
        //         date: DateTime.now(),
        //         description: 'djkcbdcblkdbckdbcjkd',
        //         id: '11',
        //         price: 10.0,
        //         title: 'Waves',
        //       ),
        //     ),
        //   ],
        // ),
      ),
    );
  }
}
