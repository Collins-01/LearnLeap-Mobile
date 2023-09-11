import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learn_leap/core/utils/utils.dart';
import 'package:learn_leap/extensions/context_extension.dart';

class DownloadsView extends ConsumerStatefulWidget {
  const DownloadsView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DownloadsViewState();
}

class _DownloadsViewState extends ConsumerState<DownloadsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppText.heading3("Downloads"),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: SizingConfig.defaultPadding,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Card(
                color: Colors.grey.shade100,
                child: SizedBox(
                  width: context.getDeviceWidth,
                  child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 12,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppText.heading5("Electrolysis"),
                              const SizedBox(
                                height: 4,
                              ),
                              AppText.medium("Prof. Dalton"),
                              const SizedBox(
                                height: 4,
                              ),
                              Row(
                                children: [
                                  AppText.caption("Audio"),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  AppText.caption("12MB"),
                                ],
                              )
                            ],
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.delete,
                              color: Colors.red,
                            ),
                          )
                        ],
                      )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
