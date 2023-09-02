import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learn_leap/core/data/network/exceptions/user_defined_exception.dart';
import 'package:learn_leap/core/enums/enums.dart';
import 'package:learn_leap/core/utils/app_logger.dart';

class FilePickerService {
  final _logger = appLogger(FilePickerService);

  Map<MediaType, List<String>> supportedDocuments = {
    MediaType.Audio: ['mp3', 'wav', 'm4a'],
    MediaType.Document: ['doc', 'pdf'],
    MediaType.Video: ['mp4', 'mkv'],
    MediaType.Image: ['jpeg', 'jpg', 'png']
  };

  List<String> mapToArray(MediaType mediaType) {
    switch (mediaType) {
      case MediaType.Audio:
        return supportedDocuments[MediaType.Audio]!;

      case MediaType.Video:
        return supportedDocuments[MediaType.Video]!;

      case MediaType.Document:
        return supportedDocuments[MediaType.Document]!;

      case MediaType.Image:
        return supportedDocuments[MediaType.Image]!;

      default:
        return [];
    }
  }

  Future<File?> pickFile(MediaType mediaType) async {
    try {
      final response = await FilePicker.platform.pickFiles(
        allowedExtensions: mapToArray(mediaType),
        type: FileType.custom,
      );
      if (response != null) {
        final File file = File(response.files.single.path!);
        return file;
      } else {
        return null;
      }
    } catch (e) {
      _logger.e(e.toString());
      throw UserDefinedExceptions('Error', e.toString());
    }
  }
}

final filePickerServiceProvider = Provider<FilePickerService>((ref) {
  return FilePickerService();
});
