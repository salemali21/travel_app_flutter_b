import 'dart:convert';

import 'package:travel_app/helpers/catch_storage.dart';
import 'package:travel_app/helpers/constants.dart';
import 'package:travel_app/models/user_model.dart';

class MainUser {
  MainUser._();
  static final instance = MainUser._();

  bool _isInit = false;

  UserModel? model;

  void onInit() {
    if (_isInit == true) return null;

    update();

    _isInit = true;
  }

  void update() async {
    var value = CatchStorage.get(k_userKey);
    if (value == null) return;
    var convertDataToMap = jsonDecode(value);
    model = UserModel.fromJson(convertDataToMap);
  }
}
