import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learn_leap/core/core.dart';
import 'package:learn_leap/core/data/network/network.dart';
import 'package:learn_leap/core/data/remote/course/course.dart';
import 'package:learn_leap/models/data_models/course_model.dart';
import 'package:learn_leap/views/view_states/base_viewmodel.dart';
import 'package:learn_leap/views/view_states/view_model_state.dart';

class TutorHomeViewmodel extends BaseViewModel {
  final _logger = appLogger(TutorHomeViewmodel);
  final CourseRepository _courseRepository;
  TutorHomeViewmodel(this._courseRepository);
  ValueNotifier<List<Course>> get _courseList => _courseRepository.tutorCourses;
  ValueNotifier<List<Course>> get courseList => _courseList;
  Future<void> getAllCourses() async {
    try {
      changeState(const ViewModelState.busy());
      await _courseRepository.getAllCoursesByTutor();
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

final tutorHomeViewmodel = ChangeNotifierProvider<TutorHomeViewmodel>((ref) {
  return TutorHomeViewmodel(ref.read(courseRepositoryProvider));
});
