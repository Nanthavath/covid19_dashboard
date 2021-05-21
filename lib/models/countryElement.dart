import 'package:covid19_dashboard/models/province.dart';

class CountryElement {
  CountryElement({
    this.id,
    this.name,
    this.total,
    this.newCase,
    this.treaded,
    this.decoveringCase,
    this.testCase,
    this.negativeCase,
    this.dead,
    this.provinces,
    this.updatedAt,
    this.districts,
  });

  String id;
  String name;
  int total;
  int newCase;
  int treaded;
  int decoveringCase;
  int testCase;
  int negativeCase;
  int dead;
  List<Provinces> provinces;
  DateTime updatedAt;
  dynamic districts;

  factory CountryElement.fromJson(Map<String, dynamic> json) => CountryElement(
    id: json["id"],
    name: json["name"],
    total: json["total"],
    newCase: json["new_case"],
    treaded: json["treaded"],
    decoveringCase: json["decovering_case"],
    testCase: json["test_case"],
    negativeCase: json["negative_case"],
    dead: json["dead"],
    provinces: json["provinces"] == null ? null : List<Provinces>.from(json["provinces"].map((x) => Provinces.fromJson(x))),
    updatedAt: DateTime.parse(json["updated_at"]),
    districts: json["districts"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "total": total,
    "new_case": newCase,
    "treaded": treaded,
    "decovering_case": decoveringCase,
    "test_case": testCase,
    "negative_case": negativeCase,
    "dead": dead,
    "provinces": provinces == null ? null : List<dynamic>.from(provinces.map((x) => x.toJson())),
    "updated_at": updatedAt.toIso8601String(),
    "districts": districts,
  };
}