import 'package:estrellas_dashboard/app/routes/app_pages.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../app/layouts/main_layout/main_layout.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      currentRoute: Routes.HOME,
      child: Center(
        child: Text('holis'),
      ),
    );
  }
}
