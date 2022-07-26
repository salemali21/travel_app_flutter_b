import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:travel_app/helpers/catch_storage.dart';
import 'package:travel_app/helpers/constants.dart';
import 'package:travel_app/helpers/main_user.dart';
import 'package:travel_app/models/user_model.dart';
import 'package:travel_app/network/auth_service.dart';
import 'package:travel_app/network/firestore_service.dart';
import 'package:travel_app/views/layout/layout_screen.dart';

class RegisterController extends GetxController {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();

  bool isLoading = false;

  Future<void> createAccount() async {
    if (!formKey.currentState!.validate()) return;

    try {
      isLoading = true;
      update();
      UserCredential credential =
          await AuthService.instance.register(email: email.text, password: password.text);

      UserModel _model = UserModel(
        uId: credential.user!.uid,
        email: credential.user!.email,
        name: name.text,
        dateOfRegister: DateFormat("y/M/d ,H:m:s").format(DateTime.now()),
      );

      await FirestoreServic.instance.saveUser(_model);

      var convertDataToJson = jsonEncode(_model.toMap);

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
