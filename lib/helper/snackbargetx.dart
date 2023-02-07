import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SnackBarClassFromGetX extends GetxController {
  getSnackBar(String errorOrSuccess, String message, textColor, bgColor) {
    return Get.snackbar(
      errorOrSuccess,
      message,
      colorText: textColor,
      backgroundColor: bgColor,
      icon: const Icon(Icons.add_alert),
    );
  }
}
