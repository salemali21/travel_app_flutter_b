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
    this.uId = data["uId"] ?? "uId";
    this.name = data["name"] ?? "name";
    this.email = data["email"] ?? "email";
    this.image = data["image"] ?? "https://st2.depositphotos.com/1104517/11965/v/950/depositphotos_119659092-stock-illustration-male-avatar-profile-picture-vector.jpg";
    this.location = data["location"] ?? "";
    this.address = data["address"] ?? "";
    this.phoneNumber = data["phoneNumber"] ?? 0;
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
