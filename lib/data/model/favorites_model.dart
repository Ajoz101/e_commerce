
class FavoritesModel {
  String? itemsId;
  String? itemsName;
  String? itemsDescription;
  String? itemsTime;
  String? itemsImage;
  String? itemsCount;
  String? itemesActive;
  String? itemsPrice;
  String? itemsDiscount;
  String? itemsCate;
  String? categoriesId;
  String? categoriesName;
  String? categoriesDescription;
  String? categoriesImage;
  String? categoriesTimecreated;
  String? faveId;
  String? faveUsersid;
  String? faveItemsid;

  FavoritesModel({this.itemsId, this.itemsName, this.itemsDescription, this.itemsTime, this.itemsImage, this.itemsCount, this.itemesActive, this.itemsPrice, this.itemsDiscount, this.itemsCate, this.categoriesId, this.categoriesName, this.categoriesDescription, this.categoriesImage, this.categoriesTimecreated, this.faveId, this.faveUsersid, this.faveItemsid});

  FavoritesModel.fromJson(Map<String, dynamic> json) {
    itemsId = json["items_id"];
    itemsName = json["items_name"];
    itemsDescription = json["items_description"];
    itemsTime = json["items_time"];
    itemsImage = json["items_image"];
    itemsCount = json["items_count"];
    itemesActive = json["itemes_active"];
    itemsPrice = json["items_price"];
    itemsDiscount = json["items_discount"];
    itemsCate = json["items_cate"];
    categoriesId = json["categories_id"];
    categoriesName = json["categories_name"];
    categoriesDescription = json["categories_description"];
    categoriesImage = json["categories_image"];
    categoriesTimecreated = json["categories_timecreated"];
    faveId = json["fave_id"];
    faveUsersid = json["fave_usersid"];
    faveItemsid = json["fave_itemsid"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["items_id"] = itemsId;
    _data["items_name"] = itemsName;
    _data["items_description"] = itemsDescription;
    _data["items_time"] = itemsTime;
    _data["items_image"] = itemsImage;
    _data["items_count"] = itemsCount;
    _data["itemes_active"] = itemesActive;
    _data["items_price"] = itemsPrice;
    _data["items_discount"] = itemsDiscount;
    _data["items_cate"] = itemsCate;
    _data["categories_id"] = categoriesId;
    _data["categories_name"] = categoriesName;
    _data["categories_description"] = categoriesDescription;
    _data["categories_image"] = categoriesImage;
    _data["categories_timecreated"] = categoriesTimecreated;
    _data["fave_id"] = faveId;
    _data["fave_usersid"] = faveUsersid;
    _data["fave_itemsid"] = faveItemsid;
    return _data;
  }
}