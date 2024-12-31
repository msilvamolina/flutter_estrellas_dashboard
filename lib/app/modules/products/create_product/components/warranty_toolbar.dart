import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';

class SimpleCustomToolbar extends StatelessWidget {
  const SimpleCustomToolbar({super.key, required this.controller});

  final QuillController controller;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Wrap(
        children: [
          // Historial (Deshacer y Rehacer)
          QuillToolbarHistoryButton(
            isUndo: true, // Botón para deshacer
            controller: controller,
          ),
          QuillToolbarHistoryButton(
            isUndo: false, // Botón para rehacer
            controller: controller,
          ),
          const VerticalDivider(),

          // Estilos de texto (negrita, cursiva, subrayado, tachado)
          QuillToolbarToggleStyleButton(
            controller: controller,
            attribute: Attribute.bold, // Negrita
          ),
          QuillToolbarToggleStyleButton(
            controller: controller,
            attribute: Attribute.italic, // Cursiva
          ),
          QuillToolbarToggleStyleButton(
            controller: controller,
            attribute: Attribute.underline, // Subrayado
          ),
        ],
      ),
    );
  }
}
