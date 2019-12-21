import 'package:ads_cloner/blocs/ad_preview_bloc.dart';
import 'package:ads_cloner/blocs/application_bloc.dart';
import 'package:ads_cloner/blocs/bloc_provider.dart';
import 'package:ads_cloner/blocs/clone_bloc.dart';
import 'package:ads_cloner/models/ads_layout_list.dart';
import 'package:ads_cloner/models/ads_layout_request.dart';
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
  }

  @override
  Widget build(BuildContext context) {
    ApplicationBloc appBloc = BlocProvider.of<ApplicationBloc>(context);
    AdPreviewBloc bloc = BlocProvider.of<AdPreviewBloc>(context);
    //bloc.getAdsLayoutList.add(AdsLayoutRequest(
    //    appBloc.vkAccessToken, appBloc.currentAccount, appBloc.currentAd));

    return Scaffold(
      appBar: AppBar(
        title: Text('Объявление'),
      ),
      body: StreamBuilder<AdsLayoutList>(
          stream: bloc.outAdsLayoutList,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    AdInfoWidget(),
                    Container(
                      height: 600.0,
                      child: WebView(
                          initialUrl: snapshot.data.adsLayout[0].previewLink),
                    ),
                  ],
                ),
              );
            }
            return Center(child: CircularProgressIndicator());
          }),
      floatingActionButton: StreamBuilder<AdsLayoutList>(
          stream: bloc.outAdsLayoutList,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return FloatingActionButton(
                  child: Icon(Icons.content_copy),
                  onPressed: () {
                    appBloc.inCurrentPostId.add(
                        _postUrlConvertor(snapshot.data.adsLayout[0].linkUrl));
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
