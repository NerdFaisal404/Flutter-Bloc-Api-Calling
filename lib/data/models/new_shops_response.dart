import 'dart:convert';

List<List<NewShopsResponse>> newShopsResponseFromJson(String str) => List<List<NewShopsResponse>>.from(json.decode(str).map((x) => List<NewShopsResponse>.from(x.map((x) => NewShopsResponse.fromJson(x)))));

String newShopsResponseToJson(List<List<NewShopsResponse>> data) => json.encode(List<dynamic>.from(data.map((x) => List<dynamic>.from(x.map((x) => x.toJson())))));

class NewShopsResponse {
  NewShopsResponse({
    this.slNo,
    this.sellerName,
    this.sellerProfilePhoto,
    this.sellerItemPhoto,
    this.ezShopName,
    this.defaultPushScore,
    this.aboutCompany,
    this.allowCod,
    this.division,
    this.subDivision,
    this.city,
    this.state,
    this.zipcode,
    this.country,
    this.currencyCode,
    this.orderQty,
    this.orderAmount,
    this.salesQty,
    this.salesAmount,
    this.highestDiscountPercent,
    this.lastAddToCart,
    this.lastAddToCartThatSold,
  });

  String? slNo;
  String? sellerName;
  String? sellerProfilePhoto;
  String? sellerItemPhoto;
  String? ezShopName;
  double? defaultPushScore;
  String? aboutCompany;
  int? allowCod;
  dynamic division;
  dynamic subDivision;
  City? city;
  State? state;
  String? zipcode;
  Country? country;
  CurrencyCode? currencyCode;
  int? orderQty;
  int? orderAmount;
  int? salesQty;
  int? salesAmount;
  int? highestDiscountPercent;
  DateTime? lastAddToCart;
  DateTime? lastAddToCartThatSold;

  factory NewShopsResponse.fromJson(Map<String, dynamic> json) => NewShopsResponse(
    slNo: json["slNo"],
    sellerName: json["sellerName"],
    sellerProfilePhoto: json["sellerProfilePhoto"],
    sellerItemPhoto: json["sellerItemPhoto"],
    ezShopName: json["ezShopName"],
    defaultPushScore: json["defaultPushScore"].toDouble(),
    aboutCompany: json["aboutCompany"] == null ? null : json["aboutCompany"],
    allowCod: json["allowCOD"],
    division: json["division"],
    subDivision: json["subDivision"],
    city: json["city"] == null ? null : cityValues.map![json["city"]],
    state: json["state"] == null ? null : stateValues.map![json["state"]],
    zipcode: json["zipcode"] == null ? null : json["zipcode"],
    country: countryValues.map![json["country"]],
    currencyCode: currencyCodeValues.map![json["currencyCode"]],
    orderQty: json["orderQty"],
    orderAmount: json["orderAmount"],
    salesQty: json["salesQty"],
    salesAmount: json["salesAmount"],
    highestDiscountPercent: json["highestDiscountPercent"],
    lastAddToCart: DateTime.parse(json["lastAddToCart"]),
    lastAddToCartThatSold: DateTime.parse(json["lastAddToCartThatSold"]),
  );

  Map<String, dynamic> toJson() => {
    "slNo": slNo,
    "sellerName": sellerName,
    "sellerProfilePhoto": sellerProfilePhoto,
    "sellerItemPhoto": sellerItemPhoto,
    "ezShopName": ezShopName,
    "defaultPushScore": defaultPushScore,
    "aboutCompany": aboutCompany == null ? null : aboutCompany,
    "allowCOD": allowCod,
    "division": division,
    "subDivision": subDivision,
    "city": city == null ? null : cityValues.reverse[city],
    "state": state == null ? null : stateValues.reverse[state],
    "zipcode": zipcode == null ? null : zipcode,
    "country": countryValues.reverse[country],
    "currencyCode": currencyCodeValues.reverse[currencyCode],
    "orderQty": orderQty,
    "orderAmount": orderAmount,
    "salesQty": salesQty,
    "salesAmount": salesAmount,
    "highestDiscountPercent": highestDiscountPercent,
    "lastAddToCart": lastAddToCart?.toIso8601String(),
    "lastAddToCartThatSold": lastAddToCartThatSold?.toIso8601String(),
  };
}

enum City { DHAKA, DHAKA_DISTRICT, EMPTY }

final cityValues = EnumValues({
  "Dhaka": City.DHAKA,
  "Dhaka District": City.DHAKA_DISTRICT,
  "ঢাকা জেলা": City.EMPTY
});

enum Country { BANGLADESH }

final countryValues = EnumValues({
  "Bangladesh": Country.BANGLADESH
});

enum CurrencyCode { BDT, CURRENCY_CODE_BDT }

final currencyCodeValues = EnumValues({
  "bdt": CurrencyCode.BDT,
  "BDT": CurrencyCode.CURRENCY_CODE_BDT
});

enum State { DHAKA, DHAKA_DIVISION, EMPTY }

final stateValues = EnumValues({
  "Dhaka": State.DHAKA,
  "Dhaka Division": State.DHAKA_DIVISION,
  "ঢাকা বিভাগ": State.EMPTY
});

class EnumValues<T> {
  Map<String, T>? map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map?.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap!;
  }
}