import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:in_game/src/ui/players/players_screen.dart';
import 'package:in_game/src/utils//app_theme.dart';
import 'package:in_game/src/ui/home/home_screen.dart';
import 'package:in_game/src/ui/pitches/pitches_screen.dart';
import 'package:in_game/src/ui/worldRating/world_rating_screen.dart';

import 'new_game/new_game_screen.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedIndex = 0;
  List<Widget> data = [
    HomeScreen(),
    PlayersScreen(),
    NewGameScreen(),
    PitchesScreen(),
    WorldRatingScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: data[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        backgroundColor: AppTheme.DARK,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppTheme.DARK,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset("assets/icons/home.svg"),
            activeIcon: SvgPicture.asset("assets/icons/act_home.svg"),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset("assets/icons/players.svg"),
            activeIcon: SvgPicture.asset("assets/icons/act_players.svg"),
            backgroundColor: AppTheme.BLACK,
            label: "",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset("assets/icons/new_game.svg"),
            activeIcon: SvgPicture.asset("assets/icons/act_new_game.svg"),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset("assets/icons/field.svg"),
            activeIcon: SvgPicture.asset("assets/icons/act_field.svg"),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset("assets/icons/rating.svg"),
            activeIcon: SvgPicture.asset("assets/icons/act_rating.svg"),
            label: "",
          ),
        ],
      ),
    );
  }
}
