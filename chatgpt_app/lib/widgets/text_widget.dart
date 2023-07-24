import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class TextWidget extends StatelessWidget {
  final String label;
  Color? color;
  double? fontSize;
  FontWeight? fontWeight;
  TextWidget({
    super.key,
    required this.label,
    this.color,
    this.fontSize = 18,
    this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: TextStyle(
        color: color ?? Colors.white,
        fontSize: fontSize,
        fontWeight: fontWeight ?? FontWeight.w500,
      ),
    );
  }
}
