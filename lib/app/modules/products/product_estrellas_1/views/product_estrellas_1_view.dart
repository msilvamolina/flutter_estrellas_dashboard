import 'package:estrellas_dashboard/app/components/table/model/table_row_model.dart';
import 'package:estrellas_dashboard/app/components/table/table_widget.dart';
import 'package:estrellas_dashboard/app/themes/styles/typography.dart';
import 'package:estrellas_dashboard/app/utils/responsive.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../app/layouts/main_layout/main_layout.dart';
import '../../../../components/appbars/appbar_title_with_back.dart';
import '../../../../routes/app_pages.dart';
import '../controllers/product_estrellas_1_controller.dart';

class ProductEstrellas1View extends GetView<ProductEstrellas1Controller> {
  const ProductEstrellas1View({super.key});

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      maxWidth: double.infinity,
      currentRoute: Routes.PRODUCT_ESTRELLAS_1,
      appBarWidget: AppbarTitleWithBack(title: controller.product.name),
      child: TableWidget(
        rows: [
          TableRowModel(
            label: 'ID',
            widget: Text(controller.product.id),
          )
        ],
      ),
    );
  }
}
