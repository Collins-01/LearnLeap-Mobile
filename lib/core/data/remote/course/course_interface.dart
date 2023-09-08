import 'package:flutter/material.dart';
import 'package:learn_leap/models/data_models/data_models.dart';
import 'package:learn_leap/models/dtos/dtos.dart';
import 'package:learn_leap/models/response_models/response_models.dart';

abstract class CourseInterface {
  Future<CoursesByTutorResponse> getAllCoursesByTutor();
  Future<CreateCourseResponse> createCourse(CreateCourseDTO dto);
  ValueNotifier<List<Course>> get tutorCourses;
  //* Enrollments
  ValueNotifier<List<Enrollment>> get enrolledCourses;
  Future<List<Enrollment>> getAllEnrolledCourses();
  Future<void> removeEnrollment(String courseId);
  Future<void> enrollCourse(String id);
}

abstract class CourseRepository extends CourseInterface {}

abstract class CourseService extends CourseInterface {}
