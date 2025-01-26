import 'package:cached_network_image/cached_network_image.dart';
import 'package:estrellas_dashboard/app/data/models/videos/video_post_model.dart';
import 'package:estrellas_dashboard/app/routes/app_pages.dart';
import 'package:estrellas_dashboard/app/themes/styles/typography.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VideoPostCard extends StatelessWidget {
  const VideoPostCard({
    required this.videoPostModel,
    super.key,
  });

  final VideoPostModel videoPostModel;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () => Get.toNamed(
          Routes.VIDEOS_DETAILS,
          arguments: videoPostModel,
        ),
        child: Stack(
          children: [
            Image.network(
              videoPostModel.thumbnail,
              fit: BoxFit.cover,
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right:
                  0, // Asegura que el contenido ocupe todo el ancho disponible
              child: Container(
                padding: const EdgeInsets.only(right: 4),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.white, width: 2),
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
                          videoPostModel.product?.thumbnail ?? '',
                          width: 60,
                          height: 60,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(width: 4),
                    Expanded(
                      // Cambiado a Expanded para garantizar el uso del espacio restante
                      child: Text(
                        videoPostModel.product?.name ?? '',
                        style: TypographyStyle.bodyBlackMedium.copyWith(
                          shadows: [
                            Shadow(
                              color: Colors.black,
                              offset: Offset(2, 2),
                              blurRadius: 8,
                            ),
                          ],
                        ),
                        maxLines: 3, // Permite hasta 3 líneas
                        overflow: TextOverflow
                            .ellipsis, // Muestra "..." si el texto excede las líneas
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(6),
              width: double.infinity,
              color: Colors.black.withOpacity(0.75),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    videoPostModel.name,
                    style: TypographyStyle.bodyBlackLarge,
                  ),
                  const SizedBox(height: 8),
                  RichText(
                    textAlign: TextAlign.start,
                    text: TextSpan(
                      text: 'Creado por: ',
                      style: TypographyStyle.bodyBlackMedium,
                      children: <TextSpan>[
                        TextSpan(
                          text: videoPostModel.createdByEmail,
                          style: TypographyStyle.bodyRegularSmall,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
