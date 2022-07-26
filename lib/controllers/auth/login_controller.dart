import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_app/helpers/catch_storage.dart';
import 'package:travel_app/helpers/constants.dart';
import 'package:travel_app/helpers/main_user.dart';
import 'package:travel_app/network/auth_service.dart';
import 'package:travel_app/network/firestore_service.dart';
import 'package:travel_app/views/layout/layout_screen.dart';

class LoginController extends GetxController {
  final email = TextEditingController();
  final password = TextEditingController();

  bool isLoading = false;

  Future<void> login() async {
    isLoading = true;
    update();

    try {
      UserCredential userCredential =
          await AuthService.instance.login(email: email.text, password: password.text);

      var userData = await FirestoreServic.instance.getUser(userCredential.user!.uid);

      var convertDataToJson = jsonEncode(userData.data());

      await CatchStorage.save(k_userKey, convertDataToJson);

      MainUser.instance.update();

      await Get.off(() => LayoutScreen());

      isLoading = false;
      update();
    } on FirebaseAuthException catch (error) {
      isLoading = false;
      update();

      Get.closeAllSnackbars();

      Get.snackbar(
        "Something is wrong!".tr,
        error.message!,
        backgroundColor: Colors.red,
        snackPosition: SnackPosition.BOTTOM,
        margin: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      );
    } catch (error) {
      isLoading = false;
      update();

      Get.closeAllSnackbars();
      Get.snackbar(
        "Something is wrong!".tr,
        "Please try again another time".tr,
        backgroundColor: Colors.red,
        snackPosition: SnackPosition.BOTTOM,
        margin: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      );
    }
  }
}
