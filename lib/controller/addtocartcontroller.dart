import 'package:flutter_ecommerce/helper/listtoaddproduct.dart';
import 'package:flutter_ecommerce/helper/snackbargetx.dart';
import 'package:flutter_ecommerce/model/addtocartmodel.dart';
import 'package:flutter_ecommerce/utils/constants.dart';
import 'package:get/get.dart';
import '../utils/colorcode.dart';

class AddToCartController extends GetxController {
  var forTesting;
  // addToCartButton(productName, id, productRate, productImage, qty) {
  //   print("inside");
  //   for (int i = 0; i < ListToAddProduct.productList.length; i++) {
  //     print(ListToAddProduct.productList.length);
  //
  //     print(forTesting);
  //     print("15");
  //   }
  //   print(forTesting);
  //   print("18");
  // }
  addToCartButton(productName, id, productRate, productImage, qty, totalPrice) {
    if (productName == null ||
        id == null ||
        productRate == null ||
        productImage == null ||
        checkDuplication(id) != true) {
      print(checkDuplication(id));
      SnackBarClassFromGetX().getSnackBar(
          Constants.error,
          Constants.oopsSomethingWentWrong,
          ColorCode.appBarColor,
          ColorCode.red);
    } else {
      if (checkDuplication(id) == false) {
        SnackBarClassFromGetX().getSnackBar(Constants.error,
            Constants.limitForItem, ColorCode.red, ColorCode.blue);
      }
      ListToAddProduct.productList.add(AddToCartModel(
          productName.toString(),
          id.toString(),
          productRate.toString(),
          productImage.toString(),
          qty,
          totalPrice));
      SnackBarClassFromGetX().getSnackBar(
          Constants.success,
          Constants.itemAddedSuccessfully,
          ColorCode.appBarColor,
          ColorCode.blue);
    }
  }

  bool checkDuplication(id) {
    for (int i = 0; i < ListToAddProduct.productList.length; i++) {
      if (ListToAddProduct.productList[i].productId == id) {
        return false;
      }
    }
    return true;
  }
}
