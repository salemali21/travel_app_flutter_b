class CurrencyLiveModel {
  bool? success;
  int? timestamp;
  String? source;
  Quotes? quotes;

  CurrencyLiveModel({this.success, this.timestamp, this.source, this.quotes});

  CurrencyLiveModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    timestamp = json['timestamp'];
    source = json['source'];
    quotes = json['quotes'] != null ? Quotes.fromJson(json['quotes']) : null;
  }
}

class Quotes {
  int? uSDUSD;
  double? uSDEUR;

  Quotes({
    this.uSDEUR,
    this.uSDUSD,
  });

  Quotes.fromJson(Map<String, dynamic> json) {
    uSDEUR = double.tryParse(json['USDEUR']) ?? 0;
    uSDUSD = json['USDUSD'];
  }
}
