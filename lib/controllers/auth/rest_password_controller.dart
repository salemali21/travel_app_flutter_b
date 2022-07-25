import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_app/network/auth_service.dart';

class RestPasswordController extends GetxController {
  final email = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future<void> sendPasswordResetEmail() async {
    if (!formKey.currentState!.validate()) return;

    try {
      await AuthService.instance.restPassword(email.text);
      Get.snackbar(
        "Success".tr,
        "Please check your email".tr,
        backgroundColor: Colors.green,
        snackPosition: SnackPosition.BOTTOM,
        margin: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      );
    } on FirebaseAuthException catch (error) {
      Get.snackbar(
        "Something is wrong!".tr,
        error.message!,
        backgroundColor: Colors.red,
        snackPosition: SnackPosition.BOTTOM,
        margin: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      );
    }
  }
}
