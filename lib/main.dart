import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/bindings/bindingclass.dart';
import 'package:flutter_ecommerce/view/cartpage/cartcheckoutpage.dart';
import 'package:flutter_ecommerce/view/productdetailpage.dart';
import 'view/homepage.dart';
import 'package:get/get.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/homepage',
      // initialBinding: BindingsClass(),
      getPages: [
        GetPage(
            name: '/homepage',
            page: () => const HomePage(),
            binding: BindingsClass()),
        GetPage(
            name: '/productDescription',
            page: () => ProductDetailPage(),
            binding: BindingsClass()),
        GetPage(
            name: '/productDetail',
            page: () => const CheckoutPage(),
            binding: BindingsClass())
      ],
    );
  }
}
