import 'package:cached_network_image/cached_network_image.dart';
import 'package:estrellas_dashboard/app/components/widgets/dropdown.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../../app/layouts/main_layout/main_layout.dart';
import '../../../../components/adminscaffold/admin_scaffold.dart';
import '../../../../components/widgets/loadingButton.dart';
import '../../../../data/models/product/product_firebase/product_firebase_model.dart';
import '../../../../routes/app_pages.dart';
import '../../../../services/user_permissions.dart';
import '../../../../themes/input_decoration.dart';
import '../../../../themes/styles/typography.dart';
import '../../../../utils/responsive.dart';
import '../controllers/create_video_controller.dart';

class CreateVideoView extends GetView<CreateVideoController> {
  const CreateVideoView({super.key});

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
              currentRoute: Routes.CREATE_VIDEO,
              appBarTitle: 'Crear video',
              child: AdminScaffold(
                permission: Permissions.createVideo,
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
                            text: "Nombre",
                          ),
                        ),
                        const SizedBox(height: 16),
                        Card(
                          child: InkWell(
                            onTap: controller.pickVideo,
                            child: Padding(
                              padding: const EdgeInsets.all(16),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    controller.videoImagePath ??
                                        'assets/images/video.png',
                                    width: 80,
                                  ),
                                  const SizedBox(width: 12),
                                  // Elimina el Padding alrededor del Expanded
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Video Url',
                                          style: TypographyStyle.bodyBlackLarge
                                              .copyWith(color: primary),
                                        ),
                                        const SizedBox(height: 4),
                                        Text(
                                          controller.videoPath ??
                                              '(Selecciona un video)',
                                          style:
                                              TypographyStyle.bodyRegularSmall,
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
                        Card(
                          child: InkWell(
                            onTap: controller.pickProduct,
                            child: Padding(
                              padding: const EdgeInsets.all(16),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  CachedNetworkImage(
                                    width: 90,
                                    imageUrl:
                                        (controller.productModel?.thumbnail ??
                                            ''),
                                    placeholder: (context, url) => const Center(
                                        child: CircularProgressIndicator()),
                                    errorWidget: (context, url, error) =>
                                        Image.asset(
                                      'assets/images/new-product.png',
                                      width: 80,
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Producto',
                                          style: TypographyStyle.bodyBlackLarge
                                              .copyWith(color: primary),
                                        ),
                                        const SizedBox(height: 4),
                                        Text(
                                          (controller.productModel != null
                                                  ? controller
                                                      .productModel?.name
                                                  : null) ??
                                              '(Selecciona un producto)',
                                          style:
                                              TypographyStyle.bodyRegularSmall,
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
                        const SizedBox(height: 26),
                        ReactiveFormConsumer(
                          builder: (context, form, child) => LoadingButton(
                            label: 'Guardar',
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
              ),
            ),
          );
        });
  }
}
