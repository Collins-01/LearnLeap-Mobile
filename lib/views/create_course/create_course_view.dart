// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:learn_leap/core/core.dart';
import 'package:learn_leap/extensions/context_extension.dart';
import 'package:learn_leap/widgets/widgets.dart';

import 'components/components.dart';

class CreateCourseView extends ConsumerWidget {
  CreateCourseView({super.key});
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _courseTypeController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: AppText.heading4("Create Course Studio"),
          elevation: 0.0,
        ),
        body: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: SizingConfig.defaultPadding),
          child: SingleChildScrollView(
            child: Column(
              children: [
                CreateCourseTextField(
                  controller: _titleController,
                  title: "Course Title",
                  hintText: "Differential Equation",
                ),
                CreateCourseTextField(
                  controller: _courseTypeController,
                  title: "Course Type",
                  hintText: "CSC",
                ),
                CreateCourseTextField(
                  controller: _descriptionController,
                  title: "Course Description",
                  hintText:
                      "Culpa incididunt eiusmod non mollit reprehenderit ut consequat et et consequat excepteur.",
                  isDescription: true,
                ),
                CreateCourseTextField(
                  controller: _priceController,
                  keyboardType: TextInputType.number,
                  title: "Course Price (Optional)",
                  hintText: "50.00",
                ),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MediaComponent(
                        title: "Audio",
                        icon: Icons.mic,
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (_) => const CreateMediaButtomSheet(
                              title1: "Record",
                              title2: "Gallery",
                            ),
                          );
                        },
                      ),
                      MediaComponent(
                        title: "Video",
                        icon: Icons.camera_alt_rounded,
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (_) => const CreateMediaButtomSheet(
                              title1: "Record a Video",
                              title2: "Gallery",
                            ),
                          );
                        },
                      ),
                      MediaComponent(
                        title: "Document",
                        icon: Icons.document_scanner,
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (_) => const CreateMediaButtomSheet(
                              title1: "Pick a Document",
                              isDocument: true,
                              title2: "",
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                AppButton.long(
                  "Create",
                  onTap: () {
                    print("Heyyyyyyy");
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MediaComponent extends StatelessWidget {
  final String title;
  final IconData icon;
  final void Function()? onTap;
  const MediaComponent({
    Key? key,
    required this.title,
    required this.icon,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 16,
        right: 16,
      ),
      child: Column(
        children: [
          GestureDetector(
            onTap: onTap,
            child: Container(
              height: 45,
              width: 45,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: AppColors.textFieldColor,
                borderRadius: const BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              child: Icon(icon),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          AppText.small(title)
        ],
      ),
    );
  }
}

class CreateMediaButtomSheet extends StatelessWidget {
  final String title1;
  final String title2;
  final bool isDocument;
  const CreateMediaButtomSheet({
    Key? key,
    required this.title1,
    required this.title2,
    this.isDocument = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      alignment: Alignment.center,
      width: context.getDeviceWidth,
      decoration: BoxDecoration(
        color: AppColors.textFieldColor,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: context.getDeviceWidth * 0.7,
            height: 50,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    isDocument ? AppColors.primaryColor : Colors.red,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(12),
                  ),
                ),
              ),
              child: AppText.regular(
                title1,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          isDocument
              ? const SizedBox.shrink()
              : SizedBox(
                  width: context.getDeviceWidth * 0.7,
                  height: 50,
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          color: AppColors.primaryColor,
                        ),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(12),
                        ),
                      ),
                    ),
                    onPressed: () {},
                    child: AppText.regular(
                      title2,
                    ),
                  ),
                )
        ],
      ),
    );
  }
}
