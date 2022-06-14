import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:travel_app/helpers/main_user.dart';
import 'package:travel_app/models/user_model.dart';

class EditAccountController extends GetxController {
  UserModel model = MainUser.instance.model!;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  late TextEditingController name;
  late TextEditingController location;
  late TextEditingController address;
  late TextEditingController phoneNumbner;

  @override
  void onInit() {
    super.onInit();
    name = TextEditingController(text: model.name);
    location = TextEditingController(text: model.location);
    address = TextEditingController(text: model.address);
    phoneNumbner = TextEditingController(text: model.phoneNumber.toString());
  }

  Future<void> onSubmit() async {
    if (!formKey.currentState!.validate()) return;
  }
}
