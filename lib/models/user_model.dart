class UserModel {
  String? uId;
  String? name;
  String? email;
  String? image;
  String? location;
  String? address;
  int? phoneNumber;
  String? dateOfRegister;
  UserModel({
    this.uId,
    this.name,
    this.email,
    this.image,
    this.location,
    this.address,
    this.phoneNumber,
    this.dateOfRegister,
  });

  UserModel.fromJson(Map<String, dynamic> data) {
    this.uId = data["uId"] ?? "uId";
    this.name = data["name"] ?? "name";
    this.email = data["email"] ?? "email";
    this.image = data["image"] ??
        "https://firebasestorage.googleapis.com/v0/b/travel-app-53dd0.appspot.com/o/defult_image%2Ficon-g28577778e_640.png?alt=media&token=aa5cbd3e-fa03-4344-a0fa-129e58c8ed67";
    this.location = data["location"] ?? "";
    this.address = data["address"] ?? "";
    this.phoneNumber = data["phoneNumber"];
    this.dateOfRegister = data["dateOfRegister"];
  }

  Map<String, dynamic> get toMap {
    return {
      "uId": uId,
      "name": name,
      "email": email,
      "image": image,
      "location": location,
      "address": address,
      "phoneNumber": phoneNumber,
      "dateOfRegister": dateOfRegister,
    };
  }
}
