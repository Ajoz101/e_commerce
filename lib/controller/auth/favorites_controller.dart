import 'package:e_commerce/core/services/services.dart';
import 'package:e_commerce/data/source/remote/favorite/favorite_data.dart';
import 'package:get/get.dart';

import '../../core/class/statusRequest.dart';
import '../../core/functions/handlingData.dart';

class FavoriteController extends GetxController {
  //key -> ID of items
  //value -> is it added or not (1 or 0)
  Map isFavorite = {};

  setFavorite(id, val) {
    isFavorite[id] = val;
    // val == "1" ? addFave(val) : removeFave(val);
    // print("id "+ id + "\n" + val);
    print("id" + isFavorite.values.toList().toString());
    update();
  }

  FavoriteData fave = FavoriteData(Get.find());
  List data = [];
  StatusRequest? statusRequest;
  addFave(String itemId) async {
    statusRequest = StatusRequest.loading;
    var response =
        await fave.addFave(userId: sharedPref.getString('id'), itemId: itemId);
    update();

    statusRequest = handlingData(response);
    update();
    if (StatusRequest.success == statusRequest ||
        StatusRequest.offlineFailure == statusRequest) {
      print(statusRequest);
      if (response["status"] == "success") {
        data.addAll(response["data"]);
        // print(data);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  removeFave(String itemId) async {
    statusRequest = StatusRequest.loading;
    var response =
        await fave.addFave(userId: sharedPref.getString('id'), itemId: itemId);
    update();

    statusRequest = handlingData(response);
    update();
    if (StatusRequest.success == statusRequest ||
        StatusRequest.offlineFailure == statusRequest) {
      print(statusRequest);
      if (response["status"] == "success") {
        data.addAll(response["data"]);
        // print(data);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }
}
