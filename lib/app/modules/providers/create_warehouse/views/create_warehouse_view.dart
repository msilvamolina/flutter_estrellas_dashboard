import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../../app/layouts/main_layout/main_layout.dart';
import '../../../../components/widgets/loadingButton.dart';
import '../../../../routes/app_pages.dart';
import '../../../../themes/input_decoration.dart';
import '../../../../themes/styles/typography.dart';
import '../controllers/create_warehouse_controller.dart';

class CreateWarehouseView extends GetView<CreateWarehouseController> {
  const CreateWarehouseView({super.key});

  @override
  Widget build(BuildContext context) {
    Color primary = Theme.of(context).colorScheme.primary;

    return ReactiveFormBuilder(
        form: controller.buildForm,
        builder: (context, form, child) {
          return GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus(); // Esconde el teclado
            },
            child: MainLayout(
              showMenu: false,
              currentRoute: Routes.CREATE_WAREHOUSE,
              appBarTitle: 'Crear bodega',
              child: GetBuilder<CreateWarehouseController>(
                id: 'view',
                builder: (_) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Card(
                        child: InkWell(
                          onTap: controller.pickCity,
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'assets/images/city.png',
                                  width: 80,
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        'City',
                                        style: TypographyStyle.bodyBlackLarge
                                            .copyWith(color: primary),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        controller.cityModel != null
                                            ? (controller.cityModel!.name ??
                                                '' +
                                                    '\n' +
                                                    controller
                                                        .departmentModel!.name)
                                            : null ?? '(Selecciona una ciudad)',
                                        style: TypographyStyle.bodyRegularSmall,
                                      ),
                                    ],
                                  ),
                                ),
                                Icon(
                                  Icons.chevron_right_rounded,
                                  color: primary,
                                  size: 48,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      ReactiveTextField(
                        formControlName: Fields.name.name,
                        keyboardType: TextInputType.text,
                        decoration: CustomInputDecoration.inputDecoration(
                          text: "Name",
                        ),
                      ),
                      const SizedBox(height: 16),

                      ReactiveTextField(
                        formControlName: Fields.address.name,
                        keyboardType: TextInputType.text,
                        decoration: CustomInputDecoration.inputDecoration(
                          text: "Address",
                        ),
                      ),
                      const SizedBox(height: 16),
                      ReactiveTextField(
                        formControlName: Fields.phone.name,
                        keyboardType: TextInputType.phone,
                        decoration: CustomInputDecoration.inputDecoration(
                          text: "Phone",
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
                          label: 'Crear',
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
            ),
          );
        });
  }
}
