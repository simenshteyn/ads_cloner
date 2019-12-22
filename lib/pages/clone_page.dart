import 'package:ads_cloner/blocs/application_bloc.dart';
import 'package:ads_cloner/blocs/bloc_provider.dart';
import 'package:ads_cloner/blocs/clone_bloc.dart';
import 'package:ads_cloner/models/ads_targeting_list.dart';
import 'package:ads_cloner/models/ads_targeting_request.dart';
import 'package:ads_cloner/models/wall_post_list.dart';
import 'package:ads_cloner/models/wall_post_request.dart';
import 'package:flutter/material.dart';

class ClonePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ApplicationBloc appBloc = BlocProvider.of<ApplicationBloc>(context);
    CloneBloc bloc = BlocProvider.of<CloneBloc>(context);
    bloc.getWallPostList
        .add(WallPostRequest(appBloc.vkAccessToken, appBloc.currentPostId));
    bloc.getAdsTargetingList.add(AdsTargetingRequest(
        appBloc.vkAccessToken, appBloc.currentAccount, appBloc.currentAd));

    return Scaffold(
      appBar: AppBar(
        title: Text('Clone Ads'),
      ),
      body: Column(
        children: <Widget>[
          StreamBuilder<WallPostList>(
              stream: bloc.outWallPostList,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
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
              })
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.done),
      ),
    );
  }
}
