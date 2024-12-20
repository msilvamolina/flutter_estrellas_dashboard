import 'package:choice/choice.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../themes/styles/typography.dart';
import '../controllers/new_variations_pickers_controller.dart';
import '../widgets/color_inline_picker.dart';
import '../widgets/custom_choice_item.dart';
import '../widgets/tags_inline_picker.dart';

class NewVariationsPickersView extends GetView<NewVariationsPickersController> {
  const NewVariationsPickersView({super.key});

  @override
  Widget build(BuildContext context) {
    // Controlador de selección para las etiquetas y colores
    final tagsController = GlobalKey<_MultipleInlineState>();
    final colorsController = GlobalKey<_InlineGridState>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('NewVariationsPickersView'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: MultipleInline(
              key: tagsController,
            ),
          ),
          Expanded(
            child: InlineGrid(
              key: colorsController,
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          onPressed: () {
            // Recoger las selecciones de ambos widgets
            final selectedTags =
                tagsController.currentState?.multipleSelected ?? [];
            final selectedColors =
                colorsController.currentState?.selectedValue ?? [];

            // Pasar los valores al controlador
            controller.saveSelections(selectedTags, selectedColors);

            // Opcional: mostrar mensaje de éxito
            Get.snackbar(
              'Guardado',
              'Las selecciones han sido guardadas correctamente.',
              snackPosition: SnackPosition.BOTTOM,
            );
          },
          child: const Text('Guardar'),
        ),
      ),
    );
  }
}

class MultipleInline extends StatefulWidget {
  const MultipleInline({super.key});

  @override
  State<MultipleInline> createState() => _MultipleInlineState();
}

class _MultipleInlineState extends State<MultipleInline> {
  List<String> choices = [
    'News2',
    'Entertainment',
    'Politics',
    'Automotive',
    'Sports',
    'Education',
    'Fashion',
    'Travel',
    'Food',
    'Tech',
    'Science',
    'Arts'
  ];
  List<String> multipleSelected = [];

  void setMultipleSelected(List<String> value) {
    setState(() => multipleSelected = value);
  }

  @override
  Widget build(BuildContext context) {
    return InlineChoice<String>(
      multiple: true,
      clearable: true,
      value: multipleSelected,
      onChanged: setMultipleSelected,
      itemCount: choices.length,
      itemBuilder: (selection, i) {
        return ChoiceChip(
          selected: selection.selected(choices[i]),
          onSelected: selection.onSelected(choices[i]),
          label: Text(choices[i]),
        );
      },
      listBuilder: ChoiceList.createWrapped(
        spacing: 10,
        runSpacing: 10,
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 25,
        ),
      ),
    );
  }
}

class InlineGrid extends StatefulWidget {
  const InlineGrid({super.key});

  @override
  State<InlineGrid> createState() => _InlineGridState();
}

class _InlineGridState extends State<InlineGrid> {
  // Lista de colores Material Design
  final Map<String, MaterialColor> materialColors = {
    'Rojo': Colors.red,
    'Rosa': Colors.pink,
    'Púrpura': Colors.purple,
    'Índigo': Colors.indigo,
    'Azul': Colors.blue,
    'Cian': Colors.cyan,
    'Verde Azulado': Colors.teal,
    'Verde': Colors.green,
    'Lima': Colors.lime,
    'Amarillo': Colors.yellow,
    'Ámbar': Colors.amber,
    'Naranja': Colors.orange,
    'Marrón': Colors.brown,
    'Gris': Colors.grey,
    'Azul Gris': Colors.blueGrey,
  };

  List<String> selectedValue = [];

  void setSelectedValue(List<String> value) {
    setState(() => selectedValue = value);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(10.0),
      child: Choice<String>.inline(
        clearable: true,
        multiple: true,
        value: selectedValue,
        onChanged: setSelectedValue,
        itemCount: materialColors.length,
        itemBuilder: (state, i) {
          final colorName = materialColors.keys.elementAt(i);
          final materialColor = materialColors[colorName]!;
          return CustomChoiceItem(
            label: colorName,
            color: materialColor[500]!, // Color base
            selectedColor: materialColor[700]!, // Color al seleccionar
            width: 80,
            height: 80,
            selected: state.selected(colorName),
            onSelect: state.onSelected(colorName),
          );
        },
        listBuilder: ChoiceList.createGrid(
          direction: Axis.vertical,
          spacing: 10,
          columns: 4, // Más columnas para ocupar el espacio
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 10,
          ),
        ),
      ),
    );
  }
}
