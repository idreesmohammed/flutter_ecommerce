import 'package:flutter_ecommerce/controller/addtocartcontroller.dart';
import 'package:get/get.dart';

class ProductDetailBindings implements Bindings {
  @override
  void dependencies() {
    Get.put<AddToCartController>(AddToCartController());
    Get.put<AddToCartController>(AddToCartController());
  }
}
