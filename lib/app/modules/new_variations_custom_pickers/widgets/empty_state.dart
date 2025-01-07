import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../components/widgets/button.dart';
import '../../../themes/styles/typography.dart';
import '../controllers/new_variations_custom_pickers_controller.dart';

class VariationsEmptyState extends StatelessWidget {
  const VariationsEmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NewVariationsCustomPickersController>(
      builder: (controller) {
        return Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/tag.png',
                width: 180,
              ),
              SizedBox(height: 8),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: Text(
                  'Selecciona uno o varios atributos para comenzar',
                  style: TypographyStyle.bodyBlackLarge,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
