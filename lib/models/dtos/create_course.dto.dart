// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:learn_leap/core/enums/enums.dart';

class CreateCourseDTO {
  final String title;
  final String description;
  final String courseType;
  final double? price;
  final MediaType mediaType;
  final File media;
  final File backgroundImage;
  CreateCourseDTO({
    required this.title,
    required this.description,
    required this.courseType,
    this.price,
    required this.mediaType,
    required this.media,
    required this.backgroundImage,
  });
}
