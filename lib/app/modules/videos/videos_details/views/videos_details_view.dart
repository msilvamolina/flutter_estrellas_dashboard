import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../app/layouts/main_layout/main_layout.dart';
import '../../../../components/discovery_feature/discover_feature_appbar_button.dart';
import '../../../../components/video/video_widget.dart';
import '../../../../components/widgets/loadingButton.dart';
import '../../../../routes/app_pages.dart';
import '../../../../themes/styles/colors.dart';
import '../../../../themes/styles/typography.dart';
import '../../../products/products/widgets/product_firebase_card.dart';
import '../controllers/videos_details_controller.dart';

class VideosDetailsView extends GetView<VideosDetailsController> {
  const VideosDetailsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Detalle del video',
          style: TypographyStyle.bodyBlackLarge,
        ),
        surfaceTintColor: white,
        actions: [
          DiscoverFeatureAppBarButton(
            featureId: controller.guideTourName,
            icon: Icons.more_vert,
            title: 'Más opciones al alcance de tu mano',
            description:
                'Aquí vas a encontrar todas las opciones para modificar el video.',
            onIconPressed: controller.moreOptions,
          ),
        ],
      ),
      body: GetBuilder<VideosDetailsController>(
        id: 'view',
        builder: (_) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            controller.videoPostModel.name,
                            style: TypographyStyle.h4Mobile,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Creado por: ',
                            style: TypographyStyle.bodyBlackLarge,
                          ),
                          Text(
                            controller.videoPostModel.createdByEmail,
                            style: TypographyStyle.bodyRegularMedium,
                          ),
                        ],
                      ),
                      Spacer(),
                      Obx(
                        () => GestureDetector(
                          onTap: controller.showDialogActive,
                          child: Image.asset(
                            controller.videoActive.value
                                ? 'assets/images/switchon.png'
                                : 'assets/images/switchoff.png',
                            width: 80,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Divider(),
                  const SizedBox(height: 8),
                  if (controller.videoPostModel.product != null) ...[
                    Text(
                      'Producto vinculado:',
                      style: TypographyStyle.bodyBlackLarge,
                    ),
                    const SizedBox(height: 8),
                    ProductFirebaseCard(
                      product: controller.videoPostModel.product!,
                    ),
                  ],
                  Divider(),
                  const SizedBox(height: 8),
                  Text(
                    'Video:',
                    style: TypographyStyle.bodyBlackLarge,
                  ),
                  const SizedBox(height: 8),
                  VideoWidget(videoUrl: controller.videoPostModel.videoUrl),
                  const SizedBox(height: 80),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
