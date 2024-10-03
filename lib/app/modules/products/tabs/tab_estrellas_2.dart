import 'package:flutter/material.dart';

import '../../../components/widgets/custom_floating_action_button.dart';

class TabEstrellas2 extends StatelessWidget {
  const TabEstrellas2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: CustomFloatingActionButton(
        label: 'Agregar producto',
        icon: Icons.add,
        onPressed: () {},
      ),
      body: Center(child: Text('holis :D')),
    );
  }
}
