import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:in_game/src/ui/home/list_of_clubs.dart';
import 'package:in_game/src/ui/home/take_picture_sreen.dart';
import 'package:in_game/src/utils/app_theme.dart';
import 'package:intl/intl.dart';

class EditData extends StatefulWidget {
  const EditData({Key? key}) : super(key: key);

  @override
  _EditDataState createState() => _EditDataState();
}

class _EditDataState extends State<EditData> {
  @override
  void initState() {
    // Cache.getData();
    print("*********${imageFile}**************");
    super.initState();
  }

  DateTime _dateTime = DateTime.now();
  DateFormat dateFormat = DateFormat("dd/MM/yyyy");
  String date = "";
  File? imageFile;

  Future<void> showChoiceDialog(BuildContext context) {
    return showCupertinoDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            title: Text(
              "Make your choice!",
              style: TextStyle(
                fontFamily:
                AppTheme.fontFamilyManrope,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w600,
                fontSize: 24,
                height: 1.4,
                color: AppTheme.BLUE,
              ),
            ),
            content: Container(
              child: Column(
                crossAxisAlignment:
                CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () async {
                      PickedFile pickedFile =
                      (await ImagePicker()
                          .getImage(
                        source: ImageSource.camera,
                        maxWidth: 1800,
                        maxHeight: 1800,
                      ))!;
                      setState(() {
                        imageFile = File(pickedFile.path);
                      });
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      "From camera",
                      style: TextStyle(
                        fontFamily: AppTheme
                            .fontFamilyManrope,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w600,
                        fontSize: 24,
                        height: 1.4,
                        color: AppTheme.WHITE,
                      ),
                    ),
                  ),
                  Divider(
                    height: 1,
                    color: AppTheme.GRAY,
                  ),
                  GestureDetector(
                    onTap: () async {
                      PickedFile pickedFile =
                      (await ImagePicker()
                          .getImage(
                        source: ImageSource.gallery,
                        maxWidth: 1800,
                        maxHeight: 1800,
                      ))!;
                      setState(() {
                        imageFile = File(pickedFile.path);
                      });
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      "From Gallery",
                      style: TextStyle(
                        fontFamily: AppTheme
                            .fontFamilyManrope,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w600,
                        fontSize: 24,
                        height: 1.4,
                        color: AppTheme.WHITE,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

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
          child: SvgPicture.asset(
            "assets/icons/arrow_right.svg",
            width: 15,
            height: 12,
            fit: BoxFit.scaleDown,
          ),
        ),
        title: Text(
          "Изменение данных",
          style: TextStyle(
            fontFamily: AppTheme.fontFamilyManrope,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.normal,
            fontSize: 16,
            height: 2 / 16,
            color: AppTheme.WHITE,
          ),
        ),
      ),
      body: Container(
        color: AppTheme.BLACK,
        child: ListView(
          children: [
            Container(
              margin: EdgeInsets.only(top: 16, left: 16),
              child: Row(
                children: [
                  Container(
                    width: 64,
                    height: 64,
                    child: imageFile == null
                        ? Image.file(File(""))
                        : ClipRRect(
                            borderRadius: BorderRadius.circular(64),
                            child: Image.file(
                              imageFile!,
                              width: 64,
                              height: 64,
                              fit: BoxFit.cover,
                            )),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Ваше изображение",
                        style: TextStyle(
                          fontFamily: AppTheme.fontFamilyManrope,
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.normal,
                          fontSize: 14,
                          height: 1.5,
                          color: AppTheme.GRAY,
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () {
                              showChoiceDialog(context);
                            },
                            child: Text(
                              "Изменить",
                              style: TextStyle(
                                fontFamily: AppTheme.fontFamilyManrope,
                                fontWeight: FontWeight.w600,
                                fontStyle: FontStyle.normal,
                                fontSize: 14,
                                height: 1.5,
                                color: AppTheme.YELLOW,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 12,
                          ),
                          Container(
                            width: 2,
                            height: 18,
                            color: AppTheme.DARK_GRAY,
                          ),
                          SizedBox(
                            width: 12,
                          ),
                          Text(
                            "Удалить",
                            style: TextStyle(
                              fontFamily: AppTheme.fontFamilyManrope,
                              fontWeight: FontWeight.w600,
                              fontStyle: FontStyle.normal,
                              fontSize: 14,
                              height: 1.5,
                              color: AppTheme.RED,
                            ),
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
            MyWidgetTextFormField(
              top: 16.0,
              image: "assets/icons/profile.svg",
              hintText: "Аслан Муйдинов",
              isStyleBold: true,
            ),
            SizedBox(
              height: 24,
            ),
            Container(
              margin: EdgeInsets.only(right: 16, left: 16),
              width: MediaQuery.of(context).size.width,
              height: 24,
              child: Expanded(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(child: CustomCheckBox(title: "Мужчина")),
                      Expanded(child: CustomCheckBox(title: "Мужчина")),
                    ]),
              ),
            ),
            GestureDetector(
              onTap: () async {
                await showModalBottomSheet(
                  backgroundColor: AppTheme.BLACK,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                    topRight: Radius.circular(24),
                    topLeft: Radius.circular(24),
                  )),
                  context: context,
                  builder: (BuildContext context) {
                    return Container(
                      height: 350,
                      child: Column(
                        children: [
                          Container(
                            height: 300,
                            child: CupertinoTheme(
                              data: CupertinoThemeData(
                                  textTheme: CupertinoTextThemeData(
                                      dateTimePickerTextStyle: TextStyle(
                                fontFamily: AppTheme.fontFamilyHelvetica,
                                fontWeight: FontWeight.normal,
                                fontStyle: FontStyle.normal,
                                fontSize: 23,
                                height: 23 / 26,
                                color: AppTheme.WHITE,
                              ))),
                              child: CupertinoDatePicker(
                                mode: CupertinoDatePickerMode.date,
                                initialDateTime: _dateTime,
                                onDateTimeChanged: (_date) {
                                  setState(() {
                                    _dateTime = _date;
                                  });
                                },
                              ),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: 48,
                            decoration: BoxDecoration(
                                color: AppTheme.GREEN,
                                borderRadius: BorderRadius.circular(12)),
                            child: Center(
                              child: Text(
                                "Выбрать",
                                style: TextStyle(
                                  fontFamily: AppTheme.fontFamilySFPro,
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 16,
                                  height: 22 / 16,
                                  color: AppTheme.WHITE,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
              child: MyWidgetText(
                top: 24.0,
                image: "assets/icons/calendar.svg",
                text: "${dateFormat.format(_dateTime)}",
              ),
            ),
            MyWidgetTextFormField(
              top: 16.0,
              image: "assets/icons/call.svg",
              hintText: "+998 93 594 99 09",
              isStyleBold: false,
            ),
            Hide(),
            GestureDetector(
              onTap: () {},
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return ListOfClubs();
                      },
                    ),
                  );
                },
                child: MyWidgetText(
                  top: 16.0,
                  image: "assets/icons/ball.svg",
                  text: "Реал Мадрид",
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                showModalBottomSheet(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(24),
                        topLeft: Radius.circular(24),
                      ),
                    ),
                    backgroundColor: AppTheme.BLACK,
                    context: context,
                    builder: (BuildContext context) {
                      return Container(
                        height: 250,
                        padding: EdgeInsets.symmetric(
                          vertical: 20,
                          horizontal: 24,
                        ),
                        child: Expanded(
                          child: Column(
                            children: [
                              Text(
                                "Позиция в игре",
                                style: TextStyle(
                                  fontFamily: AppTheme.fontFamilyManrope,
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 16,
                                  height: 22 / 16,
                                  color: AppTheme.WHITE,
                                ),
                              ),
                              CustomCheckBox2(title: "Вратарь"),
                              CustomCheckBox2(title: "Нападающий"),
                              CustomCheckBox2(title: "Полузащитник"),
                              CustomCheckBox2(title: "Защитник"),
                              SizedBox(
                                height: 24,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width,
                                height: 48,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: AppTheme.GREEN),
                                child: Center(
                                  child: Text(
                                    "Выбрать",
                                    style: TextStyle(
                                      fontFamily: AppTheme.fontFamilySFPro,
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FontStyle.normal,
                                      fontSize: 16,
                                      height: 22 / 16,
                                      color: AppTheme.WHITE,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    });
              },
              child: MyWidgetText(
                top: 16.0,
                image: "assets/icons/shoe.svg",
                text: "Полузащитник",
              ),
            ),
            MyWidgetText(
              top: 16.0,
              image: "assets/icons/location.svg",
              text: "г. Ташкент, ул. Лабзак, дом 63",
            ),
            Hide(),
            SizedBox(
              height: 10,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 1,
              color: AppTheme.DARK,
            ),
            GestureDetector(
              onTap: (){

              },
              child: Container(
                margin: EdgeInsets.only(top: 12, left: 24, right: 24, bottom: 8),
                width: MediaQuery.of(context).size.width,
                height: 48,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: AppTheme.GREEN,
                ),
                child: Center(
                  child: Text(
                    "Сохранить изменения",
                    style: TextStyle(
                      fontFamily: AppTheme.fontFamilyManrope,
                      fontWeight: FontWeight.w600,
                      fontStyle: FontStyle.normal,
                      fontSize: 16,
                      height: 1.5,
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
}

class MyWidgetText extends StatefulWidget {
  MyWidgetText({
    required this.top,
    required this.image,
    required this.text,
  });

  final double top;
  final String image;
  final String text;

  @override
  _MyWidgetTextState createState() => _MyWidgetTextState();
}

class _MyWidgetTextState extends State<MyWidgetText> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 0, horizontal: 18),
      margin: EdgeInsets.only(top: widget.top, left: 16, right: 16),
      width: MediaQuery.of(context).size.width,
      height: 56,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: AppTheme.DARK,
      ),
      child: Row(
        children: [
          SvgPicture.asset(widget.image),
          SizedBox(
            width: 18,
          ),
          Text(
            widget.text,
            style: TextStyle(
              fontFamily: AppTheme.fontFamilyManrope,
              fontWeight: FontWeight.normal,
              fontStyle: FontStyle.normal,
              fontSize: 16,
              height: 1.5,
              color: AppTheme.GRAY,
            ),
          )
        ],
      ),
    );
  }
}

class MyWidgetTextFormField extends StatefulWidget {
  MyWidgetTextFormField({
    required this.top,
    required this.image,
    required this.hintText,
    required this.isStyleBold,
  });

  final double top;
  final String image;
  final String hintText;
  bool isStyleBold = true;

  @override
  _MyWidgetTextFormFieldState createState() => _MyWidgetTextFormFieldState();
}

class _MyWidgetTextFormFieldState extends State<MyWidgetTextFormField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 0, horizontal: 18),
      margin: EdgeInsets.only(top: widget.top, left: 16, right: 16),
      width: MediaQuery.of(context).size.width,
      height: 56,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: AppTheme.DARK,
      ),
      child: Row(
        children: [
          SvgPicture.asset(widget.image),
          SizedBox(
            width: 18,
          ),
          Expanded(
            child: TextFormField(
              style: TextStyle(
                fontFamily: AppTheme.fontFamilyManrope,
                fontWeight:
                    widget.isStyleBold ? FontWeight.w500 : FontWeight.normal,
                fontStyle: FontStyle.normal,
                fontSize: 16,
                height: 1.5,
                color: widget.isStyleBold ? AppTheme.WHITE : AppTheme.GRAY,
              ),
              decoration: InputDecoration(
                  hintText: widget.hintText,
                  hintStyle: TextStyle(
                    fontFamily: AppTheme.fontFamilyManrope,
                    fontWeight: widget.isStyleBold
                        ? FontWeight.w500
                        : FontWeight.normal,
                    fontStyle: FontStyle.normal,
                    fontSize: 16,
                    height: 1.5,
                    color: widget.isStyleBold ? AppTheme.WHITE : AppTheme.GRAY,
                  ),
                  border: InputBorder.none),
            ),
          ),
        ],
      ),
    );
  }
}

class Hide extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 8, right: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SvgPicture.asset(
            "assets/icons/hide_green.svg",
            color: AppTheme.GREEN,
            width: 16,
            height: 16,
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            "Скрыть номер",
            style: TextStyle(
              fontFamily: AppTheme.fontFamilyManrope,
              fontWeight: FontWeight.w500,
              fontStyle: FontStyle.normal,
              fontSize: 14,
              height: 1.5,
              color: AppTheme.GREEN,
            ),
          ),
        ],
      ),
    );
  }
}

class CustomCheckBox extends StatefulWidget {
  CustomCheckBox({required this.title});

  final String title;

  @override
  _CustomCheckBoxState createState() => _CustomCheckBoxState();
}

class _CustomCheckBoxState extends State<CustomCheckBox> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.BLACK,
      body: GestureDetector(
        onTap: () {
          setState(() {
            isChecked = !isChecked;
          });
        },
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              width: 16,
              height: 16,
              decoration: BoxDecoration(
                  border: Border.all(color: AppTheme.GRAY, width: 1),
                  borderRadius: BorderRadius.circular(60)),
              child: Container(
                padding: EdgeInsets.all(1.5),
                margin: EdgeInsets.all(1.5),
                width: 16,
                height: 16,
                decoration: BoxDecoration(
                  color: isChecked ? AppTheme.GREEN : AppTheme.BLACK,
                  borderRadius: BorderRadius.circular(60),
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              widget.title,
              style: TextStyle(
                fontFamily: AppTheme.fontFamilyManrope,
                fontWeight: FontWeight.normal,
                fontStyle: FontStyle.normal,
                fontSize: 16,
                height: 1.5,
                color: AppTheme.WHITE,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomCheckBox2 extends StatefulWidget {
  CustomCheckBox2({required this.title});

  final String title;

  @override
  _CustomCheckBoxState2 createState() => _CustomCheckBoxState2();
}

class _CustomCheckBoxState2 extends State<CustomCheckBox2> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: <Widget>[
            Expanded(
              child: Text(
                widget.title,
                style: TextStyle(
                  fontFamily: AppTheme.fontFamilyRoboto,
                  fontWeight: FontWeight.normal,
                  fontStyle: FontStyle.normal,
                  fontSize: 16,
                  height: 1.5,
                  color: AppTheme.WHITE,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  isChecked = !isChecked;
                });
              },
              child: Container(
                width: 16,
                height: 16,
                decoration: BoxDecoration(
                    border: Border.all(color: AppTheme.GRAY, width: 1),
                    borderRadius: BorderRadius.circular(60)),
                child: Container(
                  padding: EdgeInsets.all(1.5),
                  margin: EdgeInsets.all(1.5),
                  width: 16,
                  height: 16,
                  decoration: BoxDecoration(
                      color: isChecked ? AppTheme.GREEN : AppTheme.BLACK,
                      borderRadius: BorderRadius.circular(60)),
                ),
              ),
            ),
          ],
        ),
        Divider(
          height: 2,
          color: AppTheme.DARK,
        )
      ],
    );
  }
}
