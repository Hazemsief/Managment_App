import 'package:get/get.dart';
import 'package:managemenet_app/logic/items_logic.dart';
import 'package:managemenet_app/logic/category_logic.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ItemsLogic(), fenix: true);
    Get.lazyPut(() => CategoriesLogic(), fenix: true);
  }
}
