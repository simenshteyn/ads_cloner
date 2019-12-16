import 'package:ads_cloner/blocs/ad_preview_bloc.dart';
import 'package:ads_cloner/blocs/ads_bloc.dart';
import 'package:ads_cloner/blocs/application_bloc.dart';
import 'package:ads_cloner/blocs/bloc_provider.dart';
import 'package:ads_cloner/models/ads_layout_list.dart';
import 'package:ads_cloner/models/ads_layout_request.dart';
import 'package:ads_cloner/widgets/ad_info_widget.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class AdPreviewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ApplicationBloc appBloc = BlocProvider.of<ApplicationBloc>(context);
    AdPreviewBloc bloc = BlocProvider.of<AdPreviewBloc>(context);
    bloc.getAdsLayoutList.add(AdsLayoutRequest(
        appBloc.vkAccessToken, appBloc.currentAccount, appBloc.currentAd));
    return Scaffold(
      appBar: AppBar(
        title: Text('Объявление'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            AdInfoWidget(),
            StreamBuilder<AdsLayoutList>(
              stream: bloc.outAdsLayoutList,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Container(
                    height: 600.0,
                    child: WebView(
                      initialUrl: snapshot.data.adsLayout[0].previewLink,
                    ),
                  );
                }
                return Center(child: CircularProgressIndicator());
              },
            ),
          ],
        ),
      ),
      floatingActionButton:
          FloatingActionButton(child: Icon(Icons.content_copy)),
    );
  }
}
