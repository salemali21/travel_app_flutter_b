class CategoryModel {
  String? name;
  String? image;
  CategoryModel({
     this.name,
     this.image,
  });

  CategoryModel.fromJson(Map<String, dynamic> data) {
    name = data["name"];
    image = data["image"];
  }
}
