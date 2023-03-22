// To parse this JSON data, do
//
//     final universitiesData = universitiesDataFromJson(jsonString);

import 'dart:convert';

UniversitiesData universitiesDataFromJson(String str) => UniversitiesData.fromJson(json.decode(str));

String universitiesDataToJson(UniversitiesData data) => json.encode(data.toJson());

class UniversitiesData {
  UniversitiesData({
    this.stateProvince,
     this.domains=const [],
     this.country='',
     this.webPages=const [],
     this.name='',
     this.alphaTwoCode='',
  });

  dynamic stateProvince;
  List<String> domains;
  String country;
  List<String> webPages;
  String name;
  String alphaTwoCode;

  factory UniversitiesData.fromJson(Map<String, dynamic> json) => UniversitiesData(
    stateProvince: json["state-province"],
    domains:json["domains"]!= null? List<String>.from(json["domains"].map((x) => x)):const [],
    country: json["country"],
    webPages: json["web_pages"]!= null ?List<String>.from(json["web_pages"].map((x) => x)):const[],
    name: json["name"],
    alphaTwoCode: json["alpha_two_code"],
  );

  Map<String, dynamic> toJson() => {
    "state-province": stateProvince,
    "domains": List<dynamic>.from(domains.map((x) => x)),
    "country": country,
    "web_pages": List<dynamic>.from(webPages.map((x) => x)),
    "name": name,
    "alpha_two_code": alphaTwoCode,
  };
}
