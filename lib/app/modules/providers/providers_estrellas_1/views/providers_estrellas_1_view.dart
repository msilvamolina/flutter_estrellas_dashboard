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
      floatingActionButton: CustomFloatingActionButton(
        label: 'Copiar a 2.0',
        icon: Icons.compare_arrows_rounded,
        onPressed: controller.copyToFirebase,
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
            label: 'externalId',
            widget:
                TableRowText(text: controller.provider.externalID.toString()),
          ),

          TableRowModel(
            label: 'name',
            widget: TableRowText(text: controller.provider.name.toString()),
          ),
          TableRowModel(
            label: 'active',
            widget: TableRowText(text: controller.provider.isActive.toString()),
          ),
          // TableRowModel(
          //   label: 'suggestedPrice',
          //   widget: TableRowText(
          //       text: MoneyAmount.convertMoneyString(
          //           controller.provider.suggestedPrice)),
          // ),
          // TableRowModel(
          //   label: 'isPercentage',
          //   widget:
          //       TableRowText(text: controller.provider.isPercentage.toString()),
          // ),
          // TableRowModel(
          //   label: 'type',
          //   widget: TableRowText(text: controller.provider.type),
          // ),
          // TableRowModel(
          //   label: 'sku',
          //   widget: TableRowText(text: controller.provider.sku),
          // ),
          // TableRowModel(
          //   label: 'category',
          //   widget: TableRowInsideColumn(
          //     cellWidth: 50,
          //     rows: [
          //       TableRowStringsModel(
          //         label: 'id',
          //         text: controller.provider.category.id,
          //       ),
          //       TableRowStringsModel(
          //         label: 'name',
          //         text: controller.provider.category.name,
          //       ),
          //     ],
          //   ),
          // ),
          // TableRowModel(
          //   label: 'provider',
          //   widget: TableRowInsideColumn(
          //     cellWidth: 70,
          //     imageUrl: controller.provider.provider.avatarUrl,
          //     rows: [
          //       TableRowStringsModel(
          //         label: 'id',
          //         text: controller.provider.provider.id,
          //       ),
          //       TableRowStringsModel(
          //         label: 'name',
          //         text: controller.provider.provider.name,
          //       ),
          //       TableRowStringsModel(
          //         label: 'avatarUrl',
          //         text: controller.provider.provider.avatarUrl,
          //       ),
          //     ],
          //   ),
          // ),
          // TableRowModel(
          //   label: 'thumbnail',
          //   widget: TableRowImage(url: controller.provider.thumbnail),
          // ),
          // TableRowModel(
          //   label: 'createdAt',
          //   widget: TableRowDate(date: controller.provider.createdAt),
          // ),
          // TableRowModel(
          //   label: 'updatedAt',
          //   widget: TableRowDate(date: controller.provider.updatedAt),
          // ),
          // TableRowModel(
          //   label: 'uploadDate',
          //   widget: TableRowDate(date: controller.provider.uploadDate),
          // ),
          // TableRowModel(
          //   label: 'description',
          //   widget: TableRowText(text: controller.provider.description),
          // ),
          // TableRowModel(
          //   label: '',
          //   widget: SizedBox(
          //     height: 80,
          //   ),
          // ),
        ],
      ),
    );
  }
}
