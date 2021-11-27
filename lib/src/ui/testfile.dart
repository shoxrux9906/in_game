import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:in_game/src/utils/app_theme.dart';

class CustomRadio extends StatefulWidget {
  @override
  createState() {
    return CustomRadioState();
  }
}

class CustomRadioState extends State<CustomRadio> {
  List<RadioModel> sampleData = [];

  @override
  void initState() {
// TODO: implement initState
    super.initState();
    sampleData.add(RadioModel(false, 'A'));
    sampleData.add(RadioModel(false, 'B'));
    sampleData.add(RadioModel(false, 'C'));
    sampleData.add(RadioModel(false, 'D'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ListItem"),
      ),
      body: ListView.builder(
        itemCount: sampleData.length,
        itemBuilder: (BuildContext context, int index) {
          return RadioItem(sampleData[index]);
        },
      ),
    );
  }
}

class RadioItem extends StatelessWidget {
  final RadioModel _item;

  RadioItem(this._item);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Container(
        height: 100.0,
        width: 10.0,
        decoration: BoxDecoration(
          color: AppTheme.RED,
          border: Border.all(color: AppTheme.RED, width: 2)
        ),
        child: Container(
          margin: EdgeInsets.only(left: 10.0),
          width: 50,
          height: 50,
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: AppTheme.BLACK,
            borderRadius: BorderRadius.circular(100),
          ),
        ),
      ),
    );
  }
}

class RadioModel {
  bool isSelected;
  final String text;

  RadioModel(this.isSelected, this.text);
}
