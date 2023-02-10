import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/utils/textdecoration.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../../helper/listtoaddproduct.dart';
import '../../utils/colorcode.dart';

class ListViewClass extends GetView<ListToAddProduct> {
  const ListViewClass({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => ListView.builder(
        itemCount: ListToAddProduct.productList.length,
        itemBuilder: (BuildContext context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Material(
              elevation: 15,
              color: Colors.white60,
              borderRadius: const BorderRadius.all(Radius.circular(20.0)),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.15,
                width: MediaQuery.of(context).size.width * 0.85,
                decoration: const BoxDecoration(
                    color: Colors.white60,
                    borderRadius: BorderRadius.all(Radius.circular(20.0))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(width: MediaQuery.of(context).size.width * 0.01),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.15,
                      height: MediaQuery.of(context).size.height * 0.1,
                      child: Image.network(
                        ListToAddProduct.productList[index].productImage,
                        fit: BoxFit.fill,
                        width: MediaQuery.of(context).size.width * 0.15,
                        height: MediaQuery.of(context).size.height * 0.1,
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            ListToAddProduct.productList[index].productName,
                            style: TextDecoration().customFont(FontWeight.w600),
                          ),
                          Text(ListToAddProduct.productList[index].productPrice,
                              style: TextDecoration().customFont(
                                FontWeight.w600,
                              ))
                        ],
                      ),
                    ),
                    SizedBox(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              IconButton(
                                  onPressed: () {
                                    ListToAddProduct()
                                        .decrementCounter(index, context);
                                  },
                                  icon: const FaIcon(
                                      FontAwesomeIcons.circleMinus)),
                              Obx(
                                () => Text(
                                  ListToAddProduct.productList[index].quantity
                                      .toString(),
                                  style: TextDecoration()
                                      .customFont(FontWeight.w600),
                                ),
                              ),
                              IconButton(
                                  onPressed: () {
                                    ListToAddProduct().incrementCounter(index);
                                  },
                                  icon:
                                      const FaIcon(FontAwesomeIcons.circlePlus))
                            ],
                          ),
                          Obx(() => Text(
                                "\$${ListToAddProduct().productTotalQuantityPrice(ListToAddProduct.productList[index].productPrice, ListToAddProduct.productList[index].quantity.toString())}"
                                    .toString(),
                                style: TextDecoration().customFont(
                                    FontWeight.w600,
                                    color: ColorCode.blueGrey),
                              )),
                          IconButton(
                              onPressed: () {
                                ListToAddProduct().removingIndex(index);
                              },
                              icon: const FaIcon(FontAwesomeIcons.trash))
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        }));
  }
}
