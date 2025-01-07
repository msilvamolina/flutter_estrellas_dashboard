import 'package:flutter/material.dart';

class CustomChoiceItem extends StatelessWidget {
  final String label;
  final Color color; // Color base
  final Color selectedColor; // Color al seleccionar
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? margin;
  final bool selected;
  final ValueChanged<bool> onSelect;

  const CustomChoiceItem({
    Key? key,
    required this.label,
    required this.color,
    required this.selectedColor,
    this.width,
    this.height,
    this.margin,
    this.selected = false,
    required this.onSelect,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(4),
      child: AnimatedContainer(
        width: width,
        height: height,
        margin: margin,
        duration: const Duration(milliseconds: 200),
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          color: selected ? selectedColor : color.withOpacity(0.3),
          borderRadius: BorderRadius.all(Radius.circular(selected ? 100 : 10)),
          border: Border.all(
            color: Colors.white, // Borde blanco
            width: 1,
          ),
        ),
        child: InkWell(
          borderRadius: BorderRadius.all(Radius.circular(selected ? 50 : 10)),
          onTap: () => onSelect(!selected),
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              if (selected)
                Icon(
                  Icons.check,
                  color: Colors.white,
                  size: 20,
                ),
              Positioned(
                left: 9,
                right: 9,
                bottom: 10,
                child: Text(
                  label,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color:
                        selected ? Colors.white : theme.colorScheme.onSurface,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
