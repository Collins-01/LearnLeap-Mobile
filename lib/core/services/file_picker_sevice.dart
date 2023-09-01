import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learn_leap/core/data/network/exceptions/user_defined_exception.dart';
import 'package:learn_leap/core/utils/app_logger.dart';

class FilePickerService {
  final _logger = appLogger(FilePickerService);
  Future<File?> pickFile() async {
    try {
      final response = await FilePicker.platform.pickFiles(
        allowedExtensions: ['pdf', 'doc'],
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
