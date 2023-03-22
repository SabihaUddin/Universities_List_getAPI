import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:universities_list_api/utiles/data_model.dart';
import 'package:http/http.dart' as http;

class HomeProvider extends ChangeNotifier {
  final List<UniversitiesData> _universitiesList = [];

  List<UniversitiesData> get universitiesList => _universitiesList;

  Future<void> getUniversitites() async {
    try {
      var response = await http.get(Uri.parse(
          'http://universities.hipolabs.com/search?country=United+States'));
      if (response.statusCode == 200) {
        var result = jsonDecode(response.body);

        for (var x in result) {
          UniversitiesData info = UniversitiesData.fromJson(x);
          _universitiesList.add(info);
          print(_universitiesList.length);
        }
      }
      notifyListeners();
    }
    catch (e) {
      debugPrint('error');

    }
  }
}