import 'package:estrellas_dashboard/app/components/widgets/custom_floating_action_button.dart';
import 'package:estrellas_dashboard/app/data/models/videos/video_post_model.dart';
import 'package:estrellas_dashboard/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../app/layouts/main_layout/main_layout.dart';
import '../controllers/videos_list_controller.dart';

class VideosListView extends GetView<VideosListController> {
  const VideosListView({super.key});
  @override
  Widget build(BuildContext context) {
    return MainLayout(
      floatingActionButton: CustomFloatingActionButton(
        label: 'Crear video',
        icon: Icons.add,
        onPressed: () => Get.toNamed(Routes.CREATE_VIDEO),
      ),
      currentRoute: Routes.VIDEOS_LIST,
      child: Obx(
        () => controller.list.isNotEmpty
            ? ListView.separated(
                itemCount: controller.list.length,
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                itemBuilder: (context, index) {
                  VideoPostModel element = controller.list[index];
                  return Text(element.toString());
                },
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 10),
              )
            : const Text('no data'),
      ),
    );
  }
}
