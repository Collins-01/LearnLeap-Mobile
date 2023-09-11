import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learn_leap/core/services/media_service.dart';
import 'package:learn_leap/core/utils/utils.dart';
import 'package:learn_leap/extensions/extensions.dart';
import 'package:ripple_wave/ripple_wave.dart';

class AudioRecordView extends ConsumerWidget {
  const AudioRecordView({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final mediaProvider = ref.watch(mediaServiceProvider);
    return Container(
      height: context.getDeviceHeight * 0.9,
      width: context.getDeviceWidth,
      decoration: BoxDecoration(
        color: AppColors.textFieldColor.withOpacity(.5),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 30,
          ),
          ValueListenableBuilder(
            valueListenable: mediaProvider.duration,
            builder: (context, value, child) => AppText.heading3(
              "".formatDuration(value),
            ),
          ),
          Expanded(
            child: ValueListenableBuilder(
              valueListenable: mediaProvider.isRecording,
              builder: (context, value, child) => RippleWave(
                color: Colors.green,
                repeat: value,
                child: const Icon(
                  Icons.emoji_emotions,
                  size: 100,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  if (!mediaProvider.isRecording.value) {
                    mediaProvider.recordAudio();
                  } else {
                    mediaProvider.stopRecording();
                  }
                  // Navigator.pop(context);
                },
                child: Container(
                  height: 60,
                  width: 60,
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              const SizedBox(
                width: 30,
              ),
              ValueListenableBuilder(
                  valueListenable: mediaProvider.isRecording,
                  builder: (context, value, child) => value
                      ? const SizedBox.shrink()
                      : TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: AppText.button("Done"),
                        )
                  // IconButton(
                  //     onPressed: () {
                  //       if (!mediaProvider.isRecording.value) {
                  //         mediaProvider.pauseRecording();
                  //       } else {
                  //         mediaProvider.resumeRecording();
                  //       }
                  //       // Navigator.pop(context);
                  //     },
                  //     icon: const Icon(Icons.play_arrow),
                  //   ),
                  )
            ],
          ),
          const SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}
