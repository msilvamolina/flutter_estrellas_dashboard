import 'package:feature_discovery/feature_discovery.dart';
import 'package:flutter/material.dart';

import '../../themes/styles/colors.dart';
import '../../themes/styles/typography.dart';

class DiscoverFeatureFloatingActionButton extends StatelessWidget {
  const DiscoverFeatureFloatingActionButton({
    super.key,
    required this.featureId,
    required this.title,
    required this.description,
    required this.icon,
    required this.onIconPressed,
    required this.onDismiss,
  });

  final String featureId;
  final String title;
  final String description;
  final IconData icon;
  final Function() onIconPressed;
  final Function() onDismiss;
  @override
  Widget build(BuildContext context) {
    return DescribedFeatureOverlay(
      featureId: featureId,
      tapTarget: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Icon(
          icon,
          size: 32,
          color: Colors.black,
        ),
      ),
      title: Text(
        title,
        style: TypographyStyle.h3Mobile.copyWith(color: white),
      ),
      description: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            description,
            style: TypographyStyle.bodyRegularLarge.copyWith(color: white),
          ),
          Container(
            padding: EdgeInsets.only(top: 16),
            transform: Matrix4.translationValues(-11, 0, 0),
            child: TextButton(
              onPressed: onDismiss,
              child: Text(
                'No volver a mostrar',
                style: TypographyStyle.bodyBlackMedium.copyWith(
                  color: Colors.white.withOpacity(0.5),
                ),
              ),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.black,
      backgroundOpacity: 0.9,
      targetColor: Colors.white,
      textColor: Colors.white,
      overflowMode: OverflowMode.clipContent,
      child: FloatingActionButton(
        onPressed: onIconPressed,
        child: Icon(icon),
      ),
    );
  }
}
