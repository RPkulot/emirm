class FPAListModel {
  final String moagroup;
  final String chemicalgroup;
  final String activeingredient;
  final String productname;
  final String company;
 FPAListModel({
    required this.moagroup,
    required this.chemicalgroup,
    required this.activeingredient,
    required this.productname,
    required this.company,
  });

  factory FPAListModel.fromMap(Map<String, dynamic> json) => FPAListModel(
    moagroup: json['moagroup'],
    chemicalgroup: json['chemicalgroup'],
    activeingredient: json['activeingredient'],
    productname: json['productname'],
    company: json['company'],
  );

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'moagroup' : moagroup,
      'brandname': chemicalgroup,
      'activeingredient': activeingredient,
      'productname':productname,
      'company':company,
    };

    return map;
  }
}