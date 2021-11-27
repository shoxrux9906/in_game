import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:in_game/src/block/home_block.dart';
import 'package:in_game/src/models/api/club_model.dart';
import 'package:in_game/src/utils/app_theme.dart';

class ListOfClubs extends StatefulWidget {
  const ListOfClubs({Key? key}) : super(key: key);

  @override
  _ListOfClubsState createState() => _ListOfClubsState();
}

class _ListOfClubsState extends State<ListOfClubs> {
  bool isChecked = false;
  int _index = -1;
  String valueGroup = "";

  @override
  void initState() {
    homeBlock.getClubInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.BLACK,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppTheme.BLACK,
        leading: GestureDetector(
          onTap: (){
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
          "Список клубов",
          style: TextStyle(
            fontFamily: AppTheme.fontFamilyManrope,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.normal,
            fontSize: 16,
            height: 22 / 16,
            color: AppTheme.WHITE,
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 0, horizontal: 18),
            height: 56,
            margin: EdgeInsets.only(top: 16, right: 16, left: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: AppTheme.DARK,
            ),
            child: Row(
              children: [
                SvgPicture.asset(
                  "assets/icons/search.svg",
                  width: 24,
                  height: 24,
                ),
                SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Поиск футбольных клубов",
                      hintStyle: TextStyle(
                        fontFamily: AppTheme.fontFamilyManrope,
                        fontWeight: FontWeight.normal,
                        fontStyle: FontStyle.normal,
                        fontSize: 16,
                        height: 1.5,
                        color: AppTheme.GRAY,
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: StreamBuilder(
              stream: homeBlock.getClub,
              builder: (context, AsyncSnapshot<FootBalClubModel> snapshot) {
                if (snapshot.hasData) {
                  return Container(
                    padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: snapshot.data!.results.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                valueGroup = snapshot.data!.results[index].name;
                                _index = index;
                                setState(() {
                                  isChecked = !isChecked;
                                });
                              },
                              child: Container(
                                height: 48,
                                child: Row(
                                  children: [
                                    CachedNetworkImage(
                                      imageUrl: snapshot.data!.results[index].image,
                                      width: 32,
                                      height: 32,
                                    ),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Text(
                                      snapshot.data!.results[index].name,
                                      style: TextStyle(
                                        fontFamily: AppTheme.fontFamilyRoboto,
                                        fontWeight: FontWeight.normal,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 16,
                                        height: 1.5,
                                        color: AppTheme.WHITE,
                                      ),
                                    ),
                                    Spacer(),
                                    Container(
                                      child: Radio(
                                        activeColor: AppTheme.GREEN,
                                        fillColor: MaterialStateColor.resolveWith((states) => AppTheme.GRAY),
                                        value: snapshot.data!.results[index].name,
                                        groupValue: valueGroup,
                                        onChanged: (String? value) {
                                          setState(() {
                                            valueGroup = value!;
                                          });
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Divider(
                              height: 1,
                              color: AppTheme.DARK,
                            )
                          ],
                        );
                      },
                    ),
                  );
                } else if (snapshot.hasError) {
                  throw Exception("Something went wrong");
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            margin: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
            width: MediaQuery.of(context).size.width,
            height: 48,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: AppTheme.GREEN,
            ),
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
  }
}
