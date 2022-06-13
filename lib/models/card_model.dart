import 'package:cloud_firestore/cloud_firestore.dart';

class CardModel {
  final int CardNumber;
  final String CardHolerName;
  final Timestamp expirationDate;
  final String CVC;
  final bool isDefaultCard;

  CardModel({
    required this.CardNumber,
    required this.CardHolerName,
    required this.expirationDate,
    required this.CVC,
    required this.isDefaultCard,
  });

  factory CardModel.fromJson(Map<String, dynamic> json) {
    return CardModel(
      CardNumber: json["CardNumber"],
      CardHolerName: json["CardHolerName"],
      expirationDate: json["expirationDate"],
      CVC: json["CVC"],
      isDefaultCard: json["isDefaultCard"],
    );
  }

  Map<String, dynamic> get toMap {
    return {
      "CardNumber": this.CardNumber,
      "CardHolerName": this.CardHolerName,
      "expirationDate": this.expirationDate,
      "CVC": this.CVC,
      "isDefaultCard": this.isDefaultCard,
    };
  }
}
