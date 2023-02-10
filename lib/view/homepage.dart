import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter_ecommerce/controller/getproductscontroller.dart';
import 'package:flutter_ecommerce/helper/listtoaddproduct.dart';
import 'package:flutter_ecommerce/utils/colorcode.dart';
import 'package:flutter_ecommerce/utils/constants.dart';
import 'package:flutter_ecommerce/utils/textdecoration.dart';
import 'package:flutter_ecommerce/view/cartpage/cartcheckoutpage.dart';
import 'package:flutter_ecommerce/view/productdetailpage.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class HomePage extends GetView<GetProducts> {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    print(ListToAddProduct.text.toString());
    return Obx(() => Scaffold(
        appBar: AppBar(
          backgroundColor: ColorCode.appBarColor,
          title: const Text(Constants.title),
          centerTitle: true,
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
          leading: customButton(null, Icons.menu),
        ),
        body: Obx(() => controller.dataList.isEmpty
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : SizedBox(
                height: double.infinity,
                width: double.infinity,
                child: Obx(() => GridView.builder(
                    itemCount: controller.dataList.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    itemBuilder: (context, index) {
                      return InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ProductDetailPage(
                                          productDescription: controller
                                              .dataList[index].description,
                                          productImage:
                                              controller.dataList[index].image,
                                          productRate:
                                              controller.dataList[index].price,
                                          id: controller.dataList[index].id,
                                          productName:
                                              controller.dataList[index].title,
                                        )));
                          },
                          child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Card(
                                elevation: 20.0,
                                shadowColor: ColorCode.homePageItemCard,
                                child: Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: SizedBox(
                                        child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                          Expanded(
                                              flex: 2,
                                              child: Center(
                                                  child: Text(
                                                overflow: TextOverflow.ellipsis,
                                                controller
                                                    .dataList[index].title,
                                                style: TextDecoration()
                                                    .customFont(
                                                        FontWeight.w400),
                                              ))),
                                          Expanded(
                                              flex: 6,
                                              child: Image.network(controller
                                                  .dataList[index].image)),
                                          const Spacer(),
                                          Expanded(
                                              flex: 2,
                                              child: Text(
                                                  controller
                                                      .dataList[index].category,
                                                  style: TextDecoration()
                                                      .customFont(
                                                          FontWeight.w600,
                                                          fontSize: 15.0)))
                                        ]))),
                              )));
                    }))))));
  }

  IconButton customButton(onPressed, icon) {
    return IconButton(
      onPressed: onPressed,
      icon: FaIcon(
        icon,
        color: Colors.white,
      ),
    );
  }
}
