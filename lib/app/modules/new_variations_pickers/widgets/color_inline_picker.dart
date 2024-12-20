import 'package:flutter/material.dart';
import 'package:choice/choice.dart';

import 'custom_choice_item.dart';

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
