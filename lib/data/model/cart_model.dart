
class CartModel {
  String? total;
  String? itemscount;
  String? cartId;
  String? cartUsersid;
  String? cartItemsid;
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

  CartModel({this.total, this.itemscount, this.cartId, this.cartUsersid, this.cartItemsid, this.itemsId, this.itemsName, this.itemsDescription, this.itemsTime, this.itemsImage, this.itemsCount, this.itemesActive, this.itemsPrice, this.itemsDiscount, this.itemsCate});

  CartModel.fromJson(Map<String, dynamic> json) {
    total = json["total"];
    itemscount = json["itemscount"];
    cartId = json["cart_id"];
    cartUsersid = json["cart_usersid"];
    cartItemsid = json["cart_itemsid"];
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
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["total"] = total;
    _data["itemscount"] = itemscount;
    _data["cart_id"] = cartId;
    _data["cart_usersid"] = cartUsersid;
    _data["cart_itemsid"] = cartItemsid;
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
    return _data;
  }
}