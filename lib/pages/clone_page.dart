import 'package:ads_cloner/blocs/application_bloc.dart';
import 'package:ads_cloner/blocs/bloc_provider.dart';
import 'package:ads_cloner/blocs/clone_bloc.dart';
import 'package:ads_cloner/models/ads_targeting_list.dart';
import 'package:ads_cloner/models/ads_targeting_request.dart';
import 'package:ads_cloner/models/wall_post.dart';
import 'package:ads_cloner/models/wall_post_adsstealth.dart';
import 'package:ads_cloner/models/wall_post_adsstealth_request.dart';
import 'package:ads_cloner/models/wall_post_adsstealth_result.dart';
import 'package:ads_cloner/models/wall_post_list.dart';
import 'package:ads_cloner/models/wall_post_request.dart';
import 'package:flutter/material.dart';
import 'package:ads_cloner/widgets/clone_options_widget.dart';

class ClonePage extends StatefulWidget {
  @override
  _ClonePageState createState() => _ClonePageState();
}

class _ClonePageState extends State<ClonePage> {
  WallPost wallPost; //remove this later

  @override
  void initState() {
    super.initState();
    ApplicationBloc appBloc = BlocProvider.of<ApplicationBloc>(context);
    CloneBloc bloc = BlocProvider.of<CloneBloc>(context);
    bloc.getWallPostList
        .add(WallPostRequest(appBloc.vkAccessToken, appBloc.currentPostId));
    bloc.getAdsTargetingList.add(AdsTargetingRequest(
        appBloc.vkAccessToken, appBloc.currentAccount, appBloc.currentAd));
  }

  @override
  Widget build(BuildContext context) {
    ApplicationBloc appBloc = BlocProvider.of<ApplicationBloc>(context);
    CloneBloc bloc = BlocProvider.of<CloneBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Clone Ads'),
      ),
      body: Column(
        children: <Widget>[
          CloneOptionsWidget(),
          StreamBuilder<WallPostList>(
              stream: bloc.outWallPostList,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  this.wallPost = snapshot.data.wallPosts[0];
                  return Text(
                      'Some testing ${snapshot.data.wallPosts[0].ownerId}');
                }
                return CircularProgressIndicator();
              }),
          StreamBuilder<AdsTargetingList>(
              stream: bloc.outAdsTargetingList,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text(
                      'Some targeting info ${snapshot.data.adsTargeting[0].campaignId}');
                }
                return CircularProgressIndicator();
              }),
          StreamBuilder<WallPostAdsStealthResult>(
              stream: bloc.outWallPostAdsStealthResult,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text('Some return id ${snapshot.data.postId}');
                }
                return CircularProgressIndicator();
              }),
        ],
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.done),
          onPressed: () {
            _doneButtonPressed(wallPost, context);
          }),
    );
  }

  void _doneButtonPressed(WallPost wallPost, BuildContext cntx) {
    print('Done button pressed');
    final adsStealth = WallPostAdsStealth.fromWallPost(wallPost);
    ApplicationBloc appBloc = BlocProvider.of<ApplicationBloc>(context);
    CloneBloc bloc = BlocProvider.of<CloneBloc>(context);
    bloc.getWallPostAdsStealthResult
        .add(WallPostAdsStealthRequest(appBloc.vkAccessToken, adsStealth));
  }
}
