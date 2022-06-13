import 'package:get/get.dart';
import 'package:travel_app/helpers/enum_helper.dart';

class ValidatorHelper {
  ValidatorHelper._();
  static final instance = ValidatorHelper._();

  String? validator({required String? value,required FieldType type , String? matchText}) {
    switch (type) {
      case FieldType.name:
        return _name(value);
      case FieldType.email:
        return _email(value);
      case FieldType.password:
        return _password(value);
      case FieldType.confirmPassword:
        return _confirmPassword(value , matchText);
    }
  }

  String? _name(String? value) {
    if (value == null || value.isEmpty) {
      return "empty_name".tr;
    }
    if (value.length < 4) {
      return "short_name".tr;
    }
    return null;
  }

  String? _email(String? value){
    if (value == null || value.isEmpty) {
      return "empty_email".tr;
    }
    if (value.length < 6) {
      return "short_email".tr;
    }
    return null;
  }
  String? _password(String? value){
    if (value == null || value.isEmpty) {
      return "empty_password".tr;
    }
    if (value.length < 6) {
      return "short_password".tr;
    }
    return null;
  }
  String? _confirmPassword(String? value , String? otherText){
    if (value == null || value.isEmpty) {
      return "empty_password".tr;
    }
    if (value.length < 6) {
      return "short_password".tr;
    }
    if(value != otherText){
      return "not_match_password".tr;
    }
    return null;
  }
}
