import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:in_game/src/block/players_block.dart';
import 'package:in_game/src/models/api/profile_model.dart';
import 'package:in_game/src/utils/app_theme.dart';

class WorldRatingScreen extends StatefulWidget {
  const WorldRatingScreen({Key? key}) : super(key: key);

  @override
  _WorldRatingScreenState createState() => _WorldRatingScreenState();
}

class _WorldRatingScreenState extends State<WorldRatingScreen> {
  TabController? _tabController;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppTheme.BLACK,
          title: Text(
            "Рейтинг игроков",
            style: TextStyle(
              fontFamily: AppTheme.fontFamilyManrope,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w700,
              fontSize: 16,
              height: 22 / 16,
              color: AppTheme.WHITE,
            ),
          ),
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
            tabs: [
              Tab(text: "Мировой",),
              Tab(text: "Региональный",),
            ],
          ),
          actions: [
            Container(
              padding: EdgeInsets.only(left: 8, right: 16),
              child: SvgPicture.asset("assets/icons/filter.svg"),
            ),
          ],
        ),
        body: StreamBuilder(
          stream: playersBlock.getUserProfile,
          builder: (BuildContext context, AsyncSnapshot<ProfileModel> snapshot) {
            if (snapshot.hasData) {
              return TabBarView(
                controller: _tabController,
                children: [],
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
