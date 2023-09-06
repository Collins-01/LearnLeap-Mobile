import 'package:flutter/material.dart';
import 'package:learn_leap/models/data_models/data_models.dart';
import 'package:learn_leap/models/dtos/dtos.dart';
import 'package:learn_leap/models/response_models/response_models.dart';

abstract class CourseInterface {
  Future<CoursesByTutorResponse> getAllCoursesByTutor();
  Future<CreateCourseResponse> createCourse(CreateCourseDTO dto);
  ValueNotifier<List<Course>> get tutorCourses;
}

abstract class CourseRepository extends CourseInterface {}

abstract class CourseService extends CourseInterface {}
