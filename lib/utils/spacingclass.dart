import 'package:flutter/material.dart';

class SizedBoxHorizontal extends StatelessWidget {
  double width;
  SizedBoxHorizontal({Key? key, required this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * width,
    );
  }
}

class SizedBoxVertical extends StatelessWidget {
  double height;
  SizedBoxVertical({Key? key, required this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.height * height,
    );
  }
}
