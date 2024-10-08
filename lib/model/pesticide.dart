class PesticideModel {
  final String moagroup;
  final String brandname;
  final String activeingredient;
  final String manufacturer;
  final String formulationtype;
  final String toxicitycategory;
  final String crops;
  final String target;
  PesticideModel({
    required this.moagroup,
    required this.brandname,
    required this.activeingredient,
    required this.manufacturer,
    required this.formulationtype,
    required this.toxicitycategory,
    required this.crops,
    required this.target
  });

  // Pesticide.fromMap(dynamic obj) {
  //   this.moagroup = obj['moagroup'];
  //   this.brandname = obj['brandname'];
  //   this.activeingredient = obj['activeingredient'];
  //   this.manufacturer = obj['manufacturer'];
  //   this.formulationtype = obj['formulationtype'];
  //   this.toxicitycategory = obj['toxicitycategory'];
  //   this.crops = obj['crops'];
  //   this.target = obj['target'];
  // }

  factory PesticideModel.fromMap(Map<String, dynamic> json) => PesticideModel(
      moagroup: json['moagroup'],
      brandname: json['brandname'],
      activeingredient: json['activeingredient'],
      manufacturer: json['manufacturer'],
      formulationtype: json['formulationtype'],
      toxicitycategory: json['toxicitycategory'],
      crops: json['crops'],
      target: json['target'],
  );

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'moagroup' : moagroup,
      'brandname': brandname,
      'activeingredient': activeingredient,
      'manufacturer':manufacturer,
      'formulationtype':formulationtype,
      'toxicitycategory':toxicitycategory,
      'crops':crops,
      'target':target,
    };

    return map;
  }
}