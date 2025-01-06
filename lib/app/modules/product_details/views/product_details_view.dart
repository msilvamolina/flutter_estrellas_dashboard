import 'dart:io';

import 'package:feature_discovery/feature_discovery.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../components/appbars/estrellas_appbar.dart';
import '../../../components/buttons/buttons.dart';
import '../../../components/discovery_feature/discover_feature_appbar_button.dart';
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
              DiscoverFeatureAppBarButton(
                featureId: controller.guideTourName,
                icon: Icons.more_vert,
                title: 'Más opciones al alcance de tu mano',
                description:
                    'Aquí vas a encontrar todas las opciones para modificar el producto.',
                onIconPressed: controller.moreOptions,
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
