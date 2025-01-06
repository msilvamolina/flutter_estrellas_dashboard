import 'dart:io';

import 'package:feature_discovery/feature_discovery.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../components/appbars/estrellas_appbar.dart';
import '../../../components/buttons/buttons.dart';
import '../../../themes/styles/colors.dart';
import '../../../themes/styles/typography.dart';
import '../../../themes/themes/default_light_theme.dart';
import '../../../themes/themes/green.dart';
import '../controllers/product_details_controller.dart';
import '../widgets/product_main_header.dart';
import '../widgets/product_sticky_content.dart';

class ProductDetailsView extends GetView<ProductDetailsController> {
  const ProductDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    double tmbSize = 90;
    bool isIos = false;
    bool isAndroid = false;

    if (!kIsWeb) {
      isIos = Platform.isIOS;
      isAndroid = Platform.isAndroid;
    }

    return Theme(
      data: defaultLightTheme,
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          backgroundColor: white,
          bottomNavigationBar: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: 16, vertical: isIos ? 0 : (isAndroid ? 8 : 16)),
              child: Row(
                children: [
                  Expanded(
                    child: Button(
                      style: ButtonStyles.secondary,
                      onPressed: () {},
                      label: 'Vender',
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Button(
                      style: ButtonStyles.primary,
                      onPressed: () {},
                      label: 'Comprar',
                    ),
                  ),
                ],
              ),
            ),
          ),
          appBar: AppBar(
            title: Text(
              'Vista previa',
              style: TypographyStyle.bodyBlackLarge,
            ),
            surfaceTintColor: white,
            actions: [
              DescribedFeatureOverlay(
                contentLocation: ContentLocation.below,
                featureId: controller.guideTourName,
                tapTarget: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.more_vert,
                    size: 32,
                    color: Colors.black,
                  ),
                ),
                title: Text(
                  'Más opciones',
                  style: TypographyStyle.h3Mobile.copyWith(color: white),
                ),
                description: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Aquí vas a encontrar todas las opciones para modificar el producto.',
                      style: TypographyStyle.bodyRegularLarge
                          .copyWith(color: white),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 16),
                      transform: Matrix4.translationValues(-11, 0, 0),
                      child: TextButton(
                        onPressed: controller.guideTourNotShowAgain,
                        child: Text(
                          'No volver a mostrar',
                          style: TypographyStyle.bodyBlackMedium.copyWith(
                            color: Colors.white.withOpacity(0.5),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                backgroundColor: Colors.black,
                backgroundOpacity: 0.9,
                targetColor: Colors.white,
                textColor: Colors.white,
                overflowMode: OverflowMode.clipContent,
                child: IconButton(
                  onPressed: controller.moreOptions,
                  icon: const Icon(Icons.more_vert),
                ),
              ),
            ],
          ),
          body: CustomScrollView(
            shrinkWrap: true,
            slivers: <Widget>[
              ProductMainHeader(),
              ProductStickyContent(),
            ],
          ),
        ),
      ),
    );
  }
}
