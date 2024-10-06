import 'package:flutter/material.dart';
import 'package:managemenet_app/constants/colors.dart';
import 'package:managemenet_app/logic/screen_dimensions.dart';

Widget customTextFormFeild(
    {required context,
    required hintText,
    key,
    required controller,
    inputFormatters,
    TextInputType keyboardType = TextInputType.name,
    maxlines,
    validator,
    widthOfTextField = 0.8}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: SizedBox(
      width: width(context) * widthOfTextField,
      child: Form(
        key: key,
        child: Column(
          children: [
            TextFormField(
              inputFormatters: inputFormatters,
              validator: validator,
              controller: controller,
              maxLines: maxlines,
              textAlign: TextAlign.right,
              style: const TextStyle(
                  color: AppColors.secondryColor, fontFamily: "Cairo"),
              decoration: InputDecoration(
                errorStyle: const TextStyle(fontFamily: "Cairo"),
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                fillColor: Theme.of(context).scaffoldBackgroundColor,
                hintText:
                    hintText,
                hintStyle: const TextStyle(color: Color.fromARGB(125, 0, 0, 0)),
                filled: true,
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
              ),
              keyboardType: keyboardType,
            ),
          ],
        ),
      ),
    ),
  );
}
