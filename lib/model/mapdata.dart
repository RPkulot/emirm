class MapDataModel {
  final String date;
  final String region;
  final String province;
  final String municity;
  final String barangay;
  final String long;
  final String lat;
  final String crop;
  final String variety;
  final String dna;
  final String areaaffected;
  MapDataModel({
    required this.date,
    required this.region,
    required this.province,
    required this.municity,
    required this.barangay,
    required this.long,
    required this.lat,
    required this.crop,
    required this.variety,
    required this.dna,
    required this.areaaffected
  });

  factory MapDataModel.fromMap(Map<String, dynamic> json) => MapDataModel(
    date: json['date'],
    region: json['region'],
    province: json['province'],
    municity: json['municity'],
    barangay: json['barangay'],
    long: json['long'],
    lat: json['lat'],
    crop: json['crop'],
    variety: json['variety'],
    dna: json['dna'],
    areaaffected: json['areaaffected'],
  );

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'date' : date,
      'region': region,
      'province': province,
      'municity':municity,
      'barangay':barangay,
      'long':long,
      'lat':lat,
      'crop':crop,
      'variety':variety,
      'dna':dna,
      'areaaffected':areaaffected,
    };

    return map;
  }
}