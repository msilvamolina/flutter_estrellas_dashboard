import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:flutter_quill_extensions/flutter_quill_extensions.dart';

class CustomToolbar extends StatelessWidget {
  const CustomToolbar({super.key, required this.controller});

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
          QuillToolbarToggleStyleButton(
            controller: controller,
            attribute: Attribute.strikeThrough, // Tachado
          ),
          QuillToolbarClearFormatButton(
            controller: controller, // Limpiar formato
          ),
          const VerticalDivider(),

          // Encabezados (tamaño del texto)
          QuillToolbarSelectHeaderStyleDropdownButton(
            controller: controller, // Dropdown para elegir encabezados
          ),
          const VerticalDivider(),

          // Estilo de altura de línea
          QuillToolbarSelectLineHeightStyleDropdownButton(
            controller: controller, // Dropdown para ajustar interlineado
          ),
          const VerticalDivider(),

          // // Alineación de texto (izquierda, centro, derecha, justificado)
          // QuillToolbarAlignmentButton(
          //   controller: controller,
          //   alignment: TextAlign.left, // Alineado a la izquierda
          // ),
          // QuillToolbarAlignmentButton(
          //   controller: controller,
          //   alignment: TextAlign.center, // Centrado
          // ),
          // QuillToolbarAlignmentButton(
          //   controller: controller,
          //   alignment: TextAlign.right, // Alineado a la derecha
          // ),
          // QuillToolbarAlignmentButton(
          //   controller: controller,
          //   alignment: TextAlign.justify, // Justificado
          // ),
          const VerticalDivider(),

          // Listas y viñetas
          QuillToolbarToggleStyleButton(
            controller: controller,
            attribute: Attribute.ol, // Lista ordenada (numerada)
          ),
          QuillToolbarToggleStyleButton(
            controller: controller,
            attribute: Attribute.ul, // Lista desordenada (viñetas)
          ),
          QuillToolbarToggleCheckListButton(
            controller: controller, // Lista de tareas
          ),
          const VerticalDivider(),

          // Indentación (aumentar/disminuir sangría)
          QuillToolbarIndentButton(
            controller: controller,
            isIncrease: true, // Aumentar sangría
          ),
          QuillToolbarIndentButton(
            controller: controller,
            isIncrease: false, // Disminuir sangría
          ),
          const VerticalDivider(),

          // Bloques de código y citas
          QuillToolbarToggleStyleButton(
            controller: controller,
            attribute: Attribute.inlineCode, // Código en línea
          ),
          QuillToolbarToggleStyleButton(
            controller: controller,
            attribute: Attribute.blockQuote, // Cita
          ),
          const VerticalDivider(),

          // Colores (texto y fondo)
          QuillToolbarColorButton(
            controller: controller,
            isBackground: false, // Color del texto
          ),
          QuillToolbarColorButton(
            controller: controller,
            isBackground: true, // Color del fondo
          ),
          // const VerticalDivider(),

          // Medios (imágenes, videos, etc.)
          // QuillToolbarImageButton(
          //   controller: controller, // Insertar imagen
          // ),
          // QuillToolbarCameraButton(
          //   controller: controller, // Capturar desde la cámara
          // ),
          // QuillToolbarVideoButton(
          //   controller: controller, // Insertar video
          // ),
          // const VerticalDivider(),

          // // Enlaces (añadir y eliminar)
          // QuillToolbarLinkStyleButton(
          //   controller: controller, // Agregar enlace
          // ),
        ],
      ),
    );
  }
}
