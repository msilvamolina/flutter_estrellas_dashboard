import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:flutter_quill_extensions/flutter_quill_extensions.dart';

import '../components/quill_toolbar.dart';

class ProductDescriptionTab extends StatefulWidget {
  const ProductDescriptionTab({super.key});

  @override
  State<ProductDescriptionTab> createState() => _ProductDescriptionTabState();
}

class _ProductDescriptionTabState extends State<ProductDescriptionTab> {
  final QuillController _controller = QuillController.basic();
  final FocusNode _editorFocusNode = FocusNode();
  final ScrollController _editorScrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    // Documento inicial vacío
    _controller.document = Document()
      ..insert(0, ''); // Documento vacío para evitar errores iniciales
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          CustomToolbar(controller: _controller),
          Expanded(
            child: QuillEditor(
              controller: _controller,
              scrollController: _editorScrollController,
              focusNode: _editorFocusNode,
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _editorScrollController.dispose();
    _editorFocusNode.dispose();
    super.dispose();
  }
}
