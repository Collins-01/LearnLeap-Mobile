import 'package:flutter/src/foundation/change_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learn_leap/core/data/remote/course/course.dart';
import 'package:learn_leap/models/data_models/course_model.dart';
import 'package:learn_leap/models/dtos/create_course.dto.dart';
import 'package:learn_leap/models/response_models/courses_by_tutor_response_model.dart';
import 'package:learn_leap/models/response_models/create_course_response_model.dart';

class CourseRepositoryImpl extends CourseRepository {
  final CourseService _courseService;
  CourseRepositoryImpl(this._courseService);

  @override
  Future<CreateCourseResponse> createCourse(CreateCourseDTO dto) async {
    return await _courseService.createCourse(dto);
  }

  @override
  Future<CoursesByTutorResponse> getAllCoursesByTutor() async {
    return await _courseService.getAllCoursesByTutor();
  }

  @override
  ValueNotifier<List<Course>> get tutorCourses => _courseService.tutorCourses;
}

final courseRepositoryProvider = Provider<CourseRepository>((ref) {
  return CourseRepositoryImpl(ref.read(courseServiceProvider));
});
