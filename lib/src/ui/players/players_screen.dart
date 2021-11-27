import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:in_game/src/block/players_block.dart';
import 'package:in_game/src/models/api/profile_model.dart';
import 'package:in_game/src/utils/app_theme.dart';
import 'package:shimmer/shimmer.dart';

class PlayersScreen extends StatefulWidget {
  const PlayersScreen({Key? key}) : super(key: key);

  @override
  _PlayersScreenState createState() => _PlayersScreenState();
}

class _PlayersScreenState extends State<PlayersScreen> {
  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14,
  );

  static final CameraPosition _lLake = CameraPosition(
    bearing: 192.8334901395799,
    target: LatLng(37.43296265331129, -122.08832357078792),
    tilt: 59.440717697143555,
    zoom: 19,
  );

  @override
  void initState() {
    playersBlock.getUsers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppTheme.BLACK,
          title: Text(
            "Карта игроков",
            style: TextStyle(
              fontFamily: AppTheme.fontFamilyManrope,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.bold,
              fontSize: 16,
              height: 22 / 16,
              color: AppTheme.WHITE,
            ),
          ),
          centerTitle: true,
          actions: [
            Container(
                padding: EdgeInsets.all(16),
                child: SvgPicture.asset("assets/icons/filter.svg")),
          ],
          bottom: TabBar(
            labelStyle: TextStyle(
              fontFamily: AppTheme.fontFamilyManrope,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w500,
              fontSize: 16,
              height: 1.5,
              color: AppTheme.WHITE,
            ),
            indicatorColor: AppTheme.GREEN,
            indicatorWeight: 5,
            indicatorPadding: EdgeInsets.only(left: 14, right: 14),
            // indicatorSize: TabBarIndicatorSize.tab,
            tabs: [
              Tab(
                text: "На карте",
              ),
              Tab(
                text: "Списком",
              ),
            ],
          ),
        ),
        body: StreamBuilder(
          stream: playersBlock.getUserProfile,
          builder:
              (BuildContext context, AsyncSnapshot<ProfileModel> snapshot) {
            if (snapshot.hasData) {
              return TabBarView(
                children: [
                  GoogleMap(
                    initialCameraPosition: _kGooglePlex,
                    onMapCreated: (GoogleMapController controller) {
                      _controller.complete(controller);
                    },
                  ),
                  Container(
                    color: AppTheme.BLACK,
                    child: Container(
                      margin: EdgeInsets.all(16),
                      child: ListView.builder(
                          itemCount: 10,
                          itemBuilder: (context, index) {
                            return ItemUser(
                              image: "${snapshot.data!.data.avatar}",
                              name: "${snapshot.data!.data.fullName}",
                              age: snapshot.data!.data.age,
                              winPercent: snapshot.data!.data.victory,
                              point: snapshot.data!.data.ball,
                              imgText: "A",
                              city: "${snapshot.data!.data.city.name}",
                            );
                          }),
                    ),
                  ),
                ],
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
    );
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(
      CameraUpdate.newCameraPosition(_lLake),
    );
  }
}

class ItemUser extends StatefulWidget {
  String image;
  String name;
  int age;
  int winPercent;
  int point;
  String imgText;
  String city;

  ItemUser({
    required this.image,
    required this.name,
    required this.age,
    required this.winPercent,
    required this.point,
    required this.imgText,
    required this.city,
  });

  @override
  State<StatefulWidget> createState() {
    return _ItemsUserState();
  }
}

class _ItemsUserState extends State<ItemUser> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 16,
        ),
        Row(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(48),
                  child: CachedNetworkImage(
                    imageUrl: widget.image,
                    width: 48,
                    height: 48,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 30, left: 30),
                  width: 18,
                  height: 18,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    color: AppTheme.YELLOW,
                  ),
                  child: Center(
                    child: Text(
                      widget.imgText,
                      style: TextStyle(
                        fontFamily: AppTheme.fontFamilyManrope,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                        height: 16 / 12,
                        color: AppTheme.BLACK,
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              width: 12,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.name,
                  style: TextStyle(
                    fontFamily: AppTheme.fontFamilyManrope,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w500,
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
                      "${widget.age.toString()} года",
                      style: TextStyle(
                        fontFamily: AppTheme.fontFamilyManrope,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.normal,
                        fontSize: 12,
                        height: 1.4,
                        color: AppTheme.GRAY,
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: AppTheme.GRAY,
                      ),
                      width: 4,
                      height: 4,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      widget.city,
                      style: TextStyle(
                        fontFamily: AppTheme.fontFamilyManrope,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.normal,
                        fontSize: 12,
                        height: 1.4,
                        color: AppTheme.GRAY,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Expanded(
              child: Column(
                children: [
                  Text(
                    "${widget.winPercent}%",
                    style: TextStyle(
                      fontFamily: AppTheme.fontFamilyManrope,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      height: 22 / 16,
                      color: AppTheme.WHITE,
                    ),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    "Побед",
                    style: TextStyle(
                      fontFamily: AppTheme.fontFamilyManrope,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.normal,
                      fontSize: 12,
                      height: 1.4,
                      color: AppTheme.GRAY,
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Text(
                  "${widget.point}",
                  style: TextStyle(
                    fontFamily: AppTheme.fontFamilyManrope,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    height: 22 / 16,
                    color: AppTheme.WHITE,
                  ),
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  "Очков",
                  style: TextStyle(
                    fontFamily: AppTheme.fontFamilyManrope,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.normal,
                    fontSize: 12,
                    height: 1.4,
                    color: AppTheme.GRAY,
                  ),
                ),
              ],
            ),
          ],
        ),
        SizedBox(
          height: 16,
        ),
        Divider(
          height: 1,
          color: AppTheme.GRAY.withOpacity(0.2),
        ),
      ],
    );
  }
}
