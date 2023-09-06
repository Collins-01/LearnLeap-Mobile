import 'package:faker/faker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learn_leap/core/data/remote/course/course.dart';
import 'package:learn_leap/core/utils/utils.dart';
import 'package:learn_leap/models/data_models/data_models.dart';
import 'package:learn_leap/models/dtos/create_course.dto.dart';
import 'package:learn_leap/models/response_models/courses_by_tutor_response_model.dart';
import 'package:learn_leap/models/response_models/create_course_response_model.dart';

import '../../network/network.dart';

class CourseServiceImpl extends CourseService {
  final _faker = Faker();
  // ignore: non_constant_identifier_names
  final NAMESPACE = '/courses';
  final NetworkClient _client = NetworkClient();
  final _logger = appLogger(CourseServiceImpl);
  final ValueNotifier<List<Course>> _tutorCourses =
      ValueNotifier<List<Course>>([]);

  @override
  Future<CreateCourseResponse> createCourse(CreateCourseDTO dto) async {
    final data = Course(
      title: _faker.lorem.words(3).first,
      backgroundImage: _faker.image.image(),
      description: dto.description,
      price: dto.price ?? 0.0,
      chapters: 0,
      date: DateTime.now(),
      id: _faker.guid.guid(),
      author: "Oriakhi Collins",
      type: dto.courseType,
    );
    await Future.delayed(const Duration(seconds: 3));
    _logger.d("Newly Created course:: ${data.toMap()}");
    _tutorCourses.value = [data, ..._tutorCourses.value];
    return CreateCourseResponse();
  }

  @override
  Future<CoursesByTutorResponse> getAllCoursesByTutor() async {
    await Future.delayed(const Duration(seconds: 4));
    return CoursesByTutorResponse(
      courses: _tutorCourses.value,
    );
  }

  @override
  ValueNotifier<List<Course>> get tutorCourses => _tutorCourses;
}

final courseServiceProvider = Provider<CourseService>((ref) {
  return CourseServiceImpl();
});
