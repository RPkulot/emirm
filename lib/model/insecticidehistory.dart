class InsecticideHistoryModel {
  final String usageid;
  final String insecticideid;
  final DateTime startdate;
  final DateTime enddate;
  final String color;
  final bool is_current;
  final String moagroup;
  InsecticideHistoryModel({
    required this.usageid,
    required this.insecticideid,
    required this.startdate,
    required this.enddate,
    required this.color,
    required this.is_current,
    required this.moagroup
  });

  factory InsecticideHistoryModel.fromMap(Map<String, dynamic> json) => InsecticideHistoryModel(
    usageid: json['usageid'],
    insecticideid: json['insecticideid'],
    startdate: DateTime.parse(json['startdate']),
    enddate: DateTime.parse(json['enddate']),
    color: json['color'],
    is_current: json['is_current'] == 1,
    moagroup: json['moagroup']
  );

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'usageid' : usageid,
      'insecticideid': insecticideid,
      'startdate': startdate.toIso8601String(),
      'enddate':enddate.toIso8601String(),
      'color':color,
      'is_current': is_current ? 1: 0,
      'moagroup': moagroup
    };

    return map;
  }
}