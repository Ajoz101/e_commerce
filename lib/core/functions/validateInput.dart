import 'package:get/get.dart';

validInput(String val, int min, int max, type) {
  if (val.isEmpty) {
    return "$val cant be empty!";
  }
  if (type == "username") {
    if (!GetUtils.isUsername(val)) {
      return "Not valid Username Man!";
    }
  }
  if (type == "email") {
    if (!GetUtils.isEmail(val)) {
      return "Not valid email Man!";
    }
  }

  if (type == "phone") {
    if (!GetUtils.isPhoneNumber(val)) {
      return "Not valid number Man!";
    }
  }
  // if (type == "password") {
  //   if (!GetUtils.isUsername(val)) {
  //     return "Not valid Username Man!";
  //   }
  // }

  if (val.length < min) {
    return "$min is Too Short!!!";
  }
  if (val.length > max) {
    return "way too many input CANT DO !!!!";
  }
}
