class CategoryModel {
  String? name; // اسم الفئة
  String? id; // معرف الفئة
  String? image; // رابط الصورة

  CategoryModel({
    required this.name,
    required this.id,
    required this.image,
  });

  // تحويل JSON إلى كائن CategoryModel
  CategoryModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
    image = json['image'];
  }

  // تحويل كائن CategoryModel إلى JSON
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'id': id,
      'image': image,
    };
  }
}
