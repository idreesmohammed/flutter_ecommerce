import 'dart:convert';
import 'dart:io';

import 'package:flutter_ecommerce/model/getproductsmodel.dart';
import 'package:flutter_ecommerce/utils/constants.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:core';

class GetProducts extends GetxController {
  @override
  void onInit() {
    super.onInit();
    getProducts();
  }

  RxList<Products> dataList = <Products>[].obs;
  getProducts() async {
    final response = await http.get(Uri.parse(Constants.api));
    try {
      if (response.statusCode == 200) {
        final result = jsonDecode(response.body) as List<dynamic>;
        dataList.value = result.map((e) => Products.fromJson(e)).toList();
      }
    } on SocketException {
      throw Exception();
    } on HttpException {
      throw Exception();
    } catch (e) {
      return e;
    }
  }
}
