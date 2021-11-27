// To parse required this JSON data, do
//
//     final registrationModel = registrationModelFromJson(jsonString);

import 'dart:convert';

RegistrationModel registrationModelFromJson(String str) =>
    RegistrationModel.fromJson(json.decode(str));

class RegistrationModel {
  RegistrationModel({
    required this.status,
    required this.msg,
    required this.token,
  });

  int status;
  String msg;
  String token;

  factory RegistrationModel.fromJson(Map<String, dynamic> json) =>
      RegistrationModel(
        status: json["status"] ?? 0,
        msg: json["msg"] ?? "",
        token: json["token"] ?? "",
      );
}

