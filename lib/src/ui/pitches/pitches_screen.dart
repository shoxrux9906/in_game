import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:in_game/src/block/pitches_block.dart';
import 'package:in_game/src/models/api/pitches_model.dart';
import 'package:in_game/src/ui/pitches/pitch_details_screen.dart';
import 'package:in_game/src/utils/app_theme.dart';

class PitchesScreen extends StatefulWidget {
  const PitchesScreen({Key? key}) : super(key: key);

  @override
  _PitchesScreenState createState() => _PitchesScreenState();
}

class _PitchesScreenState extends State<PitchesScreen> {
  @override
  void initState() {
    pitchesBlock.getPitchesInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppTheme.BLACK,
        title: Text("Поля"),
        actions: [
          Container(
            margin: EdgeInsets.all(16),
            child: SvgPicture.asset("assets/icons/filter.svg"),
          ),
        ],
      ),
      body: Container(
        color: AppTheme.BLACK,
        child: StreamBuilder(
          stream: pitchesBlock.getPitches,
          builder:
              (BuildContext context, AsyncSnapshot<PitchesModel> snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.results.length + 1,
                itemBuilder: (context, index) {
                  if (index == snapshot.data!.results.length) {
                    return SizedBox(
                      height: 100,
                    );
                  } else {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context){
                          return PitchDetailsScreen(itemResult: snapshot.data!.results[index],);
                        }));
                      },
                      child: Container(
                        child: Stack(
                          children: [
                            Container(
                              margin: EdgeInsets.only(
                                top: 20,
                                left: 16,
                                right: 16,
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(16),
                                child: CachedNetworkImage(
                                  width: MediaQuery.of(context).size.width,
                                  height: 185,
                                  imageUrl:
                                      snapshot.data!.results[index].image[0],
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 20),
                              width: MediaQuery.of(context).size.width,
                              height: 185,
                              decoration: BoxDecoration(
                                  color: AppTheme.BLACK,
                                  gradient: LinearGradient(
                                      begin: FractionalOffset.topCenter,
                                      end: FractionalOffset.bottomCenter,
                                      colors: [
                                        AppTheme.BLACK.withOpacity(0.2),
                                        AppTheme.BLACK.withOpacity(0.9),
                                      ])),
                            ),
                            Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(top: 35, left: 30),
                                  height: 24,
                                  padding: EdgeInsets.symmetric(
                                      vertical: 4, horizontal: 8),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color:
                                        snapshot.data!.results[index].status ==
                                                true
                                            ? AppTheme.YELLOW
                                            : AppTheme.GREEN,
                                  ),
                                  child: Center(
                                    child: snapshot
                                                .data!.results[index].status ==
                                            true
                                        ? Text(
                                            "Занято",
                                            style: TextStyle(
                                              fontFamily:
                                                  AppTheme.fontFamilyManrope,
                                              fontStyle: FontStyle.normal,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 12,
                                              height: 1.3,
                                              color: AppTheme.BLACK,
                                            ),
                                          )
                                        : Text(
                                            "Свободно",
                                            style: TextStyle(
                                              fontFamily:
                                                  AppTheme.fontFamilyManrope,
                                              fontStyle: FontStyle.normal,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 12,
                                              height: 1.3,
                                              color: AppTheme.WHITE,
                                            ),
                                          ),
                                  ),
                                ),
                                Spacer(),
                                Container(
                                  margin: EdgeInsets.only(top: 35, right: 30),
                                  height: 24,
                                  padding: EdgeInsets.symmetric(
                                      vertical: 4, horizontal: 8),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: AppTheme.GRAY4),
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        "assets/images/star.png",
                                        width: 16,
                                        height: 16,
                                      ),
                                      SizedBox(
                                        width: 8,
                                      ),
                                      Text(
                                        "${snapshot.data!.results[index].reviewAvg}",
                                        style: TextStyle(
                                          fontFamily:
                                              AppTheme.fontFamilyManrope,
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 12,
                                          height: 1.4,
                                          color: AppTheme.WHITE,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 140, left: 30),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "${snapshot.data!.results[index].name}",
                                    style: TextStyle(
                                      fontFamily: AppTheme.fontFamilyManrope,
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18,
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
                                        "${snapshot.data!.results[index].region.name}, ориентир: ",
                                        style: TextStyle(
                                          fontFamily:
                                              AppTheme.fontFamilyManrope,
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.normal,
                                          fontSize: 11,
                                          height: 1.3,
                                          color: AppTheme.WHITE,
                                        ),
                                      ),
                                      Text(
                                        "${snapshot.data!.results[index].orientr[0].address}",
                                        style: TextStyle(
                                          fontFamily:
                                              AppTheme.fontFamilyManrope,
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.normal,
                                          fontSize: 11,
                                          height: 1.3,
                                          color: AppTheme.WHITE,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }
                },
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
}
