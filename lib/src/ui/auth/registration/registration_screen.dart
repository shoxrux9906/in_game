import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:in_game/src/dialog/center_dialog.dart';
import 'package:in_game/src/utils/app_theme.dart';
import 'package:in_game/src/inGameRepository/in_game_repository.dart';
import 'package:in_game/src/models/registration_model.dart';
import 'package:in_game/src/ui/auth/login/login_screen.dart';
import 'package:in_game/src/ui/auth/registration/pin_put_test.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  TextEditingController _controllerName = TextEditingController();
  TextEditingController _controllerPhoneNumber = TextEditingController();
  TextEditingController _controllerPassword = TextEditingController();
  TextEditingController _controllerPasswordAgain = TextEditingController();

  bool _obscureText1 = true;
  bool _obscureText2 = true;

  void _toogle1() {
    setState(() {
      _obscureText1 = !_obscureText1;
    });
  }

  void _toogle2() {
    setState(() {
      _obscureText2 = !_obscureText2;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppTheme.BLACK,
        appBar: AppBar(
          backgroundColor: AppTheme.BLACK,
          elevation: 0,
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
              margin: EdgeInsets.only(left: 16, right: 16),
              decoration: BoxDecoration(
                color: AppTheme.DARK2,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(32),
                  topLeft: Radius.circular(32),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 14),
              decoration: BoxDecoration(
                color: AppTheme.DARK,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(32),
                  topLeft: Radius.circular(32),
                ),
              ),
              child: Expanded(
                child: ListView(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 26, left: 16, right: 16),
                      child: Center(
                        child: Text(
                          "Регистрация",
                          style: TextStyle(
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w800,
                            fontSize: 24,
                            color: AppTheme.WHITE,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 16, right: 16, top: 66),
                      padding: EdgeInsets.only(left: 16),
                      width: MediaQuery.of(context).size.width,
                      height: 56,
                      decoration: BoxDecoration(
                        color: AppTheme.DARK_GRAY,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Center(
                        child: TextFormField(
                          keyboardType: TextInputType.text,
                          controller: _controllerName,
                          style: TextStyle(
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.normal,
                            fontSize: 16,
                            color: AppTheme.GRAY,
                          ),
                          decoration: InputDecoration(
                            icon: SvgPicture.asset("assets/icons/profile.svg"),
                            hintText: "Ваше имя",
                            hintStyle: TextStyle(
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.normal,
                              fontSize: 16,
                              color: AppTheme.GRAY,
                            ),
                            labelStyle: TextStyle(
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.normal,
                              fontSize: 16,
                              color: AppTheme.GRAY,
                            ),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 16, right: 16, top: 16),
                      padding: EdgeInsets.only(left: 16),
                      width: MediaQuery.of(context).size.width,
                      height: 56,
                      decoration: BoxDecoration(
                        color: AppTheme.DARK_GRAY,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Center(
                        child: TextFormField(
                          keyboardType: TextInputType.phone,
                          controller: _controllerPhoneNumber,
                          style: TextStyle(
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.normal,
                            fontSize: 16,
                            color: AppTheme.GRAY,
                          ),
                          decoration: InputDecoration(
                            icon: SvgPicture.asset("assets/icons/call.svg"),
                            hintText: "Номер телефона",
                            hintStyle: TextStyle(
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.normal,
                              fontSize: 16,
                              color: AppTheme.GRAY,
                            ),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 16, right: 16, top: 16),
                      padding: EdgeInsets.only(left: 16, right: 8),
                      width: MediaQuery.of(context).size.width,
                      height: 56,
                      decoration: BoxDecoration(
                        color: AppTheme.DARK_GRAY,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Center(
                        child: TextFormField(
                          keyboardType: TextInputType.text,
                          obscureText: _obscureText1,
                          controller: _controllerPassword,
                          style: TextStyle(
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.normal,
                            fontSize: 16,
                            color: AppTheme.GRAY,
                          ),
                          decoration: InputDecoration(
                              icon: SvgPicture.asset("assets/icons/lock.svg"),
                              hintText: "Пароль",
                              hintStyle: TextStyle(
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.normal,
                                fontSize: 16,
                                color: AppTheme.GRAY,
                              ),
                              border: InputBorder.none,
                              suffixIcon: _obscureText1
                                  ? GestureDetector(
                                      onTap: _toogle1,
                                      child: Icon(
                                        Icons.visibility_off,
                                        color: AppTheme.GRAY5A,
                                      ),
                                    )
                                  : GestureDetector(
                                      onTap: _toogle1,
                                      child: Icon(
                                        Icons.visibility,
                                        color: AppTheme.GRAY5A,
                                      ),
                                    )),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 16, right: 16, top: 16),
                      padding: EdgeInsets.only(left: 16, right: 8),
                      width: MediaQuery.of(context).size.width,
                      height: 56,
                      decoration: BoxDecoration(
                        color: AppTheme.DARK_GRAY,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Center(
                        child: TextFormField(
                          keyboardType: TextInputType.text,
                          obscureText: _obscureText2,
                          controller: _controllerPasswordAgain,
                          style: TextStyle(
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.normal,
                            fontSize: 16,
                            color: AppTheme.GRAY,
                          ),
                          decoration: InputDecoration(
                              icon: SvgPicture.asset("assets/icons/lock.svg"),
                              hintText: "Повторите пароль",
                              hintStyle: TextStyle(
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.normal,
                                fontSize: 16,
                                color: AppTheme.GRAY,
                              ),
                              border: InputBorder.none,
                              suffixIcon: _obscureText2
                                  ? GestureDetector(
                                      onTap: _toogle2,
                                      child: Icon(
                                        Icons.visibility_off,
                                        color: AppTheme.GRAY5A,
                                      ),
                                    )
                                  : GestureDetector(
                                      onTap: _toogle2,
                                      child: Icon(
                                        Icons.visibility,
                                        color: AppTheme.GRAY5A,
                                      ),
                                    )),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        _sendData(
                            _controllerName.text,
                            _controllerPhoneNumber.text,
                            _controllerPassword.text,
                            _controllerPasswordAgain.text);
                      },
                      child: Container(
                        margin: EdgeInsets.only(top: 35, right: 16, left: 16),
                        width: MediaQuery.of(context).size.width,
                        height: 56,
                        decoration: BoxDecoration(
                          color: AppTheme.GREEN,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Center(
                          child: Text(
                            "Зарегистрироваться",
                            style: TextStyle(
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w800,
                              fontSize: 16,
                              color: AppTheme.WHITE,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 32,
                    ),
                    // Spacer(),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.only(top: 32),
                      height: 90,
                      color: AppTheme.BLACK,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Уже есть аккаунт? ",
                            style: TextStyle(
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: AppTheme.GRAY82,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushReplacement(context,
                                  MaterialPageRoute(builder: (context) {
                                return LoginScreen();
                              }));
                            },
                            child: Text(
                              "Войти",
                              style: TextStyle(
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                color: AppTheme.GREEN,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ));
  }

  Future<void> _sendData(
    String fullName,
    String phone,
    String password,
    String conPassword,
  ) async {
    var data = await InGameRepository.registerApi(
      password,
      fullName,
      phone,
      conPassword,
    );

    if (data.success) {
      print("Success boldi");
      RegistrationModel result = RegistrationModel.fromJson(data.result);
      if (result.status == 1) {
        print("status 1 boldi");
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) {
              return PinPutTest(
                phone: phone,
                password: password,
              );
            },
          ),
        );
      } else {
        CenterDialog.showErrorDialog(context, "ERROR!", "${result.msg}");
        print("amalga oshmadi");
        print([result.msg]);
      }
    } else {
      print("Something went wrong");
    }
  }
}
