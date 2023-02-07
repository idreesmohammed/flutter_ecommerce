import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter_ecommerce/helper/snackbargetx.dart';
import 'package:flutter_ecommerce/model/addtocartmodel.dart';
import 'package:flutter_ecommerce/utils/colorcode.dart';
import 'package:flutter_ecommerce/utils/constants.dart';
import 'package:flutter_ecommerce/utils/textdecoration.dart';
import 'package:get/get.dart';

class ListToAddProduct extends GetxController {
  static RxList<AddToCartModel> productList = <AddToCartModel>[].obs;
  static RxString text = "".obs;
  static RxInt productQty = 1.obs;
  String addNumbersForCartIcon() {
    return text.value = productList.length.toString();
  }

  incrementCounter() {
    if (productQty.value >= 5) {
      return SnackBarClassFromGetX().getSnackBar(Constants.alert,
          Constants.limitForItem, ColorCode.appBarColor, ColorCode.red);
    } else {
      return productQty++;
    }
  }

  decrementCounter() {
    if (productQty > 1) {
      return productQty--;
    } else {
      return Get.defaultDialog(
          onCancel: () {},
          title:
              "Dou you wish to remove?\n your item will be removed from your cart",
          titleStyle: TextDecoration().customFont(FontWeight.w400));
    }
  }

  productTotalQuantity(productPrice) {
    final parsing = double.parse(productPrice).round();
    return (parsing * (productQty.value));
  }
}
