import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:in_game/src/ui/auth/login/login_screen.dart';
import 'package:in_game/src/utils/app_theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppTheme.BLACK,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            padding: EdgeInsets.all(16),
            child: SvgPicture.asset("assets/icons/arrow_right.svg"),
          ),
        ),
        title: Text("Настройки"),
      ),
      body: Container(
        color: AppTheme.BLACK,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomRow(name: "Автоподбор игроков", isArrow: false),
            CustomRow(name: "Автораспределение ролей", isArrow: false),
            CustomRow(name: "Push-уведомления", isArrow: false),
            CustomRow(name: "Подписка", isArrow: true),
            CustomRow(name: "История оплат", isArrow: true),
            GestureDetector(
              onTap: () async {
                await showModalBottomSheet(
                    barrierColor: AppTheme.BLACK.withOpacity(0.9),
                    backgroundColor: Colors.transparent,
                    context: context,
                    builder: customModalBottomSheet);
              },
              child: Container(
                margin: EdgeInsets.only(top: 16, left: 16, right: 16),
                child: Text(
                  "Выйти с аккаунта",
                  style: TextStyle(
                    fontFamily: AppTheme.fontFamilyManrope,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    height: 22 / 16,
                    color: AppTheme.RED,
                  ),
                ),
              ),
            ),
            Spacer(),
            Divider(
              height: 1,
              color: AppTheme.DARK,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 48,
                margin: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: AppTheme.GREEN,
                ),
                child: Center(
                  child: Text(
                    "Сохранить",
                    style: TextStyle(
                      fontFamily: AppTheme.fontFamilySFPro,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      height: 20 / 16,
                      color: AppTheme.WHITE,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget customModalBottomSheet(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(24),
      height: 200,
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 138,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: AppTheme.WHITE,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding:
                      EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 16),
                  child: Text(
                    "Вы действительно хотите выйти со своего аккаунта?",
                    style: TextStyle(
                      fontFamily: AppTheme.fontFamilyManrope,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      height: 1.5,
                      color: AppTheme.BLACK,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                GestureDetector(
                  onTap: ()async{
                    SharedPreferences prefs = await SharedPreferences.getInstance();
                    await prefs.clear();
                    exit(0);
                  },
                  child: Container(
                    padding: EdgeInsets.only(top: 8),
                    decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(
                          width: 1,
                          color: AppTheme.GRAYDA,
                        )
                      ),
                    ),
                    child: Center(
                      child: Text(
                        "Да, выйти",
                        style: TextStyle(
                          fontFamily: AppTheme.fontFamilyManrope,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w400,
                          fontSize: 18,
                          height: 1.5,
                          color: AppTheme.RED,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 8,
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 53,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: AppTheme.WHITE,
              ),
              child: Center(
                child: Text(
                  "Отмена",
                  style: TextStyle(
                    fontFamily: AppTheme.fontFamilyManrope,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w400,
                    fontSize: 18,
                    height: 1,
                    color: AppTheme.GRAY,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomRow extends StatefulWidget {
  final String name;
  final bool isArrow;

  CustomRow({
    required this.name,
    required this.isArrow,
  });

  @override
  _CustomRowState createState() => _CustomRowState();
}

class _CustomRowState extends State<CustomRow> {
  bool _swtichValue = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 16, left: 16, right: 16),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                widget.name,
                style: TextStyle(
                  fontFamily: AppTheme.fontFamilyManrope,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  height: 22 / 16,
                  color: AppTheme.WHITE,
                ),
              ),
              Spacer(),
              widget.isArrow
                  ? SvgPicture.asset("assets/icons/arrow_right2.svg")
                  : FlutterSwitch(
                      width: 40,
                      height: 24,
                      toggleSize: 16,
                      activeColor: AppTheme.GREEN,
                      inactiveColor: AppTheme.DARK,
                      inactiveToggleColor: AppTheme.DARK_GRAY,
                      value: _swtichValue,
                      onToggle: (value) {
                        setState(() {
                          _swtichValue = value;
                        });
                      })
            ],
          ),
          SizedBox(
            height: 16,
          ),
          Divider(
            height: 1,
            color: AppTheme.GRAY.withOpacity(0.2),
          )
        ],
      ),
    );
  }
}
