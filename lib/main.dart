import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:managemenet_app/helper/binding.dart';
import 'package:managemenet_app/constants/routes.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      locale: const Locale('ar'),
      debugShowCheckedModeBanner: false,
      initialBinding: Binding(),
      initialRoute: Routes.home,
      getPages: getPages,
    );
  }
}
