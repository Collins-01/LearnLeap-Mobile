import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learn_leap/core/data/remote/course/course.dart';
import 'package:learn_leap/models/data_models/data_models.dart';
import 'package:learn_leap/views/view_states/view_states.dart';
import 'package:learn_leap/widgets/widgets.dart';

import '../../../core/data/network/network.dart';

class EnrollmentViewModel extends BaseViewModel {
  final CourseRepository _courseRepository;
  EnrollmentViewModel(this._courseRepository);

  ValueNotifier<List<Enrollment>> get _enrolledCourses =>
      _courseRepository.enrolledCourses;
  ValueNotifier<List<Enrollment>> get enrolledCourses => _enrolledCourses;

  getAllEnrollments() async {
    try {
      changeState(const ViewModelState.busy());
      await Future.delayed(const Duration(seconds: 3));
      // await _courseRepository.getAllEnrolledCourses();
      changeState(const ViewModelState.idle());
    } on Failure catch (e) {
      changeState(ViewModelState.error(e));
      AppFlushBar.showError(title: e.title, message: e.message);
    } catch (e) {
      final error = UserDefinedExceptions(
        "Unhandled",
        e.toString(),
      );
      changeState(
        ViewModelState.error(error),
      );
      AppFlushBar.showError(title: error.title, message: error.message);
    }
  }
}

final enrollmentViewModelProvider = ChangeNotifierProvider<EnrollmentViewModel>(
  (ref) => EnrollmentViewModel(
    ref.read(courseRepositoryProvider),
  ),
);
