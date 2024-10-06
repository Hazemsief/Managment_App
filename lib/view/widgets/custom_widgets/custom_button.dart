import 'package:flutter/material.dart';
import 'package:managemenet_app/constants/colors.dart';
import 'package:managemenet_app/logic/screen_dimensions.dart';



Widget customButton({
  required void Function() onPressed,
  required Widget text,
  required context,
  double widthPresentage = 0.8,
  color = AppColors.secondryColor
}) =>
    MaterialButton(
      onPressed: onPressed,
      child: Container(
        width: width(context) * widthPresentage,
        decoration: BoxDecoration(
          color: color,
          border: Border.all(
            width: 1,
            color: const Color.fromARGB(255, 12, 12, 12),
          ),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Center(child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: text,
        )),
      ),
    );
