import 'package:contactapp/models/RecordList.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

class RecordService {
  Future<String> _loadRecordAsset() async {
    return await rootBundle.loadString('assets/data/records.json');
  }

  Future<RecordList> loadRecords() async {
    String jsonString = await _loadRecordAsset();
    final jsonResponse = json.decode(jsonString);
    RecordList recordList = new RecordList.fromJson(jsonResponse);
    return recordList;
  }
}
