import 'dart:convert';

GameEndModel gameEndModelFromJson(String str) =>
    GameEndModel.fromJson(json.decode(str));

class GameEndModel {
  GameEndModel({
    required this.count,
    required this.next,
    required this.previous,
    required this.results,
  });

  int count;
  String next;
  String previous;
  List<GameEndResult> results;

  factory GameEndModel.fromJson(Map<String, dynamic> json) => GameEndModel(
        count: json["count"] ?? 0,
        next: json["next"] ?? "",
        previous: json["previous"] ?? "",
        results: json["results"] == null
            ? <GameEndResult>[]
            : List<GameEndResult>.from(
                json["results"].map((x) => GameEndResult.fromJson(x))),
      );
}

class GameEndResult {
  GameEndResult({
    required this.id,
    required this.startDate,
    required this.endDate,
    required this.time,
    required this.date,
    required this.gallery,
    required this.gameClub,
  });

  int id;
  DateTime startDate;
  DateTime endDate;
  int time;
  DateTime date;
  List<dynamic> gallery;
  List<GameClub> gameClub;

  factory GameEndResult.fromJson(Map<String, dynamic> json) => GameEndResult(
        id: json["id"] ?? 0,
        startDate: json["start_date"] == null
            ? DateTime.now()
            : DateTime.parse(json["start_date"]),
        endDate: json["end_date"] == null
            ? DateTime.now()
            : DateTime.parse(json["end_date"]),
        time: json["time"],
        date: json["date"] == null
            ? DateTime.now()
            : DateTime.parse(json["date"]),
        gallery: json["Gallery"] == null
            ? <dynamic>[]
            : List<dynamic>.from(json["Gallery"].map((x) => x)),
        gameClub: json["GameClub"] == null
            ? <GameClub>[]
            : List<GameClub>.from(
                json["GameClub"].map((x) => GameClub.fromJson(x))),
      );
}

class GameClub {
  GameClub({
    required this.id,
    required this.clubNumber,
    required this.footballClub,
    required this.goal,
  });

  int id;
  int clubNumber;
  FootballClub footballClub;
  int goal;

  factory GameClub.fromJson(Map<String, dynamic> json) => GameClub(
        id: json["id"] ?? 0,
        clubNumber: json["club_number"] ?? 0,
        footballClub: json["football_club"] == null
            ? FootballClub.fromJson({})
            : FootballClub.fromJson(json["football_club"]),
        goal: json["goal"] ?? 0,
      );
}

class FootballClub {
  FootballClub({
    required this.id,
    required this.name,
    required this.image,
  });

  int id;
  String name;
  String image;

  factory FootballClub.fromJson(Map<String, dynamic> json) => FootballClub(
        id: json["id"] ?? 0,
        name: json["name"] ?? "",
        image: json["image"] ?? "",
      );
}
