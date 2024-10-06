import 'package:flutter/material.dart';

class ProdutcsLoadingWidget extends StatelessWidget {
  const ProdutcsLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
