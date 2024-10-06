import 'package:flutter/material.dart';
import 'package:managemenet_app/constants/colors.dart';
import 'package:managemenet_app/logic/screen_dimensions.dart';
import 'package:managemenet_app/view/widgets/nav/widgets/drawer.dart';

Widget nav({required BuildContext context, required Widget body}) {
  return Scaffold(
    backgroundColor: AppColors.backgroundColor,
    extendBodyBehindAppBar: true,
    appBar: isMobile(context)
        ? AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            scrolledUnderElevation: 0,
          )
        : null,
    drawer: isMobile(context) ? drawer(context: context) : null,
    body: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (isDesktop(context) || isTablet(context))
          drawer(context: context),
        Expanded(
          child: Padding(
            padding: isMobile(context)
                ? const EdgeInsets.fromLTRB(16, 60, 16, 16)
                : const EdgeInsets.all(16),
            child: body,
          ),
        ),
      ],
    ),
    bottomNavigationBar: isMobile(context)
        ? BottomNavigationBar(
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'الرئيسية',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.category),
                label: 'الفئات',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: 'الإعدادات',
              ),
            ],
            selectedItemColor: Colors.blueAccent,
            unselectedItemColor: Colors.grey,
            onTap: (index) {
              // إضافة الأحداث عند الضغط على كل عنصر
            },
          )
        : null,
  );
}
