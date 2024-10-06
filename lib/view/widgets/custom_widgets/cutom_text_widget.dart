import 'package:flutter/material.dart';
import 'package:managemenet_app/constants/colors.dart';

Widget customText({
  required String text,
  double fontSize = 16,
  Color color = AppColors.blackColor,
  String fontType = "",
  overflow = TextOverflow.ellipsis,
  maxLines = 20,
}) =>
    Text(
      text,
      overflow: overflow,
      maxLines: maxLines,
      style: TextStyle(
          color: color, fontSize: fontSize, fontFamily: 'Cairo$fontType'),
    );
