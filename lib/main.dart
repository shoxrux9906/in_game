import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:in_game/src/ui/auth/login/login_screen.dart';
import 'package:in_game/src/ui/home/home_screen.dart';
import 'package:in_game/src/ui/main_screen.dart';
import 'package:in_game/src/ui/testfile.dart';
import 'package:shared_preferences/shared_preferences.dart';

String token = "";

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  token = prefs.getString("token") ?? "";
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(platform: TargetPlatform.iOS),
      home: token == ""? LoginScreen() : MainScreen()
    );
  }
}
