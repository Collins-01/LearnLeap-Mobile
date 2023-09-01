import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learn_leap/core/core.dart';
import 'package:learn_leap/models/dtos/create_course.dto.dart';
import 'package:learn_leap/views/view_states/view_states.dart';

import '../../../core/data/network/network.dart';
import '../../../core/data/remote/course/course.dart';

class CreateCourseViewModel extends BaseViewModel {
  final _logger = appLogger(CreateCourseViewModel);
  final CourseRepository _courseRepository;
  CreateCourseViewModel(this._courseRepository);

  Future<void> createCourse(String title, String description) async {
    try {
      final dto = CreateCourseDTO();
      changeState(const ViewModelState.busy());
      final response = await _courseRepository.createCourse(dto);

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

final createCourseViewModel =
    ChangeNotifierProvider.autoDispose<CreateCourseViewModel>((ref) {
  return CreateCourseViewModel(ref.read(courseRepositoryProvider));
});
