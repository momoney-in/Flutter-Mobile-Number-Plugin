import 'dart:convert';

class SimCard {
  final String? carrierName;
  final String? displayName;
  final int? slotIndex;
  final int? subscriptionId;
  final String? number;
  final String? countryIso;
  final String? countryPhonePrefix;
  final String? iccId;

  SimCard({
    this.carrierName,
    this.displayName,
    this.slotIndex,
    this.number,
    this.countryIso,
    this.countryPhonePrefix,
    this.subscriptionId,
    this.iccId,
  });

  factory SimCard.fromMap(Map<String, dynamic> json) => SimCard(
        carrierName: json["carrierName"],
        displayName: json["displayName"],
        slotIndex: json["slotIndex"],
        number: json["number"],
        countryIso: json["countryIso"],
        countryPhonePrefix: json["countryPhonePrefix"],
        subscriptionId: json["subscriptionId"],
        iccId: json["iccId"],
      );

  Map<String, dynamic> toMap() => {
        "carrierName": carrierName,
        "displayName": displayName,
        "slotIndex": slotIndex,
        "number": number,
        "countryIso": countryIso,
        "countryPhonePrefix": countryPhonePrefix,
        "subscriptionId": subscriptionId,
        "iccId": iccId,
      };

  static List<SimCard> parseSimCards(String str) =>
      List<SimCard>.from(json.decode(str).map((x) => SimCard.fromMap(x)));

  static String simCardToJson(List<SimCard> data) =>
      json.encode(List<dynamic>.from(data.map((x) => x.toMap())));
}
