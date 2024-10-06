class ItemModel {
  String? name,type,id,image;
  ItemModel({
    required this.name,
    required this.type,
    required this.image,
    required this.id,
  });
/*
  Admin.fromJson(dynamic map) {
    name = map['name'];
    type = map['type'];
    password = map['password'];
    id = map['id'];
  }

  toJson() {
    return {
      'name': name,
      'type': type,
      'password': password,
      'id': id,
    };
  }
  */
}
