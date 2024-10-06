import 'package:get/get.dart';
import 'package:managemenet_app/view/pages/categories_mangement/home.dart';

class Routes {
  static String home = '/';
}

final getPages = [
  GetPage(
    name: Routes.home,
    page: () => const Home(),
  ),
];
