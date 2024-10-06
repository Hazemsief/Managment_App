import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:managemenet_app/logic/category_logic.dart';
import 'package:managemenet_app/models/category_model.dart';
import 'package:managemenet_app/logic/screen_dimensions.dart';
import 'package:managemenet_app/view/widgets/custom_widgets/custom_button.dart';
import 'package:managemenet_app/view/widgets/custom_widgets/text_form_feild.dart';
import 'package:managemenet_app/view/widgets/custom_widgets/cutom_text_widget.dart';

class AddCategory extends GetView<CategoriesLogic> {
  const AddCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
      ),
      body: SizedBox(
        width: width(context),
        child: SingleChildScrollView(
          child: Column(
            children: [
              customTextFormFeild(
                  context: context,
                  hintText: 'معرف التصنيف',
                  controller: controller.idText,
                  widthOfTextField: 0.4),
              customTextFormFeild(
                  context: context,
                  hintText: 'أسم التصنيف',
                  controller: controller.nameText,
                  widthOfTextField: 0.4),
              customTextFormFeild(
                  context: context,
                  hintText: 'رابط صورة التصنيف',
                  controller: controller.imageText,
                  widthOfTextField: 0.4),
              customButton(
                  onPressed: () {
                    if (controller.nameText.text.isNotEmpty) {
                      controller.addCategory(CategoryModel(
                        name: controller.nameText.text,
                        id: controller.idText.text,
                        image: controller.imageText.text,
                      ));
                      controller.idText.clear();
                      controller.imageText.clear();
                      controller.nameText.clear();
                    } else {
                      Get.showSnackbar(GetSnackBar(
                        messageText: customText(
                          text: 'تأكد من المدخلات',
                          color: Colors.white,
                        ),
                        duration: const Duration(seconds: 5),
                      ));
                    }
                  },
                  text: customText(text: 'أضف التصنيف'),
                  context: context,
                  widthPresentage: 0.4,
                  color: Colors.grey),
            ],
          ),
        ),
      ),
    );
  }
}
