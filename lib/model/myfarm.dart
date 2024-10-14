import 'myfarm.dart';
import 'myfarm.dart';

final String tableFarms = 'myFarms';

class MyFarmFields {
  static final List<String> values = [
    /// Add all fields
    id, isImportant, number, title, description, time
  ];

  static final String id = '_id';
  static final String isImportant = 'isImportant';
  static final String number = 'number';
  static final String title = 'title';
  static final String description = 'description';
  static final String time = 'time';

}

class Farm {
  final int? id;
  final bool status;
  final int number;
  final String title;
  final String description;
  final DateTime createdTime;


  const Farm({
    this.id,
    required this.status,
    required this.number,
    required this.title,
    required this.description,
    required this.createdTime,

  });

  Farm copy({
    int? id,
    bool? isImportant,
    int? number,
    String? title,
    String? description,
    DateTime? createdTime,

  }) =>
      Farm(
        id: id ?? this.id,
        status: isImportant ?? status,
        number: number ?? this.number,
        title: title ?? this.title,
        description: description ?? this.description,
        createdTime: createdTime ?? this.createdTime,

      );

  static Farm fromJson(Map<String, Object?> json) => Farm(
    id: json[MyFarmFields.id] as int?,
    status: json[MyFarmFields.isImportant] == 1,
    number: json[MyFarmFields.number] as int,
    title: json[MyFarmFields.title] as String,
    description: json[MyFarmFields.description] as String,
    createdTime: DateTime.parse(json[MyFarmFields.time] as String),

  );


  Map<String, Object?> toJson() => {
    MyFarmFields.id: id,
    MyFarmFields.title: title,
    MyFarmFields.isImportant: status ? 1 : 0,
    MyFarmFields.number: number,
    MyFarmFields.description: description,
    MyFarmFields.time: createdTime.toIso8601String(),


  };
}
