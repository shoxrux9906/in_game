// import 'package:in_game/src/models/api/profile_model.dart';
// import 'package:in_game/src/models/login_model.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// class Cache {
//   static Future<void> saveData(ProfileModel data) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     prefs.setInt("id", data.data.id);
//     prefs.setString("avatar", data.data.avatar);
//     prefs.setString("full_name", data.data.fullName);
//     prefs.setInt("age", data.data.age);
//     prefs.setInt("game_time", data.data.gameTime);
//     prefs.setInt("ball", data.data.ball);
//     prefs.setInt("positions", Positions.fromJson({}));
//
//     prefs.setString("gender", data.data.gender);
//     prefs.setString("birth_date", data.data.birthDate);
//     prefs.setString("phone", data.data.phone);
//     prefs.setString("football_club", data.data.footballClub.id.toString());
//     prefs.setString("position", data.data.position.toString());
//     prefs.setInt("city", data.data.city.id);
//     prefs.
//   }
//
//   static Future<ProfileModel> getData() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//
//     return ProfileModel(
//       data: Data(
//         id: 0,
//         avatar: prefs.getString("avatar") ?? "",
//         fullName: prefs.getString("full_name") ?? "",
//         phone: prefs.getString("phone") ?? "",
//         age: 0,
//         birthDate: prefs.getString("birth_date") ?? "",
//         gameTime: 0,
//         ball: 0,
//         victory: 0,
//         position: prefs.getInt("position") ?? 0,
//         positions: Positions.fromJson({}),
//         footballClub: prefs.getString("football_club") == null ? FootballClub.fromJson({}) : FootballClub(id: prefs.getInt(key), name: name, ball: ball, image: image),
//         division: "",
//         gender: prefs.getString("gender") ?? "",
//         autopadbor: false,
//         notification: false,
//         autoRoll: false,
//         city: prefs.getString("city") ?? City.fromJson({}),
//         region: City.fromJson({})
//       ),
//       status: 1,
//     );
//   }
// }
