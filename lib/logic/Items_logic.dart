import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:managemenet_app/models/item_model.dart';

class ItemsLogic extends GetxController {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController idController = TextEditingController();
  final TextEditingController imageController = TextEditingController();

  var items = <ItemModel>[].obs;

  @override
  void onClose() {
    nameController.dispose();
    idController.dispose();
    imageController.dispose();
    super.onClose();
  }

  void addItem(ItemModel item) {
    if (item.name!.isEmpty || item.id!.isEmpty || item.image!.isEmpty) {
      Get.snackbar(
        'خطأ', 
        'لابد التأكد من إدخال جميع العناصر',
        snackPosition: SnackPosition.BOTTOM,
        duration: Duration(seconds: 5), 
      );
      return;
    }

    if (items.any((existingItem) => existingItem.id == item.id)) {
      Get.snackbar(
        'مكرر', 
        'يوجد عنصر آخر بنفس الـ ID',
        snackPosition: SnackPosition.BOTTOM,
        duration: Duration(seconds: 5), 
      );
      return;
    }

    items.add(ItemModel(
        name: item.name, type: item.type, id: item.id, image: item.image));
    
    // Clear text fields
    nameController.clear();
    idController.clear();
    imageController.clear();

    Get.snackbar(
      'نجاح', 
      'تمت الإضافة بنجاح',
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: 5), 
    );
  }

  // Update item method
  void updateItem(int index, ItemModel updatedItem) {
    if (index >= 0 && index < items.length) {
      items[index] = updatedItem; 
      Get.snackbar(
        'نجاح', 
        'تم تحديث العنصر',
        snackPosition: SnackPosition.BOTTOM,
        duration: Duration(seconds: 5), 
      );
    } else {
      Get.snackbar(
        'خطأ', 
        'فهرس غير صالح',
        snackPosition: SnackPosition.BOTTOM,
        duration: Duration(seconds: 5), 
      );
    }
  }

  void removeItem(int index) {
    if (index >= 0 && index < items.length) {
      items.removeAt(index);
      Get.snackbar(
        'نجاح', 
        'العنصر تم إزالته',
        snackPosition: SnackPosition.BOTTOM,
        duration: Duration(seconds: 5), 
      );
    } else {
      Get.snackbar(
        'خطأ', 
        'فهرس غير صالح',
        snackPosition: SnackPosition.BOTTOM,
        duration: Duration(seconds: 5), 
      );
    }
  }
}
