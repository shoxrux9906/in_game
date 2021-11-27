class ProfileModel {
  ProfileModel({
    required this.status,
    required this.data,
  });

  int status;
  Data data;

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
        status: json["status"] ?? 0,
        data: json["data"] == null
            ? Data.fromJson({})
            : Data.fromJson(json["data"]),
      );
}

class Data {
  Data({
    required this.id,
    required this.avatar,
    required this.fullName,
    required this.phone,
    required this.age,
    required this.birthDate,
    required this.gameTime,
    required this.ball,
    required this.victory,
    required this.position,
    required this.positions,
    required this.footballClub,
    required this.division,
    required this.gender,
    required this.autopadbor,
    required this.notification,
    required this.autoRoll,
    required this.city,
    required this.region,
  });

  int id;
  String avatar;
  String fullName;
  String phone;
  int age;
  String birthDate;
  int gameTime;
  int ball;
  int victory;
  int position;
  Positions positions;
  FootballClub footballClub;
  String division;
  String gender;
  bool autopadbor;
  bool notification;
  bool autoRoll;
  City city;
  City region;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"] ?? 0,
        avatar: json["avatar"] ?? "",
        fullName: json["full_name"] ?? "",
        phone: json["phone"] ?? "",
        age: json["age"] ?? 0,
        birthDate: json["birth_date"] ?? "",
        gameTime: json["game_time"] ?? 0,
        ball: json["ball"] ?? 0,
        victory: json["victory"] ?? 0,
        position: json["position"] ?? 0,
        positions: json["positions"] == null
            ? Positions.fromJson({})
            : Positions.fromJson(json["positions"]),
        footballClub: json["football_club"] == null
            ? FootballClub.fromJson({})
            : FootballClub.fromJson(json["football_club"]),
        division: json["division"] ?? "",
        gender: json["gender"] ?? "",
        autopadbor: json["autopadbor"] ?? false,
        notification: json["notification"] ?? false,
        autoRoll: json["auto_roll"] ?? false,
        city: json["city"] == null
            ? City.fromJson({})
            : City.fromJson(json["city"]),
        region: json["region"] == null
            ? City.fromJson({})
            : City.fromJson(json["region"]),
      );
}

class City {
  City({
    required this.id,
    required this.name,
  });

  int id;
  String name;

  factory City.fromJson(Map<dynamic, dynamic> json) => City(
        id: json["id"] ?? 0,
        name: json["name"] ?? "",
      );
}

class FootballClub {
  FootballClub({
    required this.id,
    required this.name,
    required this.ball,
    required this.image,
  });

  int id;
  String name;
  int ball;
  String image;

  factory FootballClub.fromJson(Map<String, dynamic> json) => FootballClub(
        id: json["id"] ?? 0,
        name: json["name"] ?? "",
        ball: json["ball"] ?? 0,
        image: json["image"] ?? "",
      );
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
        goalkeeper: json["Goalkeeper"] ?? 0,
        defender: json["Defender"] ?? 0,
        forward: json["Forward"] ?? 0,
        midfielder: json["Midfielder"] ?? 0,
      );
}
