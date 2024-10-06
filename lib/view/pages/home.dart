import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:managemenet_app/logic/category_logic.dart';
import 'package:managemenet_app/view/widgets/nav/nav.dart';
import 'package:managemenet_app/view/pages/items_mangement/items_mangement.dart';
import 'package:managemenet_app/view/widgets/custom_widgets/cutom_text_widget.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return nav(
      context: context,
      body: Column(
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.end,children: [
            MaterialButton(onPressed: () {}, child: Row(
              children: [
                customText(text: 'أضف تصنيف جديد'),
                const SizedBox(width: 5),
                const Icon(Icons.add),
              ],
            ))
          ]),
          GetBuilder(
            init: CategoriesLogic(),
            builder: (x) {
              return Obx(() => GridView.builder(
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 250,
                    mainAxisExtent: 250,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 15,
                  ),
                  itemCount: x.categories.length,
                  shrinkWrap: true,
                  itemBuilder: (_, i) {
                    return MaterialButton(
                        onPressed: () =>
                            Get.to(ItemsMangement(id: x.categories[i].id!)),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SizedBox(
                                  width: 150,
                                  height: 150,
                                  child: Image.network(x.categories[i].image!)),
                            ),
                            const SizedBox(height: 15),
                            customText(
                                text: x.categories[i].name!,
                                fontSize: 30,
                                fontType: 's'),
                          ],
                        ));
                  }));
            },
          ),
        ],
      ),
    );
  }
}
