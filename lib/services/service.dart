import 'dart:io';
import 'package:covid19_dashboard/models/country.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'dart:convert';
import 'env.dart';

class ServiceNetwork {
  Future fetchAllData() async {
    try {
      final Response response = await http.get(
        base_url,
        headers: {'Content-Type': 'application/json', 'Charset': 'utf-8'},
      );
      var data = response.body;
      final jsonString = json.decode(data);

      return Country.fromJson(jsonString);
    } on HttpException catch (e) {
      return e;
    }
  }
}
