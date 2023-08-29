import 'package:learn_leap/core/data/remote/course/course.dart';
import 'package:learn_leap/core/utils/utils.dart';
import 'package:learn_leap/models/dtos/create_chapter.dto.dart';
import 'package:learn_leap/models/dtos/create_course.dto.dart';
import 'package:learn_leap/models/response_models/courses_by_tutor_response_model.dart';
import 'package:learn_leap/models/response_models/create_chpater_response.dart';
import 'package:learn_leap/models/response_models/create_course_response_model.dart';

import '../../network/network.dart';

class CourseServiceImpl extends CourseService {
  // ignore: non_constant_identifier_names
  final NAMESPACE = '/authentication';
  final NetworkClient _client = NetworkClient();
  final _logger = appLogger(CourseServiceImpl);
  @override
  Future<CreateChpaterResponse> createChapter(CreateChapterDTO dto) {
    throw UnimplementedError();
  }

  @override
  Future<CreateCourseResponse> createCourse(CreateCourseDTO dto) {
    // TODO: implement createCourse
    throw UnimplementedError();
  }

  @override
  Future<CoursesByTutorResponse> getAllCoursesByTutor() {
    // TODO: implement getAllCoursesByTutor
    throw UnimplementedError();
  }
}
