import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:in_game/src/block/home_block.dart';
import 'package:in_game/src/models/api/game_end_model.dart';
import 'package:in_game/src/models/api/profile_model.dart';
import 'package:in_game/src/ui/home/edit_data.dart';
import 'package:in_game/src/ui/home/last_games.dart';
import 'package:in_game/src/ui/home/settings_screen.dart';
import 'package:in_game/src/utils/app_theme.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shimmer/shimmer.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeScreenState();
  }
}

class HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    homeBlock.getMe();
    homeBlock.getClubInfo();
    homeBlock.getGameEndInfo();
    print("****${homeBlock.getGameEnd}****");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.BLACK,
      body: SafeArea(
        child: CustomScrollView(
          slivers: <Widget>[
            SliverPersistentHeader(
              pinned: true,
              floating: true,
              delegate: CustomSliverDelegate(
                expandedHeight: 120,
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        StreamBuilder(
                            stream: homeBlock.getProfile,
                            builder: (context,
                                AsyncSnapshot<ProfileModel> snapshot) {
                              if (snapshot.hasData) {
                                return Column(
                                  children: [
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(top: 3),
                                          width: 6,
                                          height: 6,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            color: AppTheme.GREEN,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 4,
                                        ),
                                        Text(
                                          "онлайн",
                                          style: TextStyle(
                                            fontFamily:
                                                AppTheme.fontFamilyManrope,
                                            fontWeight: FontWeight.w500,
                                            fontStyle: FontStyle.normal,
                                            fontSize: 12,
                                            height: 16.5 / 12,
                                            color: AppTheme.GREEN,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Text(
                                      snapshot.data!.data.fullName,
                                      style: TextStyle(
                                        fontFamily: AppTheme.fontFamilyManrope,
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 24,
                                        height: 33 / 24,
                                        color: AppTheme.WHITE,
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          snapshot.data!.data.age.toString(),
                                          style: TextStyle(
                                            fontFamily:
                                                AppTheme.fontFamilyManrope,
                                            fontWeight: FontWeight.normal,
                                            fontStyle: FontStyle.normal,
                                            fontSize: 16,
                                            height: 1.4,
                                            color: AppTheme.GRAY,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 8,
                                        ),
                                        Container(
                                          width: 6,
                                          height: 6,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            color: AppTheme.GRAYC4,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 8,
                                        ),
                                        Text(
                                          snapshot.data!.data.region.name,
                                          style: TextStyle(
                                            fontFamily:
                                                AppTheme.fontFamilyManrope,
                                            fontWeight: FontWeight.w500,
                                            fontStyle: FontStyle.normal,
                                            fontSize: 16,
                                            height: 1.4,
                                            color: AppTheme.GRAY,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(
                                          top: 16, left: 16, right: 16),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(16),
                                          bottomRight: Radius.circular(16),
                                          topLeft: Radius.circular(64),
                                          bottomLeft: Radius.circular(64),
                                        ),
                                        color: AppTheme.DARK,
                                      ),
                                      width: MediaQuery.of(context).size.width,
                                      height: 114,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(left: 13),
                                            width: 88,
                                            height: 88,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(88),
                                              color: AppTheme.DARK_GRAY,
                                            ),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  "${snapshot.data!.data.victory}%",
                                                  style: TextStyle(
                                                    fontFamily: AppTheme
                                                        .fontFamilyManrope,
                                                    fontWeight: FontWeight.bold,
                                                    fontStyle: FontStyle.normal,
                                                    fontSize: 24,
                                                    height: 33 / 24,
                                                    color: AppTheme.WHITE,
                                                  ),
                                                ),
                                                Text(
                                                  "Побед%",
                                                  style: TextStyle(
                                                    fontFamily: AppTheme
                                                        .fontFamilyManrope,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    fontStyle: FontStyle.normal,
                                                    fontSize: 16,
                                                    height: 1.4,
                                                    color: AppTheme.GRAY,
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            width: 8,
                                          ),
                                          Container(
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  children: [
                                                    _imageBall(),
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        _textTitle(
                                                            "${snapshot.data!.data.positions.goalkeeper}%"),
                                                        _textDesc("Вратарем")
                                                      ],
                                                    )
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    _imageBall(),
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        _textTitle(
                                                            "${snapshot.data!.data.positions.midfielder}%"),
                                                        _textDesc("Полузащит.")
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            width: 14,
                                          ),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  _imageBall(),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      _textTitle(
                                                          "${snapshot.data!.data.positions.forward}%"),
                                                      _textDesc("Нападающим")
                                                    ],
                                                  )
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  _imageBall(),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      _textTitle(
                                                          "${snapshot.data!.data.positions.defender}%"),
                                                      _textDesc("Защитником")
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Container(
                                            margin: EdgeInsets.only(
                                                top: 16, left: 16),
                                            width: 104,
                                            height: 158,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(52),
                                              color: AppTheme.DARK,
                                            ),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Container(
                                                  padding: EdgeInsets.all(16),
                                                  width: 64,
                                                  height: 64,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            64),
                                                    color: AppTheme.TURQOISE
                                                        .withOpacity(0.3),
                                                  ),
                                                  child: Image.asset(
                                                    "assets/images/endurance.png",
                                                    width: 28,
                                                    height: 28,
                                                    fit: BoxFit.fill,
                                                  ),
                                                ),
                                                _textTitle2(
                                                    "${(snapshot.data!.data.gameTime / 60).toInt()}ч.${snapshot.data!.data.gameTime % 60}м."),
                                                _textDesc("время в игре"),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Container(
                                            margin: EdgeInsets.only(
                                                top: 16, left: 16),
                                            width: 104,
                                            height: 158,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(52),
                                              color: AppTheme.DARK,
                                            ),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Container(
                                                  padding: EdgeInsets.all(16),
                                                  width: 64,
                                                  height: 64,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            64),
                                                    color: AppTheme.BLUE2
                                                        .withOpacity(0.3),
                                                  ),
                                                  child: Image.asset(
                                                    "assets/images/more.png",
                                                    width: 28,
                                                    height: 28,
                                                    fit: BoxFit.scaleDown,
                                                  ),
                                                ),
                                                _textTitle2(
                                                    "${snapshot.data!.data.ball}"),
                                                _textDesc("очков"),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Container(
                                            margin: EdgeInsets.only(
                                                top: 16, left: 16),
                                            width: 104,
                                            height: 158,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(52),
                                              color: AppTheme.DARK,
                                            ),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Container(
                                                  padding: EdgeInsets.all(16),
                                                  width: 64,
                                                  height: 64,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            64),
                                                    color: AppTheme.PINK
                                                        .withOpacity(0.3),
                                                  ),
                                                  child: Image.asset(
                                                    "assets/images/muscle.png",
                                                    width: 28,
                                                    height: 28,
                                                    scale: 1,
                                                    fit: BoxFit.scaleDown,
                                                  ),
                                                ),
                                                _textTitle2(
                                                    "${snapshot.data!.data.division}"),
                                                _textDesc("дивизион"),
                                              ],
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 16,
                                        ),
                                      ],
                                    ),
                                  ],
                                );
                              } else if (snapshot.hasError) {
                                throw Exception("Something went wrong");
                              } else {
                                return Center(
                                  child: Padding(
                                    padding: const EdgeInsets.all(24.0),
                                    child: CircularProgressIndicator(),
                                  ),
                                );
                              }
                            }),
                        Container(
                          margin: EdgeInsets.only(top: 24, right: 16, left: 16),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: _textTypes("Прошедшие игры"),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return LastGamesScreen();
                                      },
                                    ),
                                  );
                                },
                                child: _textTypes("Все игры"),
                              ),
                              SvgPicture.asset("assets/icons/arr_right.svg"),
                            ],
                          ),
                        ),
                        Container(
                          height: 242,
                          child: StreamBuilder(
                            stream: homeBlock.getGameEnd,
                            builder: (BuildContext context,
                                AsyncSnapshot<GameEndModel> snapshot) {
                              if (snapshot.hasData) {
                                return ListView.builder(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemCount: snapshot.data!.results.length,
                                  itemBuilder: (context, index) {
                                    return Container(
                                      decoration: BoxDecoration(
                                        color: AppTheme.DARK,
                                        borderRadius: BorderRadius.circular(16),
                                      ),
                                      padding: EdgeInsets.only(
                                          top: 20,
                                          right: 16,
                                          left: 16,
                                          bottom: 32),
                                      margin:
                                          EdgeInsets.only(top: 16, left: 16),
                                      width: 277,
                                      height: 242,
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              Column(
                                                children: [
                                                  CachedNetworkImage(
                                                    imageUrl: snapshot
                                                        .data!
                                                        .results[index]
                                                        .gameClub[0]
                                                        .footballClub
                                                        .image,
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
                                                      fontFamily: AppTheme
                                                          .fontFamilyManrope,
                                                      fontStyle:
                                                          FontStyle.normal,
                                                      fontWeight:
                                                          FontWeight.w700,
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
                                                    padding: EdgeInsets.only(
                                                        top: 12),
                                                    height: 42,
                                                    child: Row(
                                                      children: [
                                                        Text(
                                                          "${snapshot.data!.results[index].gameClub[0].goal}",
                                                          style: TextStyle(
                                                            fontFamily: AppTheme
                                                                .fontFamilyManrope,
                                                            fontStyle: FontStyle
                                                                .normal,
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            fontSize: 32,
                                                            height: 43 / 132,
                                                            color:
                                                                AppTheme.WHITE,
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: 8,
                                                        ),
                                                        Text(
                                                          ":",
                                                          style: TextStyle(
                                                            fontFamily: AppTheme
                                                                .fontFamilyManrope,
                                                            fontStyle: FontStyle
                                                                .normal,
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            fontSize: 32,
                                                            height: 43 / 132,
                                                            color:
                                                                AppTheme.WHITE,
                                                          ),
                                                        ),
                                                        Text(
                                                          "${snapshot.data!.results[index].gameClub[0].goal}",
                                                          style: TextStyle(
                                                            fontFamily: AppTheme
                                                                .fontFamilyManrope,
                                                            fontStyle: FontStyle
                                                                .normal,
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            fontSize: 32,
                                                            height: 43 / 132,
                                                            color:
                                                                AppTheme.WHITE,
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
                                                      fontFamily: AppTheme
                                                          .fontFamilyManrope,
                                                      fontStyle:
                                                          FontStyle.normal,
                                                      fontWeight:
                                                          FontWeight.w400,
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
                                                    imageUrl: snapshot
                                                        .data!
                                                        .results[index]
                                                        .gameClub[1]
                                                        .footballClub
                                                        .image,
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
                                                      fontFamily: AppTheme
                                                          .fontFamilyManrope,
                                                      fontStyle:
                                                          FontStyle.normal,
                                                      fontWeight:
                                                          FontWeight.w700,
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
                                              height: 48,
                                              child: ListView.builder(
                                                  shrinkWrap: true,
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  itemCount: 10,
                                                  itemBuilder: (_, index) {
                                                    return Container(
                                                      margin: EdgeInsets.only(
                                                          right: 8),
                                                      decoration: BoxDecoration(
                                                          color: AppTheme.BLACK,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8)),
                                                      width: 60,
                                                      height: 48,
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
                                              fontFamily:
                                                  AppTheme.fontFamilyManrope,
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
                                );
                              } else if (snapshot.hasError) {
                                throw Exception("Something went wrong");
                              } else {
                                return Shimmer.fromColors(
                                  child: Container(
                                    child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: 10,
                                      itemBuilder: (context, index) {
                                        return Container(
                                          margin: EdgeInsets.only(
                                            left: 16,
                                            top: 16,
                                          ),
                                          height: 242,
                                          width: 277,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(16),
                                            color: AppTheme.GRAY,
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                  baseColor: AppTheme.GRAY.withOpacity(0.5),
                                  highlightColor:
                                      AppTheme.WHITE.withOpacity(0.3),
                                );
                              }
                            },
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 24, right: 16, left: 16),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: _textTypes("Отзывы о вас"),
                              ),
                              _textTypes("Все отзывы"),
                              SvgPicture.asset("assets/icons/arr_right.svg"),
                            ],
                          ),
                        ),
                        Container(
                          height: 210,
                          child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: 10,
                            itemBuilder: (context, index) {
                              return Container(
                                margin: EdgeInsets.only(top: 16, left: 16),
                                width: 325,
                                height: 210,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  color: AppTheme.DARK,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          child: Stack(
                                            children: [
                                              Image.asset(
                                                "assets/images/profimg.png",
                                                width: 48,
                                                height: 48,
                                              ),
                                              Container(
                                                margin: EdgeInsets.only(
                                                    top: 28, left: 32),
                                                width: 18,
                                                height: 18,
                                                decoration: BoxDecoration(
                                                    color: AppTheme.YELLOW,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            18),
                                                    border: Border.all(
                                                      color: AppTheme.BLACK,
                                                      width: 1.5,
                                                    )),
                                                child: Center(
                                                  child: Text(
                                                    "A",
                                                    style: TextStyle(
                                                      fontFamily: AppTheme
                                                          .fontFamilyManrope,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontStyle:
                                                          FontStyle.normal,
                                                      fontSize: 12,
                                                      height: 16 / 12,
                                                      color: AppTheme.BLACK,
                                                    ),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                          margin: EdgeInsets.only(
                                              top: 20, left: 16),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(
                                              top: 20, left: 12),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Шахзод Камаров",
                                                style: TextStyle(
                                                  fontFamily: AppTheme
                                                      .fontFamilyManrope,
                                                  fontWeight: FontWeight.w500,
                                                  fontStyle: FontStyle.normal,
                                                  fontSize: 16,
                                                  height: 1.5,
                                                  color: AppTheme.WHITE,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 4,
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    "23 года",
                                                    style: TextStyle(
                                                      fontFamily: AppTheme
                                                          .fontFamilyManrope,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      fontStyle:
                                                          FontStyle.normal,
                                                      fontSize: 12,
                                                      height: 1.4,
                                                      color: AppTheme.GRAY,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 8,
                                                  ),
                                                  Container(
                                                    width: 4,
                                                    height: 4,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                      color: AppTheme.GRAYC4,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 8,
                                                  ),
                                                  Text(
                                                    "Ташкент",
                                                    style: TextStyle(
                                                      fontFamily: AppTheme
                                                          .fontFamilyManrope,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      fontStyle:
                                                          FontStyle.normal,
                                                      fontSize: 12,
                                                      height: 1.4,
                                                      color: AppTheme.GRAY,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                    Container(
                                      margin: EdgeInsets.all(16),
                                      child: Text(
                                        "По своей сути рыбатекст является альтернативой традиционному "
                                        "lorem ipsum, который вызывает у некторых людей недоумение "
                                        "при попытках прочитать рыбу текст.",
                                        style: TextStyle(
                                          fontFamily:
                                              AppTheme.fontFamilyManrope,
                                          fontWeight: FontWeight.normal,
                                          fontStyle: FontStyle.normal,
                                          fontSize: 14,
                                          height: 1.6,
                                          color: AppTheme.GRAY,
                                        ),
                                        maxLines: 4,
                                        overflow: TextOverflow.clip,
                                      ),
                                    )
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                        SizedBox(
                          height: 100,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _textSchyot(String title) {
  return Text(
    title,
    style: TextStyle(
      fontFamily: AppTheme.fontFamilyManrope,
      fontWeight: FontWeight.w600,
      fontStyle: FontStyle.normal,
      fontSize: 32,
      height: 44 / 32,
      color: AppTheme.WHITE,
    ),
  );
}

Widget _textTypes(String title) {
  return Text(
    title,
    style: TextStyle(
      fontFamily: AppTheme.fontFamilyManrope,
      fontWeight: FontWeight.w600,
      fontStyle: FontStyle.normal,
      fontSize: 16,
      height: 1.4,
      color: AppTheme.WHITE,
    ),
  );
}

Widget _textTitle2(String title) {
  return Padding(
    padding: const EdgeInsets.all(4.0),
    child: Text(
      title,
      style: TextStyle(
        fontFamily: AppTheme.fontFamilyManrope,
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.normal,
        fontSize: 18,
        height: 1.4,
        color: AppTheme.WHITE,
      ),
      overflow: TextOverflow.ellipsis,
    ),
  );
}

Widget _imageBall() {
  return Image.asset(
    "assets/images/ball.png",
    width: 16,
    height: 16,
  );
}

Widget _textTitle(String title) {
  return Text(
    title,
    style: TextStyle(
      fontFamily: AppTheme.fontFamilyManrope,
      fontWeight: FontWeight.w700,
      fontStyle: FontStyle.normal,
      fontSize: 16,
      height: 22 / 16,
      color: AppTheme.WHITE,
    ),
  );
}

Widget _textDesc(String title) {
  return Text(
    title,
    style: TextStyle(
      fontFamily: AppTheme.fontFamilyManrope,
      fontWeight: FontWeight.normal,
      fontStyle: FontStyle.normal,
      fontSize: 12,
      height: 16 / 12,
      color: AppTheme.GRAY,
    ),
  );
}

class CustomSliverDelegate extends SliverPersistentHeaderDelegate {
  final double expandedHeight;
  final bool hideTitleWhenExpanded;

  CustomSliverDelegate({
    required this.expandedHeight,
    this.hideTitleWhenExpanded = true,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final appBarSize = expandedHeight - shrinkOffset;
    final cardTopPosition = expandedHeight / 2 - shrinkOffset;
    final proportion = 2 - (expandedHeight / appBarSize);
    final percent = proportion < 0 || proportion > 1 ? 0.0 : proportion;
    return SizedBox(
      height: expandedHeight + expandedHeight / 2,
      child: Stack(
        children: [
          SizedBox(
            height: appBarSize < kToolbarHeight ? kToolbarHeight : appBarSize,
            child: appBarSize < kToolbarHeight
                ? AppBar(
                    backgroundColor: AppTheme.DARK,
                    elevation: 0.0,
                    title: Opacity(
                      opacity: hideTitleWhenExpanded ? 1.0 - percent : 1.0,
                      child: Text("Shoxrux Quroqov"),
                    ),
                  )
                : AppBar(
                    backgroundColor: AppTheme.BLACK,
                    actions: [
                      SizedBox(
                        width: 16,
                      ),
                    ],
                    elevation: 0.0,
                    title: Opacity(
                      opacity: hideTitleWhenExpanded ? 1.0 - percent : 1.0,
                      child: Text("Shoxrux Quroqov"),
                    ),
                    flexibleSpace: Container(
                      decoration: BoxDecoration(
                        color: AppTheme.DARK,
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(32),
                          bottomLeft: Radius.circular(32),
                        ),
                      ),
                    ),
                  ),
          ),
          Positioned(
            left: 0.0,
            right: 0.0,
            top: cardTopPosition > 0 ? cardTopPosition : 0,
            bottom: 0.0,
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return EditData();
                      }),
                    );
                  },
                  child: Container(
                    width: 40,
                    height: 48,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SvgPicture.asset(
                        "assets/icons/edit.svg",
                        width: 20,
                        height: 20,
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                    margin: EdgeInsets.only(
                      bottom: appBarSize < kToolbarHeight ? 0 : 50,
                      left: 16,
                    ),
                  ),
                ),
                Spacer(),
                Opacity(
                  opacity: percent,
                  child: Image.asset("assets/images/playerimg.png"),
                ),
                Spacer(),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return SettingsScreen();
                      }),
                    );
                  },
                  child: Container(
                    width: 40,
                    height: 48,
                    margin: EdgeInsets.only(
                      bottom: appBarSize < kToolbarHeight ? 0 : 50,
                      right: 16,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SvgPicture.asset(
                        "assets/icons/setting.svg",
                        width: 20,
                        height: 20,
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<File> _getLocalFile(String fileName) async {
    String dir = (await getApplicationDocumentsDirectory()).path;
    File f = new File("$dir$fileName");
    return f;
  }

  @override
  double get maxExtent => expandedHeight + expandedHeight / 2;

  @override
  double get minExtent => kToolbarHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
