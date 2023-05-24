class CategoryModel {
  int? id;
  String? title;
  String? description;
  String? image;
  String? visible;
  String? productsCount;

  CategoryModel.fromJson({required Map<String, dynamic> data}) {
    id=data["id"];
    title=data["title"];
    description=data["description"];
    image=data["image"];
    visible=data["visible"];
    productsCount=
    data["products_count"];
  }
}
