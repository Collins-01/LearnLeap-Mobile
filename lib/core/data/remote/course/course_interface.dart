import 'package:learn_leap/models/dtos/dtos.dart';
import 'package:learn_leap/models/response_models/response_models.dart';

abstract class CourseInterface {
  Future<CoursesByTutorResponse> getAllCoursesByTutor();
  Future<CreateCourseResponse> createCourse(CreateCourseDTO dto);
  Future<CreateChpaterResponse> createChapter(CreateChapterDTO dto);
}

abstract class CourseRepository extends CourseInterface {}

abstract class CourseService extends CourseInterface {}
