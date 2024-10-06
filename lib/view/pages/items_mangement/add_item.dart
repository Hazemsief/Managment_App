import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:managemenet_app/logic/items_logic.dart';
import 'package:managemenet_app/models/item_model.dart';
import 'package:managemenet_app/logic/screen_dimensions.dart';
import 'package:managemenet_app/view/widgets/custom_widgets/custom_button.dart';
import 'package:managemenet_app/view/widgets/custom_widgets/text_form_feild.dart';
import 'package:managemenet_app/view/widgets/custom_widgets/cutom_text_widget.dart';

class AddItem extends GetView<ItemsLogic> {
  final String? categoryId;
  const AddItem({super.key, required this.categoryId});

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
                hintText: 'أسم المنتج',
                controller: controller.nameController,
                widthOfTextField: 0.4,
              ),
              customTextFormFeild(
                context: context,
                hintText: 'معرف المنتج',
                controller: controller.idController,
                widthOfTextField: 0.4,
              ),
              customTextFormFeild(
                context: context,
                hintText: 'رابط صورة المنتج',
                controller: controller.imageController,
                widthOfTextField: 0.4,
              ),
              customButton(
                onPressed: () {
                  if (controller.nameController.text.isNotEmpty) {
                    controller.addItem(ItemModel(
                      name: controller.nameController.text,
                      id: controller.idController.text,
                      image: controller.imageController.text,
                      type: categoryId,
                    ));
                    
                    Get.offAllNamed('/home');
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
                text: customText(text: 'أضف المنتج'),
                context: context,
                widthPresentage: 0.4,
                color: Colors.grey,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
