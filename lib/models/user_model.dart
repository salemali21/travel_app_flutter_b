class UserModel {
  String? uId;
  String? name;
  String? email;
  UserModel({
    this.uId,
    this.name,
    this.email,
  });

  UserModel.fromJson(Map<String, dynamic> data) {
    this.uId = data["uId"];
    this.name = data["name"];
    this.email = data["email"];
  }

  Map<String, dynamic> get toMap {
    return {
      "uId": uId,
      "name": name,
      "email": email,
    };
  }
}
