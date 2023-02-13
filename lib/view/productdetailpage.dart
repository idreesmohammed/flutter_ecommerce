import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/helper/customtextbutton.dart';
import 'package:flutter_ecommerce/helper/listtoaddproduct.dart';
import 'package:flutter_ecommerce/utils/textdecoration.dart';
import 'package:flutter_ecommerce/view/cartpage/cartcheckoutpage.dart';
import 'package:flutter_ecommerce/view/orderplacedsuccessful.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../controller/addtocartcontroller.dart';
import '../utils/colorcode.dart';
import '../utils/constants.dart';
import 'package:badges/badges.dart' as badges;

//ignore: must_be_immutable
class ProductDetailPage extends GetView<AddToCartController> {
  String? productImage;
  String? productDescription;
  dynamic productRate;
  int? id;
  String? productName;
  ProductDetailPage(
      {Key? key,
      this.productImage,
      this.productDescription,
      this.productRate,
      this.id,
      this.productName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    dynamic productTotalPrice = productRate;
    return Obx(() => Scaffold(
          appBar: AppBar(
            backgroundColor: ColorCode.appBarColor,
            title: const Text(Constants.title),
            centerTitle: true,
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back)),
            actions: [
              badges.Badge(
                badgeContent: Text(ListToAddProduct().addNumbersForCartIcon()),
                showBadge: ListToAddProduct.productList.isEmpty ? false : true,
                badgeAnimation: const badges.BadgeAnimation.fade(),
                position: badges.BadgePosition.topEnd(top: 1, end: 8),
                child: IconButton(
                  icon: const FaIcon(FontAwesomeIcons.cartShopping),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CheckoutPage()));
                  },
                ),
              ),
            ],
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),
              Card(
                elevation: 18.0,
                shadowColor: ColorCode.homePageItemCard,
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.22,
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Image.network(
                    productImage.toString(),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.03),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Text(productDescription.toString(),
                    maxLines: 9,
                    overflow: TextOverflow.ellipsis,
                    style: TextDecoration().customFont(FontWeight.w600,
                        color: ColorCode.appBarColor, fontSize: 15.0)),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),
              Text("${productRate.toString()}\$",
                  style: TextDecoration()
                      .customFont(FontWeight.w500, fontSize: 22.0)),
              SizedBox(height: MediaQuery.of(context).size.height * 0.03),
              GestureDetector(
                  onTap: () {
                    controller.addToCartButton(
                        productName.obs,
                        id.obs,
                        productRate,
                        productImage.obs,
                        1.obs,
                        productTotalPrice);
                  },
                  child: CustomTextButton(
                      customColor: ColorCode.addToCart,
                      text: Constants.addToCart)),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              InkWell(
                  onTap: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return Container(
                            height: MediaQuery.of(context).size.height * 0.2,
                            width: MediaQuery.of(context).size.width,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  child: TextButton(
                                      onPressed: () {
                                        ListToAddProduct().clearingCartList();
                                      },
                                      child: Text(
                                        Constants.cash,
                                        style: TextDecoration().customFont(
                                            FontWeight.w700,
                                            color: ColorCode.appBarColor),
                                      )),
                                ),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  child: TextButton(
                                      onPressed: () {},
                                      child: Text(
                                        Constants.card,
                                        style: TextDecoration().customFont(
                                            FontWeight.w700,
                                            color: ColorCode.appBarColor),
                                      )),
                                )
                              ],
                            ),
                          );
                        });
                  },
                  child: CustomTextButton(
                      customColor: ColorCode.buyNow, text: Constants.buyNow)),
            ],
          ),
        ));
  }

  Container customButton(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.05,
      width: MediaQuery.of(context).size.width * 0.9,
      color: Colors.red,
      child: TextButton(
          onPressed: () {},
          child: Text(Constants.addToCart,
              style: TextDecoration().customFont(FontWeight.w500))),
    );
  }
}
