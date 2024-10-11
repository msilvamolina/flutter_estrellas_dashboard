import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../../app/layouts/main_layout/main_layout.dart';
import '../../../../components/widgets/loadingButton.dart';
import '../../../../routes/app_pages.dart';
import '../../../../themes/input_decoration.dart';
import '../../../../utils/responsive.dart';
import '../controllers/create_video_controller.dart';

class CreateVideoView extends GetView<CreateVideoController> {
  const CreateVideoView({super.key});

  @override
  Widget build(BuildContext context) {
    return ReactiveFormBuilder(
        form: controller.buildForm,
        builder: (context, form, child) {
          return MainLayout(
            currentRoute: Routes.CREATE_VIDEO,
            appBarTitle: 'Crear video',
            child: GetBuilder<CreateVideoController>(
              id: 'view',
              builder: (_) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ReactiveTextField(
                      formControlName: Fields.videoName.name,
                      keyboardType: TextInputType.text,
                      decoration: CustomInputDecoration.inputDecoration(
                        text: "Video",
                      ),
                    ),
                    const SizedBox(height: 16),
                    ReactiveFormConsumer(
                      builder: (context, form, child) => LoadingButton(
                        label: 'Subir video',
                        isLoading: controller.loading,
                        onPressed: (form.valid)
                            ? () => controller.sendForm(form.value)
                            : null,
                      ),
                    ),
                  ],
                );
              },
            ),
          );
        });
  }
}
