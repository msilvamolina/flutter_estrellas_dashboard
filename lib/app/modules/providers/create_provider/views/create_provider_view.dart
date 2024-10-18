import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../../app/layouts/main_layout/main_layout.dart';
import '../../../../components/widgets/loadingButton.dart';
import '../../../../routes/app_pages.dart';
import '../../../../themes/input_decoration.dart';
import '../controllers/create_provider_controller.dart';

class CreateProviderView extends GetView<CreateProviderController> {
  const CreateProviderView({super.key});

  @override
  Widget build(BuildContext context) {
    return ReactiveFormBuilder(
        form: controller.buildForm,
        builder: (context, form, child) {
          return MainLayout(
            showMenu: false,
            currentRoute: Routes.CREATE_PROVIDER,
            appBarTitle: 'Crear proveedor',
            child: GetBuilder<CreateProviderController>(
              id: 'view',
              builder: (_) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ReactiveTextField(
                      formControlName: Fields.videoName.name,
                      keyboardType: TextInputType.text,
                      decoration: CustomInputDecoration.inputDecoration(
                        text: "Nombre",
                      ),
                    ),
                    const SizedBox(height: 16),
                    // Obx(
                    //   () => DropDown(
                    //     error: controller.productsError,
                    //     selectedValue: controller.productSelected,
                    //     values: controller.listProducts
                    //         .map(
                    //           (ProductFirebaseModel value) => OptionDropDown(
                    //             text: value.name,
                    //             value: value.id,
                    //           ),
                    //         )
                    //         .toList(),
                    //     onChanged: controller.onProductSelected,
                    //   ),
                    // ),
                    const SizedBox(height: 26),
                    ReactiveFormConsumer(
                      builder: (context, form, child) => LoadingButton(
                        label: 'Subir video',
                        // isLoading: controller.loading,
                        isLoading: false,
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
