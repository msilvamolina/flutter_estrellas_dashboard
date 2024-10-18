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
import '../../../../components/table/table_widget.dart';
import '../../../../components/widgets/custom_floating_action_button.dart';
import '../../../../routes/app_pages.dart';
import '../../../../utils/money_amount.dart';
import '../controllers/providers_estrellas_1_controller.dart';

class ProvidersEstrellas1View extends GetView<ProvidersEstrellas1Controller> {
  const ProvidersEstrellas1View({super.key});

  @override
  Widget build(BuildContext context) {
    Color border = Theme.of(context).colorScheme.primary.withOpacity(0.2);

    return MainLayout(
      showMenu: false,
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            child: const Icon(Icons.warehouse),
            onPressed: () => Get.toNamed(
              Routes.PRODUCT_VARIANTS,
              arguments: controller.provider,
            ),
          ),
          const SizedBox(height: 16),
          FloatingActionButton(
            child: const Icon(Icons.compare_arrows_rounded),
            onPressed: () => Get.toNamed(
              Routes.PRODUCT_IMAGES,
              arguments: controller.provider,
            ),
          ),
        ],
      ),
      maxWidth: double.infinity,
      currentRoute: Routes.PROVIDERS_ESTRELLAS_1,
      appBarWidget:
          AppbarTitleWithBack(title: controller.provider.name.toString()),
      child: TableWidget(
        border: border,
        rows: [
          TableRowModel(
            label: 'id',
            widget: TableRowText(text: controller.provider.id),
          ),
          TableRowModel(
            label: 'avatarUrl',
            widget: TableRowInsideColumn(
              cellWidth: 70,
              imageUrl: 'https://storage.googleapis.com/dev_bucket_estrellas/' +
                  (controller.provider.avatarUrl ?? ''),
              rows: [
                TableRowStringsModel(
                  label: 'url',
                  text: controller.provider.avatarUrl ?? '',
                ),
              ],
            ),
          ),
          TableRowModel(
            label: 'active',
            widget: TableRowText(text: controller.provider.isActive.toString()),
          ),
          TableRowModel(
            label: 'externalId',
            widget:
                TableRowText(text: controller.provider.externalID.toString()),
          ),
          TableRowModel(
            label: 'name',
            widget: TableRowText(text: controller.provider.name.toString()),
          ),
          TableRowModel(
            label: 'email',
            widget: TableRowText(text: controller.provider.email.toString()),
          ),
          TableRowModel(
            label: 'document',
            widget: TableRowText(text: controller.provider.document.toString()),
          ),
          TableRowModel(
            label: 'phone',
            widget: TableRowText(text: controller.provider.phone.toString()),
          ),
          TableRowModel(
            label: 'porcentage',
            widget:
                TableRowText(text: controller.provider.porcentage.toString()),
          ),
          TableRowModel(
            label: 'createdAt',
            widget: TableRowDate(date: controller.provider.createdAt ?? ''),
          ),
          if (controller.provider.updatedAt != null)
            TableRowModel(
              label: 'updatedAt',
              widget: TableRowDate(date: controller.provider.updatedAt ?? ''),
            ),
          if (controller.provider.uploadDate != null)
            TableRowModel(
              label: 'uploadDate',
              widget: TableRowDate(date: controller.provider.uploadDate ?? ''),
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
