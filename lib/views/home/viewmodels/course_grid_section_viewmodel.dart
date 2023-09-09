import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learn_leap/core/utils/utils.dart';
import 'package:learn_leap/views/view_states/view_states.dart';

import '../../../core/data/network/network.dart';
import '../../../core/data/remote/course/course.dart';
import '../../../models/data_models/data_models.dart';

class CourseGridSectionViewModel extends BaseViewModel {
  final _logger = appLogger(CourseGridSectionViewModel);
  final CourseRepository _courseRepository;
  CourseGridSectionViewModel(this._courseRepository);
  ValueNotifier<List<Course>> get _courseList => _courseRepository.tutorCourses;
  ValueNotifier<List<Course>> get courseList => _courseList;
  Future<void> getCourses(String type) async {
    _logger.d("Fetching courses for type :$type");
    try {
      changeState(const ViewModelState.busy());
      await Future.delayed(const Duration(seconds: 3));
      // await _courseRepository.ge();
      changeState(const ViewModelState.idle());
    } on Failure catch (e) {
      _logger.e(e.message);
      changeState(ViewModelState.error(e));
    } catch (e) {
      _logger.e(e);
      final error =
          UserDefinedExceptions("Error", 'An unknown error occurred.');
      changeState(ViewModelState.error(error));
    }
  }
}

final courseGridSectionViewModel =
    ChangeNotifierProvider<CourseGridSectionViewModel>((ref) {
  return CourseGridSectionViewModel(
    ref.read(courseRepositoryProvider),
  );
});
