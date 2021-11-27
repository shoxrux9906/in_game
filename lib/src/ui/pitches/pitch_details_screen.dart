import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:in_game/src/models/api/pitches_model.dart';
import 'package:in_game/src/utils/app_theme.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;

class PitchDetailsScreen extends StatefulWidget {
  final PitchesResult itemResult;

  PitchDetailsScreen({required this.itemResult});

  @override
  _PitchDetailsScreenState createState() => _PitchDetailsScreenState();
}

class _PitchDetailsScreenState extends State<PitchDetailsScreen> {
  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 12,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.BLACK,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            padding: EdgeInsets.all(16),
            child: SvgPicture.asset(
              "assets/icons/arrow_right.svg",
              width: 24,
              height: 24,
            ),
          ),
        ),
        title: Text(
          "${widget.itemResult.name}",
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
        child: Column(
          children: [
            Expanded(
              child: ListView(
                shrinkWrap: true,
                children: [
                  Container(
                      child: CarouselSlider.builder(
                    itemCount: widget.itemResult.image.length,
                    options: CarouselOptions(
                      autoPlay: true,
                      aspectRatio: 2.0,
                      enlargeCenterPage: false,
                    ),
                    itemBuilder: (context, index, realIdx) {
                      return Stack(
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 16, left: 16),
                            child: Center(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(16),
                                child: CachedNetworkImage(
                                  imageUrl: "${widget.itemResult.image[index]}",
                                  fit: BoxFit.fill,
                                  height: 185,
                                  width: 500,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 16, left: 16),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(colors: [
                                AppTheme.BLACK.withOpacity(0.06),
                                AppTheme.BLACK.withOpacity(0.27),
                              ]),
                              borderRadius: BorderRadius.circular(16),
                            ),
                          )
                        ],
                      );
                    },
                  )),
                  TitleText(name: "Контактные данные"),
                  // TitleText(name: "Контактные данные"),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: widget.itemResult.contact.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.only(top: 9, left: 16),
                        child: Text(
                          "${widget.itemResult.contact[index].phone}",
                          style: TextStyle(
                            fontFamily: AppTheme.fontFamilyManrope,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            height: 1.3,
                            color: AppTheme.GRAY,
                          ),
                        ),
                      );
                    },
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      top: 9,
                      left: 16,
                    ),
                    child: Text(
                      widget.itemResult.email,
                      style: TextStyle(
                        fontFamily: AppTheme.fontFamilyManrope,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        height: 1.3,
                        color: AppTheme.GRAY,
                      ),
                    ),
                  ),
                  TitleText(
                    name: "Прайслист",
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: widget.itemResult.price.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.only(top: 9, left: 16),
                        child: Text(
                          "${widget.itemResult.price[index].hour} ${widget.itemResult.price[index].hour == 1 ? "час" : "часа"} - ${widget.itemResult.price[index].price}",
                          style: TextStyle(
                            fontFamily: AppTheme.fontFamilyManrope,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            height: 1.3,
                            color: AppTheme.GRAY,
                          ),
                        ),
                      );
                    },
                  ),
                  TitleText(name: "Средняя оценка поля"),
                  Container(
                    margin: EdgeInsets.only(top: 12, left: 12, right: 10),
                    child: Row(
                      children: [
                        RatingBar.builder(
                          allowHalfRating: true,
                          wrapAlignment: WrapAlignment.end,
                          initialRating: widget.itemResult.reviewAvg,
                          minRating: 1,
                          unratedColor: AppTheme.DARK_GRAY,
                          itemCount: 5,
                          itemBuilder: (context, _) => Container(
                            padding: EdgeInsets.symmetric(vertical: 4),
                            child: Image.asset(
                              "assets/images/star2.png",
                              width: 20,
                              height: 20,
                              fit: BoxFit.scaleDown,
                              color: AppTheme.YELLOW,
                            ),
                          ),
                          onRatingUpdate: (rating) {
                            print(rating);
                          },
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "(${widget.itemResult.reviewAvg})",
                          style: TextStyle(
                            fontFamily: AppTheme.fontFamilyManrope,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            height: 1.3,
                            color: AppTheme.GRAY,
                          ),
                        ),
                      ],
                    ),
                  ),
                  TitleText(name: "Адрес поля"),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 148,
                    margin: EdgeInsets.only(
                      top: 32,
                      left: 16,
                      right: 16,
                      bottom: 100,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: GoogleMap(
                        initialCameraPosition: _kGooglePlex,
                        onMapCreated: (GoogleMapController controller) {
                          _controller.complete(controller);
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              height: 1,
              color: AppTheme.GRAY.withOpacity(0.3),
            ),
            GestureDetector(
              onTap: (){
                  UrlLauncher.launch("tel:${widget.itemResult.contact[0].phone}");
              },
              child: Container(
                height: 48,
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(top: 12, left: 24, right: 24, bottom: 12),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: AppTheme.GREEN),
                child: Center(
                  child: Text(
                    "Позвонить",
                    style: TextStyle(
                      fontFamily: AppTheme.fontFamilySFPro,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      height: 20 / 16,
                      color: AppTheme.WHITE,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TitleText extends StatelessWidget {
  final String name;

  TitleText({
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 24, left: 16, right: 16),
      child: Text(
        name,
        style: TextStyle(
          fontFamily: AppTheme.fontFamilyManrope,
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w600,
          fontSize: 24,
          height: 1.3,
          color: AppTheme.WHITE,
        ),
      ),
    );
  }
}
