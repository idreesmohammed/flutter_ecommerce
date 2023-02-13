import 'package:flutter/cupertino.dart';
import 'package:flutter_ecommerce/helper/snackbargetx.dart';
import 'package:flutter_ecommerce/model/addtocartmodel.dart';
import 'package:flutter_ecommerce/utils/colorcode.dart';
import 'package:flutter_ecommerce/utils/constants.dart';
import 'package:flutter_ecommerce/utils/textdecoration.dart';
import 'package:flutter_ecommerce/view/orderplacedsuccessful.dart';
import 'package:get/get.dart';

class ListToAddProduct extends GetxController {
  static RxList<AddToCartModel> productList = <AddToCartModel>[].obs;
  static RxString text = "".obs;
  static RxInt productQty = 1.obs;
  static RxInt value = 0.obs;

  @override
  void onInit() {
    super.onInit();
  }

  String addNumbersForCartIcon() {
    return text.value = productList.length.toString();
  }

  incrementCounter(index) {
    if (productList[index].quantity >= 5) {
      return SnackBarClassFromGetX().getSnackBar(Constants.alert,
          Constants.limitForItem, ColorCode.appBarColor, ColorCode.red);
    } else {
      print("${productList[index].fullCartPrice.runtimeType} full cart price");
      print("${productList[index].quantity.runtimeType} qty");
      // final total =
      ///parsing int to double
      final firstParse =
          int.parse(productList[index].quantity.toString()).toDouble();
      print("$firstParse first parse");

      ///parsing int to double
      print("${productList[index].productPrice.runtimeType} individual price");

      final secondParse =
          double.parse(productList[index].productPrice).toDouble();
      print("$secondParse second parse");

      /// string to double
      /// assign int to total product value

      //
      // productList[index].fullCartPrice =
      //     productList.map((element) => element.productPrice!).toList().add();

      //     double.parse(productList[index].productPrice).toInt().round();
      // value!.value = total * productList[index].quantity.value.round() - 1;
      // print('${value.value.obs.runtimeType} hello');
      // productList[index].quantity.ref
      // productList[index].totalPrice =
      //     (productList[index].quantity * (productList[index].productPrice))
      //         .toDouble() as RxDouble?;

      // productList[index].fullCartPrice = productList[index].quantity * productList[index].productPrice - 1 ;

      productList[index].quantity++;
      productList[index].fullCartPrice = secondParse * (firstParse + 1);
    }
  }

  removingIndex(index) {
    productList.removeAt(index);
    update();
  }

  clearingCartList() {
    productList.clear();
    Get.to(() => const OrderPlacedSuccessful());
  }

  decrementCounter(index, context) {
    if (productList[index].quantity > 1) {
      final firstParse =
          int.parse(productList[index].quantity.toString()).toDouble();
      print("$firstParse first parse");

      ///parsing int to double
      print("${productList[index].productPrice.runtimeType} individual price");

      final secondParse =
          double.parse(productList[index].productPrice).toDouble();
      print("$secondParse second parse");

      /// string to double
      /// assign int to total product value

      //
      // productList[index].fullCartPrice =
      //     productList.map((element) => element.productPrice!).toList().add();

      //     double.parse(productList[index].productPrice).toInt().round();
      // value!.value = total * productList[index].quantity.value.round() - 1;
      // print('${value.value.obs.runtimeType} hello');
      // productList[index].quantity.ref
      // productList[index].totalPrice =
      //     (productList[index].quantity * (productList[index].productPrice))
      //         .toDouble() as RxDouble?;

      // productList[index].fullCartPrice = productList[index].quantity * productList[index].productPrice - 1 ;

      productList[index].quantity--;
      productList[index].fullCartPrice = secondParse * (firstParse - 1);
    } else if (productList[index].quantity == 1) {
      return Get.defaultDialog(
          onCancel: () {},
          onConfirm: () {
            ListToAddProduct.productList.removeAt(index);
          },
          title:
              "Dou you wish to remove?\n your item will be removed from your cart",
          titleStyle: TextDecoration().customFont(FontWeight.w400));
    }
  }

  productTotalQuantityPrice(qty, price) {
    final RxInt parsingQty = double.parse(qty).toInt().obs;
    final RxInt parsingPrice = double.parse(price).toInt().obs;
    final finalCalculation =
        (parsingPrice.value * (parsingQty.value - 1)).round();
    return finalCalculation;
  }

  totalCartAmount() {
    RxDouble sum = 0.0.obs;
    // for (int i = 0; i < productList.length; i++) {
    //   sum = ((double.parse(productList[i].productPrice).round() *
    //       (productList[i].quantity.value)))
    //       .obs as RxInt;
    // }
    for (int i = 0; i < productList.length; i++) {
      print((productList[i].fullCartPrice).round().runtimeType);
      sum.value = sum.value + (productList[i].fullCartPrice);
    }
    print(sum);
    return sum.value;
  }
}
