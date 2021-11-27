import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:in_game/src/block/home_block.dart';
import 'package:in_game/src/models/api/game_end_model.dart';
import 'package:in_game/src/utils/app_theme.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';

class LastGamesScreen extends StatefulWidget {
  const LastGamesScreen({Key? key}) : super(key: key);

  @override
  _LastGamesScreenState createState() => _LastGamesScreenState();
}

class _LastGamesScreenState extends State<LastGamesScreen> {
  @override
  void initState() {
    homeBlock.getGameEndInfo();
    print(homeBlock.getGameEndInfo());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppTheme.BLACK,
        leading: GestureDetector(
          onTap: (){
            Navigator.pop(context);
          },
          child: Container(
            padding: EdgeInsets.all(16),
            child: SvgPicture.asset("assets/icons/arrow_right.svg"),
          ),
        ),
        title: Text(
          "Прошедшие игры",
          style: TextStyle(
            fontFamily: AppTheme.fontFamilyManrope,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w700,
            fontSize: 16,
            height: 22 / 16,
            color: AppTheme.WHITE,
          ),
        ),
      ),
      body: Container(
        color: AppTheme.BLACK,
        child: StreamBuilder(
          stream: homeBlock.getGameEnd,
          builder:
              (BuildContext context, AsyncSnapshot<GameEndModel> snapshot) {
            if (snapshot.hasData) {
              print("HasData!!!");
              return Container(
                child: ListView.builder(
                  itemCount: snapshot.data!.results.length,
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        color: AppTheme.DARK,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      padding: EdgeInsets.only(
                          top: 20, right: 16, left: 16, bottom: 32),
                      margin: EdgeInsets.only(top: 16, left: 16, right: 16),
                      width: MediaQuery.of(context).size.width,
                      height: 242,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Column(
                                children: [
                                  CachedNetworkImage(
                                    imageUrl: snapshot.data!.results[index]
                                        .gameClub[0].footballClub.image,
                                    fit: BoxFit.fill,
                                    width: 42,
                                    height: 42,
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    "${snapshot.data!.results[index].gameClub[0].footballClub.name}",
                                    style: TextStyle(
                                      fontFamily: AppTheme.fontFamilyManrope,
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 14,
                                      height: 19 / 14,
                                      color: AppTheme.WHITE,
                                    ),
                                  ),
                                ],
                              ),
                              Spacer(),
                              Column(
                                children: [
                                  Container(
                                    padding: EdgeInsets.only(top: 12),
                                    height: 42,
                                    child: Row(
                                      children: [
                                        Text(
                                          "${snapshot.data!.results[index].gameClub[0].goal}",
                                          style: TextStyle(
                                            fontFamily:
                                                AppTheme.fontFamilyManrope,
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 32,
                                            height: 43 / 132,
                                            color: AppTheme.WHITE,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 8,
                                        ),
                                        Text(
                                          ":",
                                          style: TextStyle(
                                            fontFamily:
                                                AppTheme.fontFamilyManrope,
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 32,
                                            height: 43 / 132,
                                            color: AppTheme.WHITE,
                                          ),
                                        ),
                                        Text(
                                          "${snapshot.data!.results[index].gameClub[0].goal}",
                                          style: TextStyle(
                                            fontFamily:
                                                AppTheme.fontFamilyManrope,
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 32,
                                            height: 43 / 132,
                                            color: AppTheme.WHITE,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    "${DateFormat("dd.MM.yyyy").format(snapshot.data!.results[index].endDate)}",
                                    style: TextStyle(
                                      fontFamily: AppTheme.fontFamilyManrope,
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12,
                                      height: 16 / 12,
                                      color: AppTheme.GRAY,
                                    ),
                                  ),
                                ],
                              ),
                              Spacer(),
                              Column(
                                children: [
                                  CachedNetworkImage(
                                    imageUrl: snapshot.data!.results[index]
                                        .gameClub[1].footballClub.image,
                                    fit: BoxFit.fill,
                                    width: 42,
                                    height: 42,
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    "${snapshot.data!.results[index].gameClub[1].footballClub.name}",
                                    style: TextStyle(
                                      fontFamily: AppTheme.fontFamilyManrope,
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 14,
                                      height: 19 / 14,
                                      color: AppTheme.WHITE,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          Shimmer.fromColors(
                            child: Container(
                              height: 60,
                              child: ListView.builder(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemCount: 10,
                                  itemBuilder: (_, index) {
                                    return Container(
                                      margin: EdgeInsets.only(right: 8),
                                      decoration: BoxDecoration(
                                          color: AppTheme.BLACK,
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      width: 98,
                                      height: 60,
                                    );
                                  }),
                            ),
                            baseColor: AppTheme.WHITE,
                            highlightColor: AppTheme.GRAY,
                          ),
                          SizedBox(
                            height: 28,
                          ),
                          Text(
                            "Оценить игроков",
                            style: TextStyle(
                              fontFamily: AppTheme.fontFamilyManrope,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              height: 12 / 16,
                              color: AppTheme.WHITE,
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
              );
            } else if (snapshot.hasError) {
              throw Exception("Something went wrong");
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
