import 'package:flutter/material.dart';

import '../../themes/styles/typography.dart';

class Button extends StatelessWidget {
  const Button({
    required this.onPressed,
    required this.label,
    super.key,
  });

  final Function()? onPressed;
  final String label;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Container(
        padding: EdgeInsets.all(8),
        width: double.infinity,
        child: Text(
          label,
          textAlign: TextAlign.center,
          style: TypographyStyle.bodyRegularLarge
              .copyWith(fontWeight: FontWeight.w400),
        ),
      ),
    );
  }
}
