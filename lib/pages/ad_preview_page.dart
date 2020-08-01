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
  AdLayout _currentLayout;
  AdTargeting _currentTargeting;
  String _currentWallPostId;

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
    ApplicationBloc appBloc = BlocProvider.of<ApplicationBloc>(context);
    AdPreviewBloc bloc = BlocProvider.of<AdPreviewBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Объявление'),
      ),
      body: Stack(children: <Widget>[
        Column(
          children: [
            AdInfoWidget(),
            StreamBuilder<AdsTargetingList>(
              stream: bloc.outAdsTargetingList,
              builder: (context, snapshot) {
                if ((snapshot.hasData) &&
                    (snapshot.data.adsTargeting?.length > 0)) {
                  _currentTargeting = snapshot.data.adsTargeting[0];
                  var show = snapshot.data.adsTargeting[0].toJson().toString();
                  return Text(show);
                }
                return Text('No data');
              },
            ),
          ],
        ),
        StreamBuilder<AdsLayoutList>(
            stream: bloc.outAdsLayoutList,
            builder: (context, snapshot) {
              if ((snapshot.hasData) && (snapshot.data.adsLayout?.length > 0)) {
                _currentLayout = snapshot.data.adsLayout[0];
                _currentWallPostId =
                    _postUrlConvertor(snapshot.data.adsLayout[0].linkUrl);

                return DraggableScrollableSheet(
                  initialChildSize: 0.3,
                  maxChildSize: 0.8,
                  minChildSize: 0.1,
                  builder: (context, controller) {
                    return SingleChildScrollView(
                      controller: controller,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(width: 1, color: Colors.grey[200]),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30),
                              bottomLeft: Radius.circular(30),
                              bottomRight: Radius.circular(30)),
                        ),
                        child: Container(
                          height: 600,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Container(
                              child: WebView(
                                gestureNavigationEnabled: false,
                                javascriptMode: JavascriptMode.disabled,
                                initialUrl:
                                    snapshot.data.adsLayout[0].previewLink,
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                );
              }
              return Center(child: CircularProgressIndicator());
            }),
      ]),
      floatingActionButton: StreamBuilder<AdsLayoutList>(
          stream: bloc.outAdsLayoutList,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return FloatingActionButton(
                  child: Icon(Icons.content_copy),
                  onPressed: () {
                    appBloc.inCurrentAdLayout.add(_currentLayout);
                    appBloc.inCurrentAdTargeting.add(_currentTargeting);
                    appBloc.inCurrentPostId.add(_currentWallPostId);
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
