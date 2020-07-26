import 'package:ads_cloner/blocs/application_bloc.dart';
import 'package:ads_cloner/blocs/bloc_provider.dart';
import 'package:ads_cloner/blocs/clone_bloc.dart';
import 'package:ads_cloner/models/ads_targeting_list.dart';
import 'package:ads_cloner/models/ads_targeting_request.dart';
import 'package:ads_cloner/models/create_ad_result.dart';
import 'package:ads_cloner/models/create_ads_list.dart';
import 'package:ads_cloner/models/create_ads_request.dart';
import 'package:ads_cloner/models/create_ads_result_list.dart';
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
    appBloc.getCurrentCreateAdsList.add('give me');
  }

  @override
  Widget build(BuildContext context) {
    ApplicationBloc appBloc = BlocProvider.of<ApplicationBloc>(context);
    CloneBloc bloc = BlocProvider.of<CloneBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Клонировать объявление'),
      ),
      body: Column(
        children: <Widget>[
          CloneOptionsWidget(),
          StreamBuilder<CreateAdsList>(
            stream: appBloc.outCurrentCreateAdsList,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                print('clone ads ${snapshot.data.createAdsList.length}');
                //  return Text('Ads to clone ${snapshot.data.createAdsList.length}');
                return Expanded(
                  child: ListView.separated(
                      separatorBuilder: (BuildContext context, int index) =>
                          Divider(),
                      itemCount: snapshot.data.createAdsList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                            title: Text(
                                '${snapshot.data.createAdsList[index].linkUrl}'));
                      }),
                );
              }
              return Text('Clone ads first');
            },
          ),
          StreamBuilder<CreateAdsResultList>(
              stream: bloc.outCreateAdsResultList,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text('${snapshot.data.toString()}');
                }
                return Text('No ads still cloned');
              }),
        ],
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.done),
          onPressed: () {
            _doneButtonPressed(context);
          }),
    );
  }

  void _doneButtonPressed(BuildContext cntx) {
    print('Done button pressed');
    ApplicationBloc appBloc = BlocProvider.of<ApplicationBloc>(context);
    CloneBloc bloc = BlocProvider.of<CloneBloc>(context);
    var req = CreateAdsRequest(appBloc.vkAccessToken, appBloc.currentAccount,
        appBloc.currentCreateAdsList);
    bloc.getCreateAdsResultList.add(req);
  }
}
