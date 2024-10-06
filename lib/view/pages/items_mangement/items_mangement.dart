import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:managemenet_app/logic/items_logic.dart';
import 'package:managemenet_app/models/item_model.dart';
import 'package:managemenet_app/view/widgets/custom_widgets/cutom_text_widget.dart';

class ItemsMangement extends GetView<ItemsLogic> {
  final String? id;
  const ItemsMangement({super.key, required this.id});

  void _openAddItemBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: controller.nameController,
                decoration: InputDecoration(labelText: 'اسم المنتج'),
              ),
              TextField(
                controller: controller.nameController,
                decoration: InputDecoration(labelText: 'النوع'),
              ),
              TextField(
                controller: controller.idController,
                decoration: InputDecoration(labelText: 'المعرف'),
              ),
              TextField(
                controller: controller.imageController,
                decoration: InputDecoration(labelText: 'الصورة'),
              ),
              SizedBox(height: 15),
              ElevatedButton(
                onPressed: () {
                  controller.addItem(ItemModel(
                    name: controller.nameController.text,
                    id: controller.idController.text,
                    image: controller.imageController.text,
                    type: id,
                  ));
                  Navigator.pop(context);
                },
                child: Text('أضف عنصر'),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => _openAddItemBottomSheet(context),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Table(
              columnWidths: const {
                0: FixedColumnWidth(200),
                1: FixedColumnWidth(200),
                2: FixedColumnWidth(400),
                3: FixedColumnWidth(400),
                4: FixedColumnWidth(150),
              },
              border: TableBorder.all(color: Colors.grey, width: 1.5),
              children: const [
                TableRow(
                  decoration: BoxDecoration(color: Colors.grey),
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('أسم المنتج', textAlign: TextAlign.center),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('النوع', textAlign: TextAlign.center),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('المعرف', textAlign: TextAlign.center),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('الصورة', textAlign: TextAlign.center),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('الإجراءات', textAlign: TextAlign.center),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Obx(
            () => Expanded(
              child: ListView(
                children: List.generate(controller.items.length, (i) {
                  return controller.items[i].type == id
                      ? Table(
                          border:
                              TableBorder.all(color: Colors.grey, width: 1.0),
                          children: [
                            TableRow(
                              children: [                            
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(controller.items[i].name!,
                                      textAlign: TextAlign.center),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(controller.items[i].type!,
                                      textAlign: TextAlign.center),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(controller.items[i].id!,
                                      textAlign: TextAlign.center),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image.network(
                                      controller.items[i].image!,
                                      fit: BoxFit.cover),
                                ),
                                IconButton(
                                  onPressed: () {
                                    controller.removeItem(i);
                                    Get.showSnackbar(GetSnackBar(
                                      messageText: customText(
                                        text: 'تم الحذف',
                                        color: Colors.white,
                                      ),
                                      duration: const Duration(seconds: 5),
                                    ));
                                  },
                                  icon: const Icon(Icons.delete,
                                      color: Colors.red),
                                ),
                              ],
                            ),
                          ],
                        )
                      : const SizedBox.shrink();
                }),
              ),
            ),
          )
        ],
      ),
    );
  }
}
