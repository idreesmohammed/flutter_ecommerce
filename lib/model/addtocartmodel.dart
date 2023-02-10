import 'package:get/get.dart';

class AddToCartModel {
  String productName;
  String productId;
  String productPrice;
  String productImage;
  RxInt quantity;
  dynamic fullCartPrice;
  AddToCartModel(this.productName, this.productId, this.productPrice,
      this.productImage, this.quantity, this.fullCartPrice);
}
