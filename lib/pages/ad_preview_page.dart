import 'package:ads_cloner/blocs/ad_preview_bloc.dart';
import 'package:ads_cloner/blocs/application_bloc.dart';
import 'package:ads_cloner/blocs/bloc_provider.dart';
import 'package:ads_cloner/blocs/clone_bloc.dart';
import 'package:ads_cloner/models/ad_layout.dart';
import 'package:ads_cloner/models/ad_targeting.dart';
import 'package:ads_cloner/models/ads_layout_list.dart';
import 'package:ads_cloner/models/ads_layout_request.dart';
import 'package:ads_cloner/models/ads_targeting_list.dart';
import 'package:ads_cloner/models/ads_targeting_request.dart';
import 'package:ads_cloner/pages/clone_page.dart';
import 'package:ads_cloner/widgets/ad_info_widget.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class AdPreviewPage extends StatefulWidget {
  @override
  _AdPreviewPageState createState() => _AdPreviewPageState();
}

class _AdPreviewPageState extends State<AdPreviewPage> {
  @override
  void initState() {
    super.initState();
    ApplicationBloc appBloc = BlocProvider.of<ApplicationBloc>(context);
    AdPreviewBloc bloc = BlocProvider.of<AdPreviewBloc>(context);
    bloc.getAdsLayoutList.add(AdsLayoutRequest(
        appBloc.vkAccessToken, appBloc.currentAccount, appBloc.currentAd));
    bloc.getAdsTargetingList.add(AdsTargetingRequest(
        appBloc.vkAccessToken, appBloc.currentAccount, appBloc.currentAd));
  }

  @override
  Widget build(BuildContext context) {
    AdLayout _currentLayout;
    AdTargeting _currentTargeting;

    ApplicationBloc appBloc = BlocProvider.of<ApplicationBloc>(context);
    AdPreviewBloc bloc = BlocProvider.of<AdPreviewBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Объявление'),
      ),
      body: Column(
        children: <Widget>[
          AdInfoWidget(),
          StreamBuilder<AdsTargetingList>(
            stream: bloc.outAdsTargetingList,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                _currentTargeting = snapshot.data.adsTargeting[0];
                var show = snapshot.data.adsTargeting[0].toJson().toString();
                return Text(show);
              }
              return Text('No data');
            },
          ),
          Flexible(
            child: StreamBuilder<AdsLayoutList>(
                stream: bloc.outAdsLayoutList,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    _currentLayout = snapshot.data.adsLayout[0];
                    return WebView(
                        initialUrl: snapshot.data.adsLayout[0].previewLink);
                  }
                  return Center(child: CircularProgressIndicator());
                }),
          ),
        ],
      ),
      floatingActionButton: StreamBuilder<AdsLayoutList>(
          stream: bloc.outAdsLayoutList,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return FloatingActionButton(
                  child: Icon(Icons.content_copy),
                  onPressed: () {
                    appBloc.inCurrentPostId.add(
                        _postUrlConvertor(snapshot.data.adsLayout[0].linkUrl));
                    appBloc.inCurrentAdLayout.add(snapshot.data.adsLayout[0]);

                    _openClonePage(context);
                  });
            }
            return Container();
          }),
    );
  }

  void _openClonePage(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (BuildContext context) {
        return BlocProvider<CloneBloc>(
          bloc: CloneBloc(),
          child: ClonePage(),
        );
      }),
    );
  }

  String _postUrlConvertor(String linkUrl) {
    //Convert linkUrl to postId
    return linkUrl.substring(18);
  }
}
