import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../../components/widgets/loadingButton.dart';
import '../../../../themes/input_decoration.dart';
import '../controllers/edit_product_variant_combination_controller.dart';

class EditProductVariantCombinationView
    extends GetView<EditProductVariantCombinationController> {
  const EditProductVariantCombinationView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(controller.productVariantCombination.name),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ReactiveFormBuilder(
          form: () =>
              controller.buildForm(controller.productVariantCombination),
          builder: (context, form, child) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ReactiveTextField(
                  formControlName: Fields.dropiId.name,
                  keyboardType: TextInputType.text,
                  decoration: CustomInputDecoration.inputDecoration(
                    text: "Dropi Id",
                  ),
                ),
                const SizedBox(height: 16),
                ReactiveTextField(
                  formControlName: Fields.price.name,
                  keyboardType: TextInputType.number,
                  decoration: CustomInputDecoration.inputDecoration(
                    text: "Price",
                  ),
                ),
                const SizedBox(height: 16),
                ReactiveTextField(
                  formControlName: Fields.suggestedPrice.name,
                  keyboardType: TextInputType.number,
                  decoration: CustomInputDecoration.inputDecoration(
                    text: "Suggested Price",
                  ),
                ),
                const SizedBox(height: 16),
                ReactiveTextField(
                  formControlName: Fields.points.name,
                  keyboardType: TextInputType.number,
                  decoration: CustomInputDecoration.inputDecoration(
                    text: "Points",
                  ),
                ),
                const SizedBox(height: 16),
                ReactiveTextField(
                  formControlName: Fields.stock.name,
                  keyboardType: TextInputType.number,
                  decoration: CustomInputDecoration.inputDecoration(
                    text: "Stock",
                  ),
                ),
                const SizedBox(height: 16),
                const SizedBox(height: 26),
                ReactiveFormConsumer(
                  builder: (context, form, child) => LoadingButton(
                    label: 'Guardar',
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
  }
}
