import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../themes/styles/colors.dart';
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
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: white,
        // appBar: EstrellasAppbar(title: 'Detalle de producto'),
        body: CustomScrollView(
          shrinkWrap: true,
          slivers: <Widget>[
            ProductMainHeader(),
            ProductStickyContent(),
          ],
        ),
      ),
    );
  }
}
