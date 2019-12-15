import 'package:ads_cloner/blocs/ads_bloc.dart';
import 'package:ads_cloner/blocs/application_bloc.dart';
import 'package:ads_cloner/blocs/bloc_provider.dart';
import 'package:ads_cloner/models/ads_layout_list.dart';
import 'package:ads_cloner/models/ads_layout_request.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class AdPreviewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ApplicationBloc appBloc = BlocProvider.of<ApplicationBloc>(context);
    AdsBloc bloc = BlocProvider.of<AdsBloc>(context);
    bloc.getAdsLayoutList.add(AdsLayoutRequest(
        appBloc.vkAccessToken, appBloc.currentAccount, appBloc.currentAd));
    return Scaffold(
      appBar: AppBar(
        title: Text('Ad Preview'),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height * 0.6,
        child: StreamBuilder<AdsLayoutList>(
          stream: bloc.outAdsLayoutList,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return WebView(
                  initialUrl: snapshot.data.adsLayout[0].previewLink,
                         );

                //return Text('${snapshot.data.adsLayout[0].id}');
            }
            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
