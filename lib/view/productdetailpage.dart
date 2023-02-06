import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/colorcode.dart';
import '../utils/constants.dart';

//ignore: must_be_immutable
class ProductDetailPage extends StatelessWidget {
  String? productImage;
  String? productDescription;
  double? productRate;
  double? price;
  ProductDetailPage(
      {Key? key,
      this.productImage,
      this.productDescription,
      this.productRate,
      this.price})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("$productDescription  $productRate.toString()");
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorCode.appBarColor,
        title: const Text(Constants.title),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back)),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Card(
            elevation: 18.0,
            shadowColor: ColorCode.homePageItemCard,
            shape: BeveledRectangleBorder(),
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.35,
              width: MediaQuery.of(context).size.width * 0.9,
              child: Image.network(productImage.toString()),
            ),
          ),
          Text(
            productDescription.toString(),
            style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 5.0,
          ),
          TextButton(onPressed: () {}, child: Text("Add to Cart")),
          Text(productRate.toString())
        ],
      ),
    );
  }
}
