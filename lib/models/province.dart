// To parse this JSON data, do
//
//     final provinces = provincesFromJson(jsonString);

import 'dart:convert';

Provinces provincesFromJson(String str) => Provinces.fromJson(json.decode(str));

String provincesToJson(Provinces data) => json.encode(data.toJson());

class Provinces {
  Provinces({
    this.id,
    this.name,
    this.total,
    this.newCase,
    this.treaded,
    this.decoveringCase,
    this.testCase,
    this.dead,
    this.negativeCase,
    this.districts,
    this.updatedAt,
  });

  String id;
  String name;
  int total;
  int newCase;
  int treaded;
  int decoveringCase;
  int testCase;
  int dead;
  int negativeCase;
  dynamic districts;
  DateTime updatedAt;

  factory Provinces.fromJson(Map<String, dynamic> json) => Provinces(
    id: json["id"],
    name: json["name"],
    total: json["total"],
    newCase: json["new_case"],
    treaded: json["treaded"],
    decoveringCase: json["decovering_case"],
    testCase: json["test_case"],
    dead: json["dead"],
    negativeCase: json["negative_case"],
    districts: json["districts"],
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "total": total,
    "new_case": newCase,
    "treaded": treaded,
    "decovering_case": decoveringCase,
    "test_case": testCase,
    "dead": dead,
    "negative_case": negativeCase,
    "districts": districts,
    "updated_at": updatedAt.toIso8601String(),
  };
}
