import 'package:estrellas_dashboard/app/data/models/city/city/city.dart';
import 'package:estrellas_dashboard/app/data/models/city/department/department.dart';
import 'package:estrellas_dashboard/app/modules/admin/copy_departments/widgets/department_card.dart';
import 'package:flutter/widgets.dart';

import '../../../../data/models/product/product/product.dart';
import 'city_card_widget.dart';

class CitiesListWidget extends StatelessWidget {
  const CitiesListWidget({required this.list, super.key});

  final List<CityModel> list;
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
            child: CityCard(
              city: list[index],
            ),
          ),
        );
      },
    );
  }
}
