import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/utils/textdecoration.dart';

// ignore: must_be_immutable
class CustomTextButton extends StatelessWidget {
  Color customColor;
  String text;
  CustomTextButton({Key? key, required this.customColor, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.06,
      width: MediaQuery.of(context).size.width * 0.9,
      decoration: BoxDecoration(
          color: customColor, borderRadius: BorderRadius.circular(25.0)),
      child: Center(
        child: Text(text,
            style: TextDecoration().customFont(
              FontWeight.w600,
            )),
      ),
    );
  }
}
