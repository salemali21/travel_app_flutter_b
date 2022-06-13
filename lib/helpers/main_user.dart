import 'dart:convert';

import 'package:travel_app/helpers/catch_storage.dart';
import 'package:travel_app/helpers/constants.dart';
import 'package:travel_app/models/user_model.dart';

class MainUser {
  MainUser._();
  static final instance = MainUser._();

  UserModel? get model {
    return onInit;
  }

  UserModel? get onInit {
    var value = CatchStorage.get(k_userKey);
    if (value == null) return null;

    var convertDataToMap = jsonDecode(value);

    return UserModel.fromJson(convertDataToMap);
  }
}
