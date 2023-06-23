import 'package:get/get.dart';

class CustomTranslate extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        "ar": {"welcome":"مرحبا"},
        "en": {"welcome":"Hello"},
      };
}
