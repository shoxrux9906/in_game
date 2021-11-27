class LoginModel {
  LoginModel({
    required this.status,
    required this.msg,
    required this.user,
    required this.token,
  });

  int status;
  String msg;
  User user;
  String token;

  factory LoginModel.fromJson(Map<dynamic, dynamic> json) => LoginModel(
        status: json["status"] ?? 0,
        msg: json["msg"] ?? "",
        user: json["user"] == null
            ? User.fromJson({})
            : User.fromJson(json["user"]),
        token: json["token"] ?? "",
      );
}

class User {
  User({
    required this.id,
    required this.login,
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
    required this.location,
    required this.autopadbor,
    required this.notification,
    required this.city,
    required this.region,
    required this.userDevices,
  });

  int id;
  String login;
  String avatar;
  String fullName;
  String phone;
  String email;
  DateTime lastLogin;
  DateTime birthDate;
  int age;
  int gameTime;
  int ball;
  int victory;
  int position;
  Positions positions;
  FootballClub footballClub;
  String division;
  String gender;
  String location;
  bool autopadbor;
  bool notification;
  City city;
  City region;
  List<UserDevice> userDevices;

  factory User.fromJson(Map<dynamic, dynamic> json) => User(
        id: json["id"] ?? 0,
        login: json["login"] ?? "",
        avatar: json["avatar"] ?? "",
        fullName: json["full_name"] ?? "",
        phone: json["phone"] ?? "",
        email: json["email"] ?? "",
        lastLogin: json["last_login"] == null
            ? DateTime.now()
            : DateTime.parse(json["last_login"]),
        birthDate: json["birth_date"] == null
            ? DateTime.now()
            : DateTime.parse(json["birth_date"]),
        age: json["age"] ?? 0,
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
        location: json["location"] ?? "",
        autopadbor: json["autopadbor"] ?? false,
        notification: json["notification"] ?? false,
        city: json["city"] == null
            ? City.fromJson({})
            : City.fromJson(json["city"]),
        region: json["region"] == null
            ? City.fromJson({})
            : City.fromJson(json["region"]),
        userDevices: json["user_devices"] == null
            ? <UserDevice>[]
            : List<UserDevice>.from(
                json["user_devices"].map((x) => UserDevice.fromJson(x))),
      );
}

class City {
  City({
    required this.id,
    required this.name,
  });

  int id;
  String name;

  factory City.fromJson(Map<String, dynamic> json) => City(
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

class UserDevice {
  UserDevice({
    required this.id,
    required this.token,
  });

  int id;
  String token;

  factory UserDevice.fromJson(Map<String, dynamic> json) => UserDevice(
        id: json["id"] ?? 0,
        token: json["token"] ?? "",
      );
}
