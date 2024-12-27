import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:path/path.dart' as path;
import 'dart:io' as io show Directory, File;

import '../components/quill_data_sample.dart';
import '../components/quill_toolbar.dart';

class ProductDescriptionTab extends StatefulWidget {
  const ProductDescriptionTab({super.key});

  @override
  State<ProductDescriptionTab> createState() => _ProductDescriptionTabState();
}

class _ProductDescriptionTabState extends State<ProductDescriptionTab> {
  final QuillController _controller = () {
    return QuillController.basic();
  }();
  final FocusNode _editorFocusNode = FocusNode();
  final ScrollController _editorScrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    // Cargar documento inicial
    _controller.document = Document.fromJson(kQuillDefaultSample);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          CustomToolbar(controller: _controller),
          Expanded(
            child: QuillEditor(
              focusNode: _editorFocusNode,
              scrollController: _editorScrollController,
              controller: _controller,
              config: QuillEditorConfig(
                placeholder: 'Empieza a escribir aquí...',
                padding: const EdgeInsets.all(16),
              ),
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
