import 'package:faker/faker.dart';
import 'package:learn_leap/core/data/remote/course/course.dart';
import 'package:learn_leap/core/utils/utils.dart';
import 'package:learn_leap/models/data_models/data_models.dart';
import 'package:learn_leap/models/dtos/create_chapter.dto.dart';
import 'package:learn_leap/models/dtos/create_course.dto.dart';
import 'package:learn_leap/models/response_models/courses_by_tutor_response_model.dart';
import 'package:learn_leap/models/response_models/create_chpater_response.dart';
import 'package:learn_leap/models/response_models/create_course_response_model.dart';

import '../../network/network.dart';

class CourseServiceImpl extends CourseService {
  final _faker = Faker();
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
  Future<CoursesByTutorResponse> getAllCoursesByTutor() async {
    List<Course> courses = [
      ...List.generate(
        10,
        (index) => Course(
          title: _faker.job.title(),
          backgroundImage: _faker.image.image(),
          description: _faker.lorem.sentences(3).toString(),
          price: 0.00,
          chapters: 7,
          date: _faker.date.dateTime(),
          id: _faker.guid.guid(),
          author: _faker.person.name(),
        ),
      )
    ];
    await Future.delayed(const Duration(seconds: 2));
    return CoursesByTutorResponse(courses: courses);
  }
}
