import 'package:flutter/widgets.dart';

class ProvidersErrorWidget extends StatelessWidget {
  const ProvidersErrorWidget({required this.error, super.key});

  final String error;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(error),
    );
  }
}
