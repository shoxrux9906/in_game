// To parserequired this JSON data, do
//
//     final acceptedModel = acceptedModelFromJson(jsonString);

import 'dart:convert';

AcceptedModel acceptedModelFromJson(String str) => AcceptedModel.fromJson(json.decode(str));

class AcceptedModel {
  AcceptedModel({
   required this.status,
   required this.msg,
   required this.token,
  });

  int status;
  String msg;
  String token;

  factory AcceptedModel.fromJson(Map<String, dynamic> json) => AcceptedModel(
    status: json["status"],
    msg: json["msg"],
    token: json["token"],
  );

}

