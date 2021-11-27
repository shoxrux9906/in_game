import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:in_game/src/inGameRepository/in_game_repository.dart';
import 'package:in_game/src/models/api/accepted_model.dart';
import 'package:in_game/src/ui/home/home_screen.dart';
import 'package:in_game/src/utils/app_theme.dart';
import 'package:in_game/src/widgets/pin_put.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PinPutTest extends StatefulWidget {
  final String phone;
  final String password;

  PinPutTest({
    required this.phone,
    required this.password,
  });

  @override
  PinPutTestState createState() => PinPutTestState();
}

class PinPutTestState extends State<PinPutTest> {
  final TextEditingController _pinPutController = TextEditingController();
  final FocusNode _pinPutFocusNode = FocusNode();

  BoxDecoration get _pinPutDecoration {
    return BoxDecoration(
      color: AppTheme.DARK_GRAY,
      borderRadius: BorderRadius.circular(16.0),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: AppTheme.BLACK,
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
        ),
        body: Stack(
          children: [
            Container(
              // padding: EdgeInsets.only(left: 24, right: 24),
              margin: EdgeInsets.only(left: 16, right: 16),
              decoration: BoxDecoration(
                  color: AppTheme.DARK2,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(32),
                    topLeft: Radius.circular(32),
                  )),
            ),
            Container(
              margin: EdgeInsets.only(top: 14),
              decoration: BoxDecoration(
                  color: AppTheme.DARK,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(32),
                    topLeft: Radius.circular(32),
                  )),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 26, left: 16, right: 16),
                    child: Text(
                      "Введите 4-значный Код верификации",
                      style: TextStyle(
                        fontFamily: AppTheme.fontFamilyManrope,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w800,
                        fontSize: 24,
                        height: 1.4,
                        color: AppTheme.WHITE,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10, left: 16, right: 16),
                    child: Text(
                      "Код отправлен на номер +99893****09 Срок действия кода истекает через  01:30",
                      style: TextStyle(
                        fontFamily: AppTheme.fontFamilyManrope,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        height: 1.5,
                        color: AppTheme.GRAY,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 16, right: 16, top: 48),
                    child: PinPut(
                      fieldsCount: 4,
                      onSubmit: (String pin) {
                        sendData(pin);
                      },
                      focusNode: _pinPutFocusNode,
                      controller: _pinPutController,
                      selectedFieldDecoration: _pinPutDecoration,
                      submittedFieldDecoration: _pinPutDecoration.copyWith(
                        borderRadius: BorderRadius.circular(16.0),
                        color: AppTheme.DARK_GRAY,
                      ),
                      followingFieldDecoration: _pinPutDecoration.copyWith(
                          borderRadius: BorderRadius.circular(16.0),
                          color: AppTheme.DARK_GRAY),
                      textStyle: TextStyle(
                        fontFamily: AppTheme.fontFamilyManrope,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w500,
                        fontSize: 24,
                        height: 1.5,
                        color: AppTheme.GRAY,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Не получили код? ",
                        style: TextStyle(
                          fontFamily: AppTheme.fontFamilyManrope,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          height: 21 / 16,
                          color: AppTheme.WHITE,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Text(
                          "Отправить повторно",
                          style: TextStyle(
                            fontFamily: AppTheme.fontFamilyManrope,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                            height: 1.4,
                            color: AppTheme.GREEN,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> sendData(String pin) async {
    var response = await InGameRepository.getUserApi();
    if (response.success) {
      AcceptedModel data = AcceptedModel.fromJson(response.result);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      if (data.status == 1) {
        prefs.setString("token", data.token);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) {
              return HomeScreen();
            },
          ),
        );
      } else {
        print(data.msg);
      }
    } else {
      print("Something went wrong");
    }
  }
}
