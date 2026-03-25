import 'dart:convert';
import 'dart:developer';
import 'package:flutter/services.dart';
import '../data/models/model.dart';

class DataService {

  /// Reads writing.json
  Future<Map<String, dynamic>> _readWritingJson() async {
    final jsonString =
    await rootBundle.loadString('assets/data/writing.json');
    return jsonDecode(jsonString) as Map<String, dynamic>;
  }

  /// Reads listening.json
  Future<Map<String, dynamic>> _readListeningJson() async {
    final jsonString =
    await rootBundle.loadString('assets/data/listening.json');
    return jsonDecode(jsonString) as Map<String, dynamic>;
  }

  /// Writing section → Map<String, WritingModel>
  Future<Map<String, WritingModel>> loadWritingData() async {
    try {
      final json = await _readWritingJson();
      final result = (json['writing'] as Map<String, dynamic>).map(
            (key, value) => MapEntry(key, WritingModel.fromJson(value)),
      );
      log('WritingData loaded: ${result.keys}');
      return result;
    } catch (e) {
      log('loadWritingData error: $e');
      return {};
    }
  }

  /// Listening section → Map<String, ListeningSectionModel>
  Future<Map<String, ListeningSectionModel>> loadListeningData() async {
    try {
      final json = await _readListeningJson();
      final result = (json['listening'] as Map<String, dynamic>).map(
            (key, value) =>
            MapEntry(key, ListeningSectionModel.fromJson(value)),
      );
      log('ListeningData loaded: ${result.keys}');
      return result;
    } catch (e) {
      log('loadListeningData error: $e');
      return {};
    }
  }
}