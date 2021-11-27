import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:in_game/src/utils/app_theme.dart';

class CenterDialog {
  static void showErrorDialog(
      BuildContext context, String title, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Theme(
          data: ThemeData.dark(),
          child: CupertinoAlertDialog(
            title: Text(
              title,
              style: TextStyle(
                fontFamily: AppTheme.fontFamilyManrope,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.normal,
                height: 1.5,
                letterSpacing: 0.5,
                color: AppTheme.RED,
              ),
            ),
            content: Text(
              message,
              style: TextStyle(
                fontFamily: AppTheme.fontFamilyManrope,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.normal,
                height: 1.5,
                letterSpacing: 0.5,
                color: AppTheme.WHITE,
              ),
            ),
            actions: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Ok",
                    style: TextStyle(
                      fontFamily: AppTheme.fontFamilyManrope,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.normal,
                      height: 1.5,
                      letterSpacing: 0.5,
                      color: AppTheme.RED,
                      decoration: TextDecoration.none
                    ),
                    textAlign: TextAlign.end
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
