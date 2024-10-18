import 'package:flutter/material.dart';

class ProvidersLoadingWidget extends StatelessWidget {
  const ProvidersLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
