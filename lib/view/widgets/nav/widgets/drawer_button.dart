import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:managemenet_app/view/widgets/custom_widgets/cutom_text_widget.dart';

Widget customDrawerButton(
        {required route,
        required String text,
        required icon,
        required double? iconSize}) =>
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: MaterialButton(
        onPressed: () {
          Get.toNamed(route);
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: iconSize,
            ),
            const SizedBox(width: 20),
            customText(
              text: text,
              fontType: 'b',
              fontSize: 20,
            ),
            const Spacer(),
          ],
        ),
      ),
    );
