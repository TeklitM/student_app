import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Message {
  Message.errorMessage({String? title, String? message, IconData? icon}) {
    Get.showSnackbar(GetSnackBar(
      // title: title ?? "Error",
      // message: message ?? "Error happend",
      titleText: Text(
        title ?? "oops!",
        style: GoogleFonts.roboto(
            fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
      ),
      messageText: Text(
        message ?? "Something went wrong.",
        style: GoogleFonts.roboto(
            fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),
      ),
      icon: Icon(
        icon ?? Icons.error,
        color: Colors.white,
      ),
      backgroundColor: Colors.red.shade400,
      duration: const Duration(milliseconds: 2000),
      snackPosition: SnackPosition.BOTTOM,
      borderRadius: 10,
      margin: const EdgeInsets.only(top: 58, right: 5, left: 5, bottom: 20),
      dismissDirection: DismissDirection.up,
      isDismissible: true,
      forwardAnimationCurve: Curves.ease,
      showProgressIndicator: false,
    ));
  }
  Message.info(
      {required String title, required String message, IconData? icon}) {
    Get.showSnackbar(GetSnackBar(
      // title: title ?? "Error",
      // message: message ?? "Error happend",
      titleText: Text(
        title,
        style: GoogleFonts.roboto(
            fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
      ),
      messageText: Text(
        message,
        style: GoogleFonts.roboto(
            fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),
      ),
      icon: Icon(
        icon ?? Icons.info,
        color: Colors.white,
      ),
      backgroundColor: Colors.black,
      duration: const Duration(milliseconds: 2000),
      snackPosition: SnackPosition.BOTTOM,
      borderRadius: 10,
      margin: const EdgeInsets.only(top: 58, right: 5, left: 5, bottom: 20),
      dismissDirection: DismissDirection.up,
      isDismissible: true,
      forwardAnimationCurve: Curves.ease,
      showProgressIndicator: false,
    ));
  }
}
