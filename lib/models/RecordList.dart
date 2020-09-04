import 'Record.dart';

class RecordList {
  List<Record> list = new List();

  RecordList(this.list);




  factory RecordList.fromJson(List<dynamic> parsedJson) {
    List<Record> records = new List<Record>();

    records = parsedJson.map((e) => Record.fromJson(e)).toList();

    return new RecordList(records);
  }
}
