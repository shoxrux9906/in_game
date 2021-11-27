import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:in_game/src/ui/main_screen.dart';
import 'package:in_game/src/utils/app_theme.dart';
import 'package:http/http.dart' as http;
import 'package:in_game/src/inGameRepository/in_game_repository.dart';
import 'package:in_game/src/models/http_result.dart';
import 'package:in_game/src/models/login_model.dart';
import 'package:in_game/src/ui/auth/registration/registration_screen.dart';
import 'package:in_game/src/ui/home/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _controllerLogin = TextEditingController();
  TextEditingController _controllerPassword = TextEditingController();
  bool _checkedValue = false;
  bool _isLoading = false;
  bool _obscureText = true;

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
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
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(top: 14),
            decoration: BoxDecoration(
              color: AppTheme.DARK,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(32),
                topLeft: Radius.circular(32),
              ),
            ),
            child: ListView(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 26, left: 16, right: 16),
                  child: Center(
                    child: Text(
                      "Вход в аккаунт",
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
                      keyboardType: TextInputType.phone,
                      style: TextStyle(color: AppTheme.GRAY),
                      controller: _controllerLogin,
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
                  padding: EdgeInsets.only(
                    left: 16,
                    right: 8,
                  ),
                  width: MediaQuery.of(context).size.width,
                  height: 56,
                  decoration: BoxDecoration(
                    color: AppTheme.DARK_GRAY,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Center(
                    child: TextFormField(
                      validator: (val) =>
                      val!.length < 8 ? "Password too short" : null,
                      keyboardType: TextInputType.text,
                      style: TextStyle(color: AppTheme.GRAY),
                      controller: _controllerPassword,
                      obscureText: _obscureText,
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
                        suffixIcon: _obscureText
                            ? GestureDetector(
                                onTap: _toggle,
                                child: Icon(
                                  Icons.visibility_off,
                                  color: AppTheme.GRAY5A,
                                ),
                              )
                            : GestureDetector(
                                onTap: _toggle,
                                child: Icon(
                                  Icons.visibility,
                                  color: AppTheme.GRAY5A,
                                ),
                              ),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 16),
                  width: MediaQuery.of(context).size.width,
                  // height: 56,
                  child: Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          child: CheckboxListTile(
                            title: Text(
                              "Запомнить вход",
                              style: TextStyle(
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.normal,
                                fontSize: 14,
                                color: AppTheme.GRAY,
                              ),
                            ),
                            value: _checkedValue,
                            checkColor: AppTheme.DARK,
                            selectedTileColor: AppTheme.GREEN,
                            // tileColor: AppTheme.GREEN,
                            activeColor: AppTheme.GREEN,
                            onChanged: (newValue) {
                              setState(
                                () {
                                  _checkedValue = newValue!;
                                },
                              );
                            },
                            controlAffinity: ListTileControlAffinity.leading,
                          ),
                        ),
                        Text(
                          "Забыли пароль?",
                          style: TextStyle(
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.normal,
                            fontSize: 14,
                            color: AppTheme.GRAY,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    print("################");
                    setState(() {
                      _isLoading = true;
                    });
                    _sendData(_controllerLogin.text, _controllerPassword.text);
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
                      child: _isLoading
                          ? CircularProgressIndicator()
                          : Text(
                              "Войти",
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
                Center(
                  child: Text(
                    "или войти через",
                    style: TextStyle(
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: AppTheme.GRAY82,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: 32,
                    left: 16,
                    right: 16,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      EnterSelect(
                        image: "assets/images/google.png",
                        name: "Google",
                        isWhite: true,
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      EnterSelect(
                        image: "assets/images/telegram.png",
                        name: "Telegram",
                        isWhite: false,
                      )
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.only(top: 90),
                  height: 90,
                  color: AppTheme.BLACK,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Нет аккаунта? ",
                        style: TextStyle(
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: AppTheme.GRAY82,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return RegistrationScreen();
                              },
                            ),
                          );
                        },
                        child: Text(
                          "Зарегистрироваться",
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
        ],
      ),
    );
  }

  Future<void> _sendData(String login, String password) async {
    HttpResult data = await InGameRepository.loginApi(
      login,
      password,
    );
    print("*********************");

    if (data.success) {
      print("salom");
      LoginModel result = LoginModel.fromJson(data.result);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      print("data.success");
      print(data.result);
      if (result.status == 1) {
        print("Hi!!");
        print("result.status == 1");
        print(data.result);
        prefs.setString("token", result.token);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) {
            return MainScreen();
          }),
        );
        setState(() {
          _isLoading = false;
        });
      } else {
        setState(() {
          _isLoading = false;
        });
        print(result.msg);
        print("*********************");
      }
    } else {
      setState(() {
        _isLoading = false;
      });
      print("*********************");
      print("Something went wrong");
    }
  }
}

class EnterSelect extends StatelessWidget {
  final String image;
  final String name;
  final bool isWhite;

  EnterSelect({
    required this.image,
    required this.name,
    required this.isWhite,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(8),
        height: 48,
        decoration: BoxDecoration(
          color: isWhite ? AppTheme.WHITE : AppTheme.BLUE,
          borderRadius: BorderRadius.circular(34),
        ),
        child: Row(
          children: [
            Image.asset(
              "${image}",
              width: 32,
              height: 32,
            ),
            Spacer(),
            Text(
              "$name",
              style: TextStyle(
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: isWhite ? AppTheme.BLACK : AppTheme.WHITE,
              ),
            ),
            Spacer(),
            SizedBox(
              width: 32,
            ),
          ],
        ),
      ),
    );
  }
}
