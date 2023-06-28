
class CategoriesModel {
  List<Categories1>? cate;

  CategoriesModel({this.cate});

  CategoriesModel.fromJson(Map<String, dynamic> json) {
    cate = json["categories"] == null ? null : (json["categories"] as List).map((e) => Categories1.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if(cate != null) {
      _data["categories"] = cate?.map((e) => e.toJson()).toList();
    }
    return _data;
  }
}

class Categories1 {
  String? categoriesId;
  String? categoriesName;
  String? categoriesDescription;
  String? categoriesImage;
  String? categoriesTimecreated;

  Categories1({this.categoriesId, this.categoriesName, this.categoriesDescription, this.categoriesImage, this.categoriesTimecreated});

  Categories1.fromJson(Map<String, dynamic> json) {
    categoriesId = json["categories_id"];
    categoriesName = json["categories_name"];
    categoriesDescription = json["categories_description"];
    categoriesImage = json["categories_image"];
    categoriesTimecreated = json["categories_timecreated"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["categories_id"] = categoriesId;
    _data["categories_name"] = categoriesName;
    _data["categories_description"] = categoriesDescription;
    _data["categories_image"] = categoriesImage;
    _data["categories_timecreated"] = categoriesTimecreated;
    return _data;
  }
}