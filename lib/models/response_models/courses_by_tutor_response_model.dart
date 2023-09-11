// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import '../data_models/data_models.dart';

// import 'package:learn_leap/models/data_models/course_model.dart';

class CoursesByTutorResponse {
  final List<Course> courses;
  CoursesByTutorResponse({
    required this.courses,
  });

  CoursesByTutorResponse copyWith({
    List<Course>? courses,
  }) {
    return CoursesByTutorResponse(
      courses: courses ?? this.courses,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'courses': courses.map((x) => x.toMap()).toList(),
    };
  }

  factory CoursesByTutorResponse.fromMap(Map<String, dynamic> map) {
    return CoursesByTutorResponse(
      courses: List<Course>.from(
        (map['courses'] as List).map<Course>(
          (x) => Course.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory CoursesByTutorResponse.fromJson(String source) =>
      CoursesByTutorResponse.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'CoursesByTutorResponse(courses: $courses)';

  @override
  bool operator ==(covariant CoursesByTutorResponse other) {
    if (identical(this, other)) return true;

    return listEquals(other.courses, courses);
  }

  @override
  int get hashCode => courses.hashCode;
}
