import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../app/layouts/main_layout/main_layout.dart';
import '../../../../components/appbars/appbar_title_with_back.dart';
import '../../../../components/table/models/table_row_model.dart';
import '../../../../components/table/models/table_row_strings_model.dart';
import '../../../../components/table/table_row_date.dart';
import '../../../../components/table/table_row_image.dart';
import '../../../../components/table/table_row_inside_column.dart';
import '../../../../components/table/table_row_text.dart';
import '../../../../components/table/table_row_video.dart';
import '../../../../components/table/table_widget.dart';
import '../../../../routes/app_pages.dart';
import '../../../../utils/money_amount.dart';
import '../controllers/product_estrellas_2_controller.dart';

class ProductEstrellas2View extends GetView<ProductEstrellas2Controller> {
  const ProductEstrellas2View({super.key});

  @override
  Widget build(BuildContext context) {
    Color border = Theme.of(context).colorScheme.primary.withOpacity(0.2);

    return MainLayout(
      showMenu: false,
      maxWidth: double.infinity,
      currentRoute: Routes.PRODUCT_ESTRELLAS_2,
      appBarWidget: AppbarTitleWithBack(title: controller.product.name),
      child: TableWidget(
        border: border,
        rows: [
          TableRowModel(
            label: 'id',
            widget: TableRowText(text: controller.product.id),
          ),
          TableRowModel(
            label: 'externalId',
            widget: TableRowText(text: controller.product.externalId),
          ),
          TableRowModel(
            label: 'usefulId',
            widget: TableRowText(text: controller.product.usefulId),
          ),
          TableRowModel(
            label: 'name',
            widget: TableRowText(text: controller.product.name),
          ),
          TableRowModel(
            label: 'active',
            widget: TableRowText(text: controller.product.active.toString()),
          ),
          TableRowModel(
            label: 'points',
            widget: TableRowText(text: controller.product.points.toString()),
          ),
          TableRowModel(
            label: 'price',
            widget: TableRowText(
                text: MoneyAmount.convertMoneyString(controller.product.price)),
          ),
          TableRowModel(
            label: 'suggestedPrice',
            widget: TableRowText(
                text: MoneyAmount.convertMoneyString(
                    controller.product.suggestedPrice)),
          ),
          TableRowModel(
            label: 'isPercentage',
            widget:
                TableRowText(text: controller.product.isPercentage.toString()),
          ),
          TableRowModel(
            label: 'type',
            widget: TableRowText(text: controller.product.type),
          ),
          TableRowModel(
            label: 'sku',
            widget: TableRowText(text: controller.product.sku),
          ),
          TableRowModel(
            label: 'category',
            widget: TableRowInsideColumn(
              cellWidth: 50,
              rows: [
                TableRowStringsModel(
                  label: 'id',
                  text: controller.product.category['id'],
                ),
                TableRowStringsModel(
                  label: 'name',
                  text: controller.product.category['name'],
                ),
              ],
            ),
          ),
          TableRowModel(
            label: 'provider',
            widget: TableRowInsideColumn(
              cellWidth: 70,
              imageUrl: controller.product.provider['avatarUrl'],
              rows: [
                TableRowStringsModel(
                  label: 'id',
                  text: controller.product.provider['id'],
                ),
                TableRowStringsModel(
                  label: 'name',
                  text: controller.product.provider['name'],
                ),
                TableRowStringsModel(
                  label: 'avatarUrl',
                  text: controller.product.provider['avatarUrl'],
                ),
              ],
            ),
          ),
          TableRowModel(
            label: 'thumbnail',
            widget: TableRowImage(url: controller.product.thumbnail),
          ),
          TableRowModel(
            label: 'videoUrl',
            widget: TableRowVideo(url: controller.product.videoUrl),
          ),
          TableRowModel(
            label: 'createdAt',
            widget: TableRowDate(date: controller.product.createdAt),
          ),
          TableRowModel(
            label: 'updatedAt',
            widget: TableRowDate(date: controller.product.updatedAt ?? ''),
          ),
          TableRowModel(
            label: 'uploadDate',
            widget: TableRowDate(date: controller.product.uploadDate ?? ''),
          ),
          TableRowModel(
            label: 'description',
            widget: TableRowText(text: controller.product.description),
          ),
          TableRowModel(
            label: '',
            widget: SizedBox(
              height: 80,
            ),
          ),
        ],
      ),
    );
  }
}
