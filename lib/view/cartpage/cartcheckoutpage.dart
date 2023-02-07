import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/helper/listtoaddproduct.dart';
import 'package:flutter_ecommerce/utils/colorcode.dart';
import 'package:flutter_ecommerce/utils/constants.dart';
import 'package:flutter_ecommerce/utils/textdecoration.dart';
import 'package:flutter_ecommerce/view/cartpage/listview.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(ListToAddProduct.productList.length);
    return Scaffold(
        backgroundColor: ColorCode.appBarColor,
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 20.0, left: 20.0),
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
            Container(
              height: MediaQuery.of(context).size.height * 0.85,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                  color: ColorCode.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0))),
              child: ListViewClass(),
            )
          ],
        ));
  }
}
