import 'package:flutter_ecommerce/controller/getproductscontroller.dart';
import 'package:flutter_ecommerce/helper/listtoaddproduct.dart';
import 'package:get/get.dart';

import '../controller/addtocartcontroller.dart';

class BindingsClass implements Bindings {
  @override
  void dependencies() async {
    Get.put<GetProducts>(GetProducts());
    Get.put<AddToCartController>(AddToCartController());
    Get.put<ListToAddProduct>(ListToAddProduct());
  }
}
