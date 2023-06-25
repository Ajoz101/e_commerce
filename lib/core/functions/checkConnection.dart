import 'dart:io';

import 'package:http/http.dart' as http;

checkInternet() async {
  try {
    var result = await InternetAddress.lookup('google.com');
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      return result;
    }
  } on SocketException catch (_) {
    return false;
  }
}
