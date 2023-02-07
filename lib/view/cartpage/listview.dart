import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/utils/textdecoration.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../../helper/listtoaddproduct.dart';
import '../../utils/colorcode.dart';

class ListViewClass extends StatelessWidget {
  const ListViewClass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: ListToAddProduct.productList.length,
        itemBuilder: (BuildContext context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Material(
              elevation: 15,
              color: Colors.white60,
              borderRadius: const BorderRadius.all(Radius.circular(20.0)),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.13,
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
                    Obx(() => SizedBox(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        ListToAddProduct().decrementCounter();
                                      },
                                      icon:
                                          FaIcon(FontAwesomeIcons.circleMinus)),
                                  Text(
                                    ListToAddProduct.productQty.toString(),
                                    style: TextDecoration()
                                        .customFont(FontWeight.w600),
                                  ),
                                  IconButton(
                                      onPressed: () {
                                        ListToAddProduct().incrementCounter();
                                      },
                                      icon: FaIcon(FontAwesomeIcons.circlePlus))
                                ],
                              ),
                              Text(
                                "\$${ListToAddProduct().productTotalQuantity(ListToAddProduct.productList[index].productPrice)}"
                                    .toString(),
                                style: TextDecoration().customFont(
                                    FontWeight.w600,
                                    color: ColorCode.blueGrey),
                              )
                            ],
                          ),
                        ))
                  ],
                ),
              ),
            ),
          );
        });
  }
}
