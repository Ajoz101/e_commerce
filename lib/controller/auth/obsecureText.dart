import 'package:get/get.dart';

class ObsecureController extends GetxController {
  bool isSeen = false;

  onClicked() {
    isSeen = !isSeen;
    update();
  }
}
