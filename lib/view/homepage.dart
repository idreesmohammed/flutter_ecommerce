import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/bindings/bindingclass.dart';
import 'package:flutter_ecommerce/controller/getproductscontroller.dart';
import 'package:flutter_ecommerce/utils/colorcode.dart';
import 'package:flutter_ecommerce/utils/constants.dart';
import 'package:flutter_ecommerce/view/productdetailpage.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends GetView<GetProducts> {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: ColorCode.appBarColor,
          title: const Text(Constants.title),
          centerTitle: true,
          actions: [customButton(null, FontAwesomeIcons.cartShopping)],
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
                                        price: controller.dataList[index].price,
                                        productDescription: controller
                                            .dataList[index].description,
                                        productImage:
                                            controller.dataList[index].image,
                                        productRate:
                                            controller.dataList[index].price,
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
                                        controller.dataList[index].title,
                                        style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.w400),
                                      ))),
                                  Expanded(
                                      flex: 6,
                                      child: Image.network(
                                          controller.dataList[index].image)),
                                  const Spacer(),
                                  Expanded(
                                      flex: 2,
                                      child: Text(
                                          controller.dataList[index].category,
                                          style: GoogleFonts.poppins(
                                              fontSize: 15.0,
                                              fontWeight: FontWeight.w600)))
                                ],
                              )),
                            ),
                          ),
                        ),
                      );
                    })))));
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
