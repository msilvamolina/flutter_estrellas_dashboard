import 'package:choice/choice.dart';
import 'package:estrellas_dashboard/app/components/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/new_variations_pickers_controller.dart';
import '../widgets/custom_choice_item.dart';

class NewVariationsPickersView extends GetView<NewVariationsPickersController> {
  const NewVariationsPickersView({super.key});

  @override
  Widget build(BuildContext context) {
    // Controlador de selección para las etiquetas y colores
    final tagsController = GlobalKey<_MultipleInlineState>();
    final colorsController = GlobalKey<_InlineGridState>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Selecciona las variaciones'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            MultipleInline(
              key: tagsController,
            ),
            InlineGrid(
              key: colorsController,
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SafeArea(
          child: Button(
            onPressed: () {
              // Recoger las selecciones de tallas y colores
              final selectedTags =
                  tagsController.currentState?.multipleSelected.map((tag) {
                final sizeMap = tagsController.currentState!.sizeMap;
                return {
                  'name': tag,
                  'abbreviation': sizeMap[tag]!,
                };
              }).toList();

              final selectedColors =
                  colorsController.currentState?.selectedValue.map((name) {
                final materialColor =
                    colorsController.currentState!.materialColors[name]!;
                return {
                  'name': name,
                  'hex':
                      '#${materialColor[500]!.value.toRadixString(16).substring(2).toUpperCase()}',
                };
              }).toList();

              // Pasar los valores al controlador
              controller.saveSelections(selectedTags, selectedColors);
            },
            label: 'Guardar',
          ),
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
  // Mapa de tallas con sus abreviaturas
  final Map<String, String> sizeMap = {
    'Extra Extra Small': 'XXS',
    'Extra Small': 'XS',
    'Small': 'S',
    'Medium': 'M',
    'Large': 'L',
    'Extra Large': 'XL',
    'Extra Extra Large': 'XXL',
  };

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
      itemCount: sizeMap.length,
      itemBuilder: (selection, i) {
        final sizeName = sizeMap.keys.elementAt(i);
        return ChoiceChip(
          selected: selection.selected(sizeName),
          onSelected: selection.onSelected(sizeName),
          label: Text(sizeName),
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
