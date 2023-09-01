// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:learn_leap/core/core.dart';
import 'package:learn_leap/core/services/file_picker_sevice.dart';
import 'package:learn_leap/core/services/media_service.dart';
import 'package:learn_leap/extensions/context_extension.dart';
import 'package:learn_leap/views/create_course/audio_record_view.dart';
import 'package:learn_leap/views/create_course/viewmodels/create_course_viewmodel.dart';
import 'package:learn_leap/widgets/widgets.dart';

import 'components/components.dart';

class CreateCourseView extends ConsumerWidget {
  CreateCourseView({super.key});
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _courseTypeController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var mediProvider = ref.watch(mediaServiceProvider);
    var vm = ref.watch(createCourseViewModel);
    var filePickerService = ref.read(filePickerServiceProvider);
    return LoaderPage(
      busy: vm.isBusy,
      child: SafeArea(
        child: Scaffold(
          key: _scaffoldKey,
          appBar: AppBar(
            title: AppText.heading4("Create Course Studio"),
            elevation: 0.0,
          ),
          body: Padding(
            padding:
                EdgeInsets.symmetric(horizontal: SizingConfig.defaultPadding),
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    CreateCourseTextField(
                      controller: _titleController,
                      title: "Course Title",
                      hintText: "Differential Equation",
                      validator: (v) =>
                          FieldValidators.string(v, 'Course Title'),
                    ),
                    CreateCourseTextField(
                      controller: _courseTypeController,
                      title: "Course Type",
                      hintText: "CSC",
                      validator: (v) =>
                          FieldValidators.string(v, 'Course Type'),
                      onTap: () {
                        FocusScope.of(context).unfocus();
                        showModalBottomSheet(
                          context: context,
                          builder: (_) => Container(
                            height: context.getDeviceHeight,
                            width: context.getDeviceWidth,
                            decoration: BoxDecoration(
                              color: AppColors.textFieldColor,
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(16),
                                topRight: Radius.circular(16),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                top: 16,
                                left: 16,
                                right: 16,
                              ),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      AppText.heading5("Select Course Type"),
                                      IconButton(
                                        onPressed: () {},
                                        icon: const Icon(Icons.add),
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Wrap(
                                    alignment: WrapAlignment.start,
                                    children: [
                                      ...List.generate(
                                        20,
                                        (index) => Container(
                                          height: 45,
                                          width: 80,
                                          margin:
                                              const EdgeInsets.only(right: 10),
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 12,
                                            vertical: 8,
                                          ),
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            color: AppColors.primaryColor
                                                .withOpacity(.3),
                                            borderRadius:
                                                const BorderRadius.all(
                                              Radius.circular(12),
                                            ),
                                          ),
                                          child: AppText.heading5("CSC"),
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    CreateCourseTextField(
                      controller: _descriptionController,
                      validator: (v) =>
                          FieldValidators.string(v, 'Course Type'),
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
                    mediProvider.mediaFile != null
                        ? Row(
                            children: [
                              AppText.button(
                                  mediProvider.mediaFile!.path.split(".").last)
                            ],
                          )
                        : Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                MediaComponent(
                                  title: "Audio",
                                  icon: Icons.mic,
                                  onTap: () {
                                    showModalBottomSheet(
                                      context: context,
                                      builder: (_) => CreateMediaButtomSheet(
                                        title1: "Record",
                                        onTap1: () {
                                          Navigator.pop(context);
                                          _scaffoldKey.currentState
                                              ?.showBottomSheet(
                                            (context) =>
                                                const AudioRecordView(),
                                          );
                                        },
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
                                      builder: (_) =>
                                          const CreateMediaButtomSheet(
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
                                      builder: (_) => CreateMediaButtomSheet(
                                        title1: "Pick a Document",
                                        isDocument: true,
                                        title2: "",
                                        onTap1: () async {
                                          Navigator.pop(context);
                                          await filePickerService.pickFile();
                                        },
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
                        if (_formKey.currentState!.validate()) {
                          return;
                        } else {
                          vm.createCourse(_titleController.text,
                              _descriptionController.text);
                        }
                      },
                    )
                  ],
                ),
              ),
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
  final void Function()? onTap1;
  final void Function()? onTap2;
  const CreateMediaButtomSheet({
    Key? key,
    required this.title1,
    required this.title2,
    this.isDocument = false,
    this.onTap1,
    this.onTap2,
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
              onPressed: onTap1,
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
                    onPressed: onTap2,
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
