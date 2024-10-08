import 'package:firebase_auth/firebase_auth.dart';

class UserPhoneNumberModel {
  final String? phone;

  UserPhoneNumberModel({
    required this.phone,
  });

  factory UserPhoneNumberModel.fromMap(Map<String, dynamic> json) => UserPhoneNumberModel(
    phone: json['phone']
  );
  
  Map<String, dynamic> toMap() {
    return {
      'phone': phone
    };
  }


}