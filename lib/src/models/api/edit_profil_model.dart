// To parse this JSON data, do
//
//     final editProfilModel = editProfilModelFromJson(jsonString);

import 'dart:convert';

EditProfilModel editProfilModelFromJson(String str) => EditProfilModel.fromJson(json.decode(str));

String editProfilModelToJson(EditProfilModel data) => json.encode(data.toJson());

class EditProfilModel {
  EditProfilModel({
   required this.status,
   required this.data,
   required this.msg,
  });

  int status;
  Data data;
  String msg;

  factory EditProfilModel.fromJson(Map<String, dynamic> json) => EditProfilModel(
    status: json["status"],
    data: Data.fromJson(json["data"]),
    msg: json["msg"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data.toJson(),
    "msg": msg,
  };
}

class Data {
  Data({
   required this.id,
   required this.avatar,
   required this.fullName,
   required this.phone,
   required this.email,
   required this.lastLogin,
   required this.birthDate,
   required this.age,
   required this.gameTime,
   required this.ball,
   required this.victory,
   required this.position,
   required this.positions,
   required this.footballClub,
   required this.division,
   required this.gender,
   required this.point,
   required this.latitude,
   required this.longitude,
   required this.autopadbor,
   required this.notification,
   required this.autoRoll,
   required this.city,
   required this.region,
   required this.userDevices,
  });

  int id;
  String avatar;
  String fullName;
  String phone;
  dynamic email;
  DateTime lastLogin;
  DateTime birthDate;
  int age;
  int gameTime;
  int ball;
  int victory;
  String position;
  Positions positions;
  dynamic footballClub;
  String division;
  String gender;
  dynamic point;
  dynamic latitude;
  dynamic longitude;
  bool autopadbor;
  bool notification;
  bool autoRoll;
  dynamic city;
  dynamic region;
  List<UserDevice> userDevices;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    avatar: json["avatar"],
    fullName: json["full_name"],
    phone: json["phone"],
    email: json["email"],
    lastLogin: DateTime.parse(json["last_login"]),
    birthDate: DateTime.parse(json["birth_date"]),
    age: json["age"],
    gameTime: json["game_time"],
    ball: json["ball"],
    victory: json["victory"],
    position: json["position"],
    positions: Positions.fromJson(json["positions"]),
    footballClub: json["football_club"],
    division: json["division"],
    gender: json["gender"],
    point: json["point"],
    latitude: json["latitude"],
    longitude: json["longitude"],
    autopadbor: json["autopadbor"],
    notification: json["notification"],
    autoRoll: json["auto_roll"],
    city: json["city"],
    region: json["region"],
    userDevices: List<UserDevice>.from(json["user_devices"].map((x) => UserDevice.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "avatar": avatar,
    "full_name": fullName,
    "phone": phone,
    "email": email,
    "last_login": lastLogin.toIso8601String(),
    "birth_date": "${birthDate.year.toString().padLeft(4, '0')}-${birthDate.month.toString().padLeft(2, '0')}-${birthDate.day.toString().padLeft(2, '0')}",
    "age": age,
    "game_time": gameTime,
    "ball": ball,
    "victory": victory,
    "position": position,
    "positions": positions.toJson(),
    "football_club": footballClub,
    "division": division,
    "gender": gender,
    "point": point,
    "latitude": latitude,
    "longitude": longitude,
    "autopadbor": autopadbor,
    "notification": notification,
    "auto_roll": autoRoll,
    "city": city,
    "region": region,
    "user_devices": List<dynamic>.from(userDevices.map((x) => x.toJson())),
  };
}

class Positions {
  Positions({
   required this.goalkeeper,
   required this.defender,
   required this.forward,
   required this.midfielder,
  });

  int goalkeeper;
  int defender;
  int forward;
  int midfielder;

  factory Positions.fromJson(Map<String, dynamic> json) => Positions(
    goalkeeper: json["Goalkeeper"],
    defender: json["Defender"],
    forward: json["Forward"],
    midfielder: json["Midfielder"],
  );

  Map<String, dynamic> toJson() => {
    "Goalkeeper": goalkeeper,
    "Defender": defender,
    "Forward": forward,
    "Midfielder": midfielder,
  };
}

class UserDevice {
  UserDevice({
   required this.id,
   required this.token,
  });

  int id;
  String token;

  factory UserDevice.fromJson(Map<String, dynamic> json) => UserDevice(
    id: json["id"],
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "token": token,
  };
}
