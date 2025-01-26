import 'package:estrellas_dashboard/app/components/adminscaffold/admin_scaffold.dart';
import 'package:estrellas_dashboard/app/components/widgets/custom_floating_action_button.dart';
import 'package:estrellas_dashboard/app/data/models/videos/video_post_model.dart';
import 'package:estrellas_dashboard/app/routes/app_pages.dart';
import 'package:estrellas_dashboard/app/services/user_permissions.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../app/layouts/main_layout/main_layout.dart';
import '../../../../components/discovery_feature/discover_feature_appbar_button.dart';
import '../../../../themes/styles/colors.dart';
import '../../../../themes/styles/typography.dart';
import '../controllers/videos_list_controller.dart';
import '../widgets/video_post_card.dart';

class VideosListView extends GetView<VideosListController> {
  const VideosListView({super.key});
  @override
  Widget build(BuildContext context) {
    return MainLayout(
      floatingActionButton: CustomFloatingActionButton(
        label: 'Crear video',
        icon: Icons.add,
        onPressed: controller.goToCreatevideo,
      ),
      currentRoute: Routes.VIDEOS_LIST,
      appBarWidget: AppBar(
        automaticallyImplyLeading: false,
        title: Text(''),
        surfaceTintColor: white,
        actions: [
          DiscoverFeatureAppBarButton(
            featureId: controller.guideTourName,
            icon: Icons.more_vert,
            title: 'Más opciones al alcance de tu mano',
            description:
                'Aquí vas a encontrar todas las opciones para modificar los videos.',
            onIconPressed: controller.moreOptions,
          ),
        ],
      ),
      child: AdminScaffold(
        permission: Permissions.videosList,
        child: Obx(
          () => controller.list.isNotEmpty
              ? GridView.builder(
                  itemCount: controller.list.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 9 / 16,
                  ),
                  itemBuilder: (context, index) {
                    return VideoPostCard(
                      videoPostModel: controller.list[index],
                    );
                  },
                )
              : const Text('no data'),
        ),
      ),
    );
  }
}
