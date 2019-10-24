class MasteryData {
  int timestamp;
  List<Detail> details;
  bool studied;

  MasteryData.fromJson(Map<String, dynamic> json) {
    timestamp = json['timestamp'];
    details = (json['details'] as List).map((_) => Detail.fromJson(_)).toList();
    studied = json['studied'];
  }
}

class Detail {
  int type;
  int value;

  Detail.fromJson(Map<String, int> json) {
    type = json['type'];
    value = json['value'];
  }
}
