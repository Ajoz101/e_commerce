import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/class/statusRequest.dart';
import 'package:e_commerce/core/functions/checkConnection.dart';
import 'package:http/http.dart' as http;

class Crud {
  Future<Either<StatusRequest, Map>> postData(String url, Map data) async {
    if (await checkInternet()) {
      var response = await http.post(Uri.parse(url), body: data);
      if (response.statusCode == 200 || response.statusCode == 201) {
        Map responseBody = jsonDecode(response.body);
        return Right(responseBody);
      }
    } else {
      return const Left(StatusRequest.offlineFailure);
    }
    throw Exception();
  }

  Future<Either<StatusRequest, Map>> getOffline(String url, Map data) async {
    var response = await http.post(Uri.parse(url), body: data);
    if (response.statusCode == 200 || response.statusCode == 201) {
      Map responseBody = jsonDecode(response.body);
      return Right(responseBody);
    }

    throw Exception();
  }
}
