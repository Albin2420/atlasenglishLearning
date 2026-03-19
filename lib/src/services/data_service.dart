import 'dart:convert';
import 'package:atlas_learning/src/data/models/model.dart';
import 'package:flutter/services.dart';

class DataService {
  Future<LearningModel> loadLocalData() async {
    final String jsonString = await rootBundle.loadString(
      'assets/data/learning.json',
    );

    final Map<String, dynamic> jsonData = json.decode(jsonString);

    return LearningModel.fromJson(jsonData);
  }
}
