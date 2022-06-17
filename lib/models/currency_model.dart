class CurrencyModel {
  bool? success;
  Query? query;
  Info? info;
  double? result;

  CurrencyModel({this.success, this.query, this.info, this.result});

  CurrencyModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    query = json['query'] != null ? Query.fromJson(json['query']) : null;
    info = json['info'] != null ? Info.fromJson(json['info']) : null;
    result = json['result'];
  }
}

class Query {
  String? from;
  String? to;
  int? amount;

  Query({this.from, this.to, this.amount});

  Query.fromJson(Map<String, dynamic> json) {
    from = json['from'];
    to = json['to'];
    amount = json['amount'];
  }
}

class Info {
  int? timestamp;
  double? quote;

  Info({this.timestamp, this.quote});

  Info.fromJson(Map<String, dynamic> json) {
    timestamp = json['timestamp'];
    quote = json['quote'];
  }
}
