// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:learn_leap/core/core.dart';
import 'package:learn_leap/extensions/context_extension.dart';
import 'package:learn_leap/models/data_models/data_models.dart';
import 'package:learn_leap/widgets/widgets.dart';

class EnrollmentInfoView extends ConsumerWidget {
  final Enrollment enrollment;
  const EnrollmentInfoView({
    super.key,
    required this.enrollment,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.delete,
              color: Colors.red,
            ),
          ),
        ],
        title: AppText.heading3(enrollment.title),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: SizingConfig.defaultPadding),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppImage(
                height: context.deviceHeightPercentage(percentage: 28),
                width: context.getDeviceWidth,
                url: enrollment.image,
              ),
              const SizedBox(
                height: 10,
              ),
              const SizedBox(
                height: 10,
              ),
              AppText.regular(enrollment.type),
              const SizedBox(
                height: 10,
              ),
              AppText.medium(enrollment.description),
              const SizedBox(
                height: 10,
              ),
              AppText.medium(enrollment.author),
              const SizedBox(
                height: 10,
              ),
              AppText.caption("12/03/2023")
            ],
          ),
        ),
      ),
    );
  }
}
