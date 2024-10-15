import 'package:flutter/material.dart';

class OptionDropDown {
  OptionDropDown({
    required this.text,
    required this.value,
  });

  final String text;
  final String value;
}

class DropDown extends StatelessWidget {
  const DropDown({
    required this.values,
    required this.onChanged,
    this.selectedValue,
    this.expanded = true,
    super.key,
  });

  final String? selectedValue;
  final List<OptionDropDown> values;
  final Function(String?)? onChanged;
  final bool expanded;
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: selectedValue,
      isExpanded: true,
      underline: const SizedBox.shrink(),
      alignment: AlignmentDirectional.bottomEnd,
      items: values.map<DropdownMenuItem<String>>((OptionDropDown option) {
        return DropdownMenuItem<String>(
          value: option.value,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(option.text),
          ),
        );
      }).toList(),
      onChanged: onChanged,
    );
  }
}
