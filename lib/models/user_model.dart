class UserModel {
  String? uId;
  String? name;
  String? email;
  String? image;
  String? location;
  String? address;
  int? phoneNumber;
  UserModel({
    this.uId,
    this.name,
    this.email,
    this.image,
    this.location,
    this.address,
    this.phoneNumber,
  });

  UserModel.fromJson(Map<String, dynamic> data) {
    this.uId = data["uId"];
    this.name = data["name"];
    this.email = data["email"];
    this.image = data["image"];
    this.location = data["location"];
    this.address = data["address"];
    this.phoneNumber = data["phoneNumber"];
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
    };
  }
}
