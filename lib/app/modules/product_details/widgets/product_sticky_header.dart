import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../themes/styles/colors.dart';
import '../../../themes/styles/typography.dart';

class ProductStickyHeader extends StatelessWidget {
  const ProductStickyHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: TabBar(
        tabs: <Widget>[],
      ).preferredSize,
      child: Container(
        color: white,
        child: TabBar(
          labelStyle: TypographyStyle.bodyBlackLarge,
          indicatorColor: primaryBase,
          labelColor: secondaryBase,
          unselectedLabelColor: neutral700,
          dividerColor: neutral400,
          tabs: [
            Tab(text: "Descripción"),
            Tab(text: "Detalles"),
            Tab(text: "Garantía"),
          ],
        ),
      ),
    );
  }
}
