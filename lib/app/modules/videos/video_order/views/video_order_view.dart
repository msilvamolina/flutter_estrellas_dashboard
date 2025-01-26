import 'package:drag_grid/drag_grid.dart';
import 'package:estrellas_dashboard/app/data/models/videos/video_post_model.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../components/widgets/loadingButton.dart';
import '../../../../themes/styles/typography.dart';
import '../controllers/video_order_controller.dart';

class VideoOrderView extends GetView<VideoOrderController> {
  const VideoOrderView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Ordenar videos',
          style: TypographyStyle.bodyBlackLarge,
        ),
        centerTitle: true,
      ),
      bottomNavigationBar: GetBuilder<VideoOrderController>(
        id: 'list_changed',
        builder: (_) {
          if (controller.listChanged) {
            return SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: SizedBox(
                  height: 42,
                  child: LoadingButton(
                    onPressed: controller.saveNewOrder,
                    label: 'Guardar orden',
                    isLoading: controller.buttonSaveLoading,
                  ),
                ),
              ),
            );
          } else {
            return SizedBox.shrink();
          }
        },
      ),
      body: Obx(
        () => controller.list.isNotEmpty
            ? SingleChildScrollView(
                child: DragGrid<String>(
                  itemList: List.generate(controller.list.length,
                      (index) => controller.list[index].thumbnail),
                  padding: const EdgeInsets.symmetric(
                      vertical: 20.0, horizontal: 24.0),
                  sliverGridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: 9 / 16,
                  ),
                  itemListChanger: controller.onListChanged,
                  itemBuilder: (context, item, index) {
                    VideoPostModel? video = controller.getVideoByImage(item);
                    return Material(
                      child: Stack(
                        children: [
                          Image.network(
                            item,
                            fit: BoxFit.cover,
                          ),
                          Positioned(
                            bottom: 0,
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8),
                                border:
                                    Border.all(color: Colors.white, width: 2),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black,
                                    blurRadius: 6,
                                    offset: Offset(0, 4),
                                  ),
                                ],
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.network(
                                  video?.product?.thumbnail ?? '',
                                  width: 60,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(6),
                            width: double.infinity,
                            color: Colors.black.withOpacity(0.75),
                            child: Text(
                              video?.name ?? '',
                              style: TypographyStyle.bodyBlackMedium,
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              )
            : Center(
                child: CircularProgressIndicator(),
              ),
      ),
    );
  }
}
