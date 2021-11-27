import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:in_game/src/utils/app_theme.dart';

class NewGameScreen extends StatefulWidget {
  const NewGameScreen({Key? key}) : super(key: key);

  @override
  _NewGameScreenState createState() => _NewGameScreenState();
}

class _NewGameScreenState extends State<NewGameScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppTheme.BLACK,
        title: Text(
          "Новая игра",
          style: TextStyle(
            fontFamily: AppTheme.fontFamilyManrope,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.bold,
            fontSize: 16,
            height: 22 / 16,
            color: AppTheme.WHITE,
          ),
        ),
      ),
      body: Container(
        color: AppTheme.BLACK,
        child: ListView(
          children: [
            Container(
              margin: EdgeInsets.only(
                top: 16,
                left: 16,
                right: 16,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                      child: ItemTeam(
                          teamName: "Команда 1", amount: "Кол-во очков")),
                  SizedBox(
                    width: 12,
                  ),
                  Container(
                    padding: EdgeInsets.all(8),
                    height: 97,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(80),
                      color: AppTheme.TURQOISE.withOpacity(0.3),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/images/endurance.png",
                          width: 28,
                          height: 28,
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Text(
                          "90 мин",
                          style: TextStyle(
                            fontFamily: AppTheme.fontFamilyManrope,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            height: 22 / 16,
                            color: AppTheme.WHITE,
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Expanded(
                    child:
                        ItemTeam(teamName: "Команда 2", amount: "Кол-во очков"),
                  ),
                ],
              ),
            ),
            ItemGamer(gamerPosition: "Вратари"),
            ItemGamer(gamerPosition: "Защитники"),
            ItemGamer(gamerPosition: "Полузащитники"),
            ItemGamer(gamerPosition: "Нападающии"),
            Container(
              margin:
                  EdgeInsets.only(top: 16, left: 16, right: 16, bottom: 100),
              height: 56,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: AppTheme.GRAY.withOpacity(0.4)),
              child: Center(
                child: Text(
                  "Начать игру",
                  style: TextStyle(
                    fontFamily: AppTheme.fontFamilyManrope,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w800,
                    fontSize: 16,
                    height: 22 / 16,
                    color: AppTheme.GRAY,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ItemTeam extends StatefulWidget {
  final String teamName;
  final String amount;

  ItemTeam({
    required this.teamName,
    required this.amount,
  });

  @override
  State<StatefulWidget> createState() {
    return _ItemTeamState();
  }
}

class _ItemTeamState extends State<ItemTeam> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 48,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: AppTheme.DARK_GRAY,
          ),
          child: Center(
            child: Text(
              "${widget.teamName}",
              style: TextStyle(
                fontFamily: AppTheme.fontFamilyManrope,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w600,
                fontSize: 16,
                height: 22 / 16,
                color: AppTheme.GRAY,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 8,
        ),
        Text(
          "${widget.amount}",
          style: TextStyle(
            fontFamily: AppTheme.fontFamilyManrope,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w600,
            fontSize: 14,
            height: 1.4,
            color: AppTheme.WHITE,
          ),
        )
      ],
    );
  }
}

class ItemGamer extends StatefulWidget {
  final String gamerPosition;

  ItemGamer({required this.gamerPosition});

  @override
  _ItemGamerState createState() => _ItemGamerState();
}

class _ItemGamerState extends State<ItemGamer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(
            height: 24,
          ),
          Text(
            "${widget.gamerPosition}",
            style: TextStyle(
              fontFamily: AppTheme.fontFamilyManrope,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.bold,
              fontSize: 16,
              height: 22 / 16,
              color: AppTheme.WHITE,
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              top: 12,
              left: 16,
              right: 16,
            ),
            padding: EdgeInsets.all(16),
            height: 108,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16), color: AppTheme.DARK),
            child: Row(
              children: [
                Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(12),
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(48),
                        color: AppTheme.BLUE2.withOpacity(0.2),
                      ),
                      child: SvgPicture.asset("assets/icons/addUser1.svg"),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      "Игрок",
                      style: TextStyle(
                        fontFamily: AppTheme.fontFamilyManrope,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        height: 1.5,
                        color: AppTheme.WHITE,
                      ),
                    ),
                  ],
                ),
                Spacer(),
                Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(12),
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(48),
                        color: AppTheme.GREEN.withOpacity(0.2),
                      ),
                      child: SvgPicture.asset("assets/icons/addUser2.svg"),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      "Игрок",
                      style: TextStyle(
                        fontFamily: AppTheme.fontFamilyManrope,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        height: 1.5,
                        color: AppTheme.WHITE,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
