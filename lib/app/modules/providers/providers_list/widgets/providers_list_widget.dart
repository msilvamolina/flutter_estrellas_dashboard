import 'package:estrellas_dashboard/app/data/models/provider/provider/provider_model.dart';
import 'package:flutter/widgets.dart';

import '../../../../data/models/product/product/product.dart';
import 'provider_card.dart';

class ProvidersListWidget extends StatelessWidget {
  const ProvidersListWidget({required this.list, super.key});

  final List<ProviderModel> list;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.only(
              top: index == 0 ? 8 : 0,
              bottom: index == (list.length - 1) ? 48 : 0),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: ProviderCard(
              provider: list[index],
            ),
          ),
        );
      },
    );
  }
}
