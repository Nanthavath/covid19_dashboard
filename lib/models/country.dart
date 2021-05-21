// To parse this JSON data, do
//
//     final country = countryFromJson(jsonString);

import 'dart:convert';

import 'package:covid19_dashboard/models/province.dart';

import 'countryElement.dart';

Country countryFromJson(String str) => Country.fromJson(json.decode(str));

String countryToJson(Country data) => json.encode(data.toJson());

class Country {
  Country({
    this.element,
    this.provinces,
  });

  CountryElement element;
  Provinces provinces;

  factory Country.fromJson(Map<String, dynamic> json) => Country(
        element: CountryElement.fromJson(json["country"]),
      );

  Map<String, dynamic> toJson() => {
        "country": element.toJson(),
      };
}
