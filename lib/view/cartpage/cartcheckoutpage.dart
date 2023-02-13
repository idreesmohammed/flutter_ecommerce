import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/helper/listtoaddproduct.dart';
import 'package:flutter_ecommerce/utils/colorcode.dart';
import 'package:flutter_ecommerce/utils/constants.dart';
import 'package:flutter_ecommerce/utils/textdecoration.dart';
import 'package:flutter_ecommerce/view/cartpage/listview.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../customBottomSheet.dart';

class CheckoutPage extends GetView<ListToAddProduct> {
  const CheckoutPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    print(ListToAddProduct.productList.length);
    return Scaffold(
        backgroundColor: ColorCode.appBarColor,
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 20.0, left: 20.0),
              height: MediaQuery.of(context).size.height * 0.15,
              width: MediaQuery.of(context).size.width,
              color: ColorCode.appBarColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: ColorCode.white,
                    ),
                  ),
                  Text(Constants.cart,
                      style: TextDecoration().customFont(FontWeight.w600,
                          color: ColorCode.white, fontSize: 18.0)),
                ],
              ),
            ),
            Obx(() => Container(
                height: MediaQuery.of(context).size.height * 0.85,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                    color: ColorCode.blue,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30.0),
                        topRight: Radius.circular(30.0))),
                child: ListToAddProduct.productList.isEmpty
                    ? const Center(
                        child: Text(Constants.noData),
                      )
                    : Column(
                        children: [
                          const Expanded(
                            child: ListViewClass(),
                          ),
                          Container(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            height: MediaQuery.of(context).size.height * 0.08,
                            color: Colors.grey,
                            child: Obx(() => Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                        "Total Amount: ${ListToAddProduct().totalCartAmount().round().toString()}"),
                                    IconButton(
                                      onPressed: () {
                                        showModalBottomSheet(
                                            context: context,
                                            builder: (context) {
                                              return SizedBox(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.2,
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    SizedBox(
                                                      width:
                                                          MediaQuery.of(context)
                                                              .size
                                                              .width,
                                                      child: TextButton(
                                                          onPressed: () {
                                                            ListToAddProduct()
                                                                .clearingCartList();
                                                          },
                                                          child: Text(
                                                            Constants.cash,
                                                            style: TextDecoration()
                                                                .customFont(
                                                                    FontWeight
                                                                        .w700,
                                                                    color: ColorCode
                                                                        .appBarColor),
                                                          )),
                                                    ),
                                                    SizedBox(
                                                      width:
                                                          MediaQuery.of(context)
                                                              .size
                                                              .width,
                                                      child: TextButton(
                                                          onPressed: () {},
                                                          child: Text(
                                                            Constants.card,
                                                            style: TextDecoration()
                                                                .customFont(
                                                                    FontWeight
                                                                        .w700,
                                                                    color: ColorCode
                                                                        .appBarColor),
                                                          )),
                                                    )
                                                  ],
                                                ),
                                              );
                                            });
                                      },
                                      icon: Container(
                                        decoration: BoxDecoration(
                                            color: ColorCode.blue,
                                            borderRadius:
                                                BorderRadius.circular(20.0)),
                                        child: const Center(
                                            child: FaIcon(
                                                FontAwesomeIcons.arrowRight)),
                                      ),
                                    )
                                  ],
                                )),
                          )
                        ],
                      )))
          ],
        ));
  }
}
