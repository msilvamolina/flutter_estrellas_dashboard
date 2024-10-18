import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../../data/models/provider/warehouse/provider_warehouse_model.dart';

class WarehouseCard extends StatelessWidget {
  const WarehouseCard({required this.warehouse, super.key});
  final ProviderWarehouseModel warehouse;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Text(
          warehouse.toString(),
        ),
      ),
    );
  }
}
