import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learn_leap/core/data/network/failure.dart';
import 'package:learn_leap/core/data/remote/course/course.dart';

class TutorHomeViewmodel extends ChangeNotifier {
  final CourseRepository _courseRepository;
  TutorHomeViewmodel(this._courseRepository);

  getAllCourses() async {
    try {
      final response = await _courseRepository.getAllCoursesByTutor();
    } on Failure catch (e) {
      print(e.message);
    } catch (e) {
      print(e.toString());
    }
  }
}

final tutorHomeViewmodel = ChangeNotifierProvider<TutorHomeViewmodel>((ref) {
  return TutorHomeViewmodel(ref.read(courseRepositoryProvider));
});
