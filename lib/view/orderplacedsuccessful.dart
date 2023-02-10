import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/helper/customtextbutton.dart';
import 'package:flutter_ecommerce/utils/colorcode.dart';
import 'package:flutter_ecommerce/utils/constants.dart';
import 'package:flutter_ecommerce/utils/textdecoration.dart';
import 'package:flutter_ecommerce/view/homepage.dart';
import 'package:lottie/lottie.dart';

class OrderPlacedSuccessful extends StatelessWidget {
  const OrderPlacedSuccessful({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          child: LottieBuilder.network(
              "https://assets5.lottiefiles.com/packages/lf20_gsigmrhp.json"),
        ),
        Text(
          Constants.orderPlaced,
          style: TextDecoration().customFont(FontWeight.w700, fontSize: 25.0),
        ),
        GestureDetector(
          onTap: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => const HomePage()));
          },
          child: CustomTextButton(
            customColor: ColorCode.buyNow,
            text: Constants.continueShopping,
          ),
        )
      ],
    ));
  }
}
