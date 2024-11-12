import 'package:estrellas_dashboard/app/data/models/city/city/city.dart';
import 'package:estrellas_dashboard/app/data/models/city/department/department.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../routes/app_pages.dart';

class CityCard extends StatelessWidget {
  const CityCard({required this.city, super.key});

  final CityModel city;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Text(city.toString()),
      ),
    );
  }
}
