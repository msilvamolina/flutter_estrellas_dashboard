import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:path/path.dart' as path;
import 'dart:io' as io show Directory, File;

import '../components/quill_data_sample.dart';

class ProductDescriptionTab extends StatefulWidget {
  const ProductDescriptionTab({super.key});

  @override
  State<ProductDescriptionTab> createState() => _ProductDescriptionTabState();
}

class _ProductDescriptionTabState extends State<ProductDescriptionTab> {
  final QuillController _controller = () {
    return QuillController.basic(
        config: QuillControllerConfig(
      clipboardConfig: QuillClipboardConfig(
        enableExternalRichPaste: true,
        onImagePaste: (imageBytes) async {
          if (kIsWeb) {
            // Dart IO is unsupported on the web.
            return null;
          }
          // Save the image somewhere and return the image URL that will be
          // stored in the Quill Delta JSON (the document).
          final newFileName =
              'image-file-${DateTime.now().toIso8601String()}.png';
          final newPath = path.join(
            io.Directory.systemTemp.path,
            newFileName,
          );
          final file = await io.File(
            newPath,
          ).writeAsBytes(imageBytes, flush: true);
          return file.path;
        },
      ),
    ));
  }();
  final FocusNode _editorFocusNode = FocusNode();
  final ScrollController _editorScrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    // Load document
    _controller.document = Document.fromJson(kQuillDefaultSample);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          QuillSimpleToolbar(
            controller: _controller,
            config: QuillSimpleToolbarConfig(
              // embedButtons: FlutterQuillEmbeds.toolbarButtons(),
              showClipboardPaste: true,
              customButtons: [
                QuillToolbarCustomButtonOptions(
                  icon: const Icon(Icons.add_alarm_rounded),
                  onPressed: () {
                    _controller.document.insert(
                      _controller.selection.extentOffset,
                      TimeStampEmbed(
                        DateTime.now().toString(),
                      ),
                    );

                    _controller.updateSelection(
                      TextSelection.collapsed(
                        offset: _controller.selection.extentOffset + 1,
                      ),
                      ChangeSource.local,
                    );
                  },
                ),
              ],
              buttonOptions: QuillSimpleToolbarButtonOptions(
                base: QuillToolbarBaseButtonOptions(
                  afterButtonPressed: () {
                    final isDesktop = {
                      TargetPlatform.linux,
                      TargetPlatform.windows,
                      TargetPlatform.macOS
                    }.contains(defaultTargetPlatform);
                    if (isDesktop) {
                      _editorFocusNode.requestFocus();
                    }
                  },
                ),
              ),
            ),
          ),
          Expanded(
            child: QuillEditor(
              focusNode: _editorFocusNode,
              scrollController: _editorScrollController,
              controller: _controller,
              config: QuillEditorConfig(
                placeholder: 'Start writing your notes...',
                padding: const EdgeInsets.all(16),
                embedBuilders: [
                  // ...FlutterQuillEmbeds.editorBuilders(
                  //   imageEmbedConfig: QuillEditorImageEmbedConfig(
                  //     imageProviderBuilder: (context, imageUrl) {
                  //       // https://pub.dev/packages/flutter_quill_extensions#-image-assets
                  //       if (imageUrl.startsWith('assets/')) {
                  //         return AssetImage(imageUrl);
                  //       }
                  //       return null;
                  //     },
                  //   ),
                  //   videoEmbedConfig: QuillEditorVideoEmbedConfig(
                  //     customVideoBuilder: (videoUrl, readOnly) {
                  //       // To load YouTube videos https://github.com/singerdmx/flutter-quill/releases/tag/v10.8.0
                  //       return null;
                  //     },
                  //   ),
                  // ),
                  TimeStampEmbedBuilder(),
                ],
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

class TimeStampEmbed extends Embeddable {
  const TimeStampEmbed(
    String value,
  ) : super(timeStampType, value);

  static const String timeStampType = 'timeStamp';

  static TimeStampEmbed fromDocument(Document document) =>
      TimeStampEmbed(jsonEncode(document.toDelta().toJson()));

  Document get document => Document.fromJson(jsonDecode(data));
}

class TimeStampEmbedBuilder extends EmbedBuilder {
  @override
  String get key => 'timeStamp';

  @override
  String toPlainText(Embed node) {
    return node.value.data;
  }

  @override
  Widget build(
    BuildContext context,
    EmbedContext embedContext,
  ) {
    return Row(
      children: [
        const Icon(Icons.access_time_rounded),
        Text(embedContext.node.value.data as String),
      ],
    );
  }
}
