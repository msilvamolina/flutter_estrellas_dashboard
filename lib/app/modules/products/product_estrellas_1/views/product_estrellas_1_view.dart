import 'package:cached_network_image/cached_network_image.dart';
import 'package:estrellas_dashboard/app/components/table/models/table_row_model.dart';
import 'package:estrellas_dashboard/app/components/table/table_widget.dart';
import 'package:estrellas_dashboard/app/themes/styles/typography.dart';
import 'package:estrellas_dashboard/app/utils/responsive.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../app/layouts/main_layout/main_layout.dart';
import '../../../../components/appbars/appbar_title_with_back.dart';
import '../../../../components/table/models/table_row_strings_model.dart';
import '../../../../components/table/table_row.dart';
import '../../../../components/table/table_row_inside_column.dart';
import '../../../../routes/app_pages.dart';
import '../controllers/product_estrellas_1_controller.dart';

class ProductEstrellas1View extends GetView<ProductEstrellas1Controller> {
  const ProductEstrellas1View({super.key});

  @override
  Widget build(BuildContext context) {
    Color border = Theme.of(context).colorScheme.primary.withOpacity(0.2);

    return MainLayout(
      maxWidth: double.infinity,
      currentRoute: Routes.PRODUCT_ESTRELLAS_1,
      appBarWidget: AppbarTitleWithBack(title: controller.product.name),
      child: TableWidget(
        border: border,
        rows: [
          TableRowModel(
            label: 'ID',
            widget: Text(controller.product.id),
          ),
          TableRowModel(
            label: 'Name',
            widget: Text(controller.product.name),
          ),
          TableRowModel(
            label: 'Provider',
            widget: TableRowInsideColumn(
              cellWidth: 70,
              imageUrl: controller.product.provider.avatarUrl,
              rows: [
                TableRowStringsModel(
                  label: 'ID',
                  text: controller.product.provider.id,
                ),
                TableRowStringsModel(
                  label: 'Name',
                  text: controller.product.provider.name,
                ),
                TableRowStringsModel(
                  label: 'AvatarUrl',
                  text: controller.product.provider.avatarUrl,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
