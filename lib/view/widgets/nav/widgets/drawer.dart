import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:managemenet_app/constants/colors.dart';
import 'package:managemenet_app/constants/routes.dart';

Widget drawer({required BuildContext context}) {
  return Drawer(
    backgroundColor: AppColors.drawerBackgroundColor,
    child: ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        const DrawerHeader(
          decoration: BoxDecoration(
            color: AppColors.primaryColor,
          ),
          child: Text('القائمة الرئيسية'),
        ),
        ListTile(
          leading: const Icon(Icons.home),
          title: const Text('الرئيسية'),
          onTap: () {
            Get.toNamed(Routes.home);
          },
        ),
        ListTile(
          leading: const Icon(Icons.category),
          title: const Text('الفئات'),
          onTap: () {
            Get.toNamed(Routes.home);
          },
        ),
        ListTile(
          leading: const Icon(Icons.settings),
          title: const Text('الإعدادات'),
          onTap: () {
            Get.toNamed(Routes.home);
          },
        ),
      ],
    ),
  );
}
