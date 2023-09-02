import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learn_leap/core/core.dart';
import 'package:learn_leap/core/enums/enums.dart';
import 'package:learn_leap/core/services/file_picker_sevice.dart';
import 'package:learn_leap/models/dtos/create_course.dto.dart';
import 'package:learn_leap/views/view_states/view_states.dart';

import '../../../core/data/network/network.dart';
import '../../../core/data/remote/course/course.dart';

class CreateCourseViewModel extends BaseViewModel {
  final _logger = appLogger(CreateCourseViewModel);
  final CourseRepository _courseRepository;
  final FilePickerService _filePickerService;
  CreateCourseViewModel(this._courseRepository, this._filePickerService);

  File? _file;
  File? get file => _file;
  MediaType? _mediaType;

  File? _backgroundImage;
  File? get backgroundImage => _backgroundImage;
  Future<void> createCourse(String title, String description, String courseType,
      double? price) async {
    try {
      final dto = CreateCourseDTO(
        backgroundImage: _backgroundImage!,
        courseType: courseType,
        description: description,
        media: _file!,
        mediaType: _mediaType!,
        title: title,
        price: price,
      );
      changeState(const ViewModelState.busy());
      final response = await _courseRepository.createCourse(dto);

      changeState(const ViewModelState.idle());
    } on Failure catch (e) {
      _logger.e(e.message);
      changeState(ViewModelState.error(e));
    } catch (e) {
      _logger.e(e);
      final error =
          UserDefinedExceptions("Error", 'An unknown error occurred.');
      changeState(ViewModelState.error(error));
    }
  }

  removeFile() {
    _file = null;
    notifyListeners();
  }

  pickFile(MediaType mediaType) async {
    try {
      final result = await _filePickerService.pickFile(mediaType);
      if (result != null) {
        _file = result;
        _mediaType = mediaType;
        notifyListeners();
      }
    } catch (e) {
      _logger.e("Fialed to piack file ${e.toString()}");
    }
  }

  pickBackgroundImage() async {
    try {
      final result = await _filePickerService.pickFile(MediaType.Image);
      if (result != null) {
        _backgroundImage = result;
        notifyListeners();
      }
    } catch (e) {
      _logger.e("Failed to pick  file ${e.toString()}");
    }
  }
}

final createCourseViewModel =
    ChangeNotifierProvider.autoDispose<CreateCourseViewModel>((ref) {
  return CreateCourseViewModel(
    ref.read(courseRepositoryProvider),
    ref.read(filePickerServiceProvider),
  );
});
