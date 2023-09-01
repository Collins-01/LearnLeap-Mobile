import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:learn_leap/core/utils/app_logger.dart';
import 'package:record/record.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MediaService {
  final _logger = appLogger(MediaService);
  final _record = Record();
  File? _mediaFile;
  final ValueNotifier<Duration> _duration = ValueNotifier(Duration.zero);
  ValueNotifier<Duration> get duration => _duration;
  Duration _recordedDuration = Duration.zero;

  File? get mediaFile => _mediaFile;
  final ValueNotifier<bool> _isRecording = ValueNotifier<bool>(false);
  ValueNotifier<bool> get isRecording => _isRecording;
  Timer? _timer;

  recordAudio() async {
    try {
      if (await _record.hasPermission()) {
        _isRecording.value = true;
        await _record.start();
        _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
          _recordedDuration = _recordedDuration + const Duration(seconds: 1);
          _duration.value = _recordedDuration;
        });
      }
    } catch (e) {
      _logger.e("Error Recording Audio", error: e.toString());
    }
  }

  pauseRecording() async {
    _isRecording.value = false;
    await _record.pause();
    cancelTimer();
  }

  resumeRecording() async {
    _isRecording.value = true;
    await _record.resume();
    _timer = Timer(const Duration(seconds: 1), () {
      _recordedDuration = _recordedDuration + const Duration(seconds: 1);
      _duration.value = _recordedDuration;
    });
  }

  stopRecording() async {
    _isRecording.value = false;
    final result = await _record.stop();
    cancelTimer();
    _recordedDuration = Duration.zero;
    if (result != null) {
      _mediaFile = File(result);
    } else {
      print('No audio file.');
    }
  }

  cancelTimer() {
    _timer?.cancel();
  }
}

final mediaServiceProvider = Provider<MediaService>((ref) {
  return MediaService();
});
