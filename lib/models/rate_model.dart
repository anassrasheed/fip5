class RateModel {
  int? numOfRates;
  double? rate;
  String? usedId;

  RateModel({this.numOfRates, this.rate, this.usedId});

  factory RateModel.fromMap(Map<String, dynamic> json) => RateModel(
        numOfRates: json["numOfRates"],
        rate: json["rate"],
        usedId: json["userId"],
      );

  Map<String, dynamic> toMap() => {
        "numOfRates": numOfRates,
        "rate": rate,
        "userId": usedId,
      };
}
