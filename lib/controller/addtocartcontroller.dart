import 'package:flutter_ecommerce/helper/listtoaddproduct.dart';
import 'package:flutter_ecommerce/helper/snackbargetx.dart';
import 'package:flutter_ecommerce/model/addtocartmodel.dart';
import 'package:flutter_ecommerce/utils/constants.dart';
import 'package:get/get.dart';

import '../utils/colorcode.dart';
import '../view/cartpage/cartcheckoutpage.dart';

class AddToCartController extends GetxController {
  addToCartButton(productName, id, productRate, productImage) {
    if (productName == null ||
        id == null ||
        productRate == null ||
        productImage == null) {
      SnackBarClassFromGetX().getSnackBar(
          Constants.error,
          Constants.oopsSomethingWentWrong,
          ColorCode.appBarColor,
          ColorCode.red);
    } else {
      ListToAddProduct.productList.add(AddToCartModel(productName.toString(),
          id.toString(), productRate.toString(), productImage.toString()));
      SnackBarClassFromGetX().getSnackBar(
          Constants.success,
          Constants.itemAddedSuccessfully,
          ColorCode.appBarColor,
          ColorCode.blue);
    }
  }
}
