import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:managemenet_app/models/category_model.dart';

class CategoriesLogic extends GetxController {
  final TextEditingController idText = TextEditingController();
  final TextEditingController nameText = TextEditingController();
  final TextEditingController imageText = TextEditingController();
  
  RxList<CategoryModel> categories = <CategoryModel>[].obs;

  @override
  void onClose() {
    idText.dispose();
    nameText.dispose();
    imageText.dispose();
    super.onClose();
  }

  addCategory(CategoryModel x) async {
    if (x.id!.isEmpty || x.name!.isEmpty || x.image!.isEmpty) {
      Get.snackbar(
        'خطا', 
        'يجب ملئ جميع العناصر',
        snackPosition: SnackPosition.BOTTOM, 
        duration: Duration(seconds: 5), 
      );
      return;
    }

    if (categories.any((category) => category.id == x.id)) {
      Get.snackbar(
        'تكرار', 
        'النوع موجود بالفعل',
        snackPosition: SnackPosition.BOTTOM, 
        duration: Duration(seconds: 5), 
      );
      return;
    }

    var category = CategoryModel(name: x.name, id: x.id, image: x.image);
    categories.add(category);
    Get.snackbar(
      'نجاح', 
      'تمت اضافه النوع بنجاح',
      snackPosition: SnackPosition.BOTTOM, 
      duration: Duration(seconds: 5), 
    );
  }
}
