import 'package:ads_cloner/blocs/ad_preview_bloc.dart';
import 'package:ads_cloner/blocs/ads_bloc.dart';
import 'package:ads_cloner/models/ads_request.dart';
import 'package:ads_cloner/pages/ad_preview_page.dart';
import 'package:flutter/material.dart';
import 'package:ads_cloner/blocs/bloc_provider.dart';
import 'package:ads_cloner/blocs/application_bloc.dart';
import 'package:ads_cloner/models/ads_list.dart';

class AdsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ApplicationBloc appBloc = BlocProvider.of<ApplicationBloc>(context);
    AdsBloc bloc = BlocProvider.of<AdsBloc>(context);
    bloc.getAdsList.add(AdsRequest(appBloc.vkAccessToken,
        appBloc.currentAccount, appBloc.currentCampaign));

    return Scaffold(
      appBar: AppBar(
        title: Text('Choose ad'),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: StreamBuilder<AdsList>(
            //initialData: loginBloc.accounts,
            stream: bloc.outAdsList,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data.ads.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      leading: Icon(Icons.account_circle),
                      title: Text(snapshot.data.ads[index].name),
                      trailing: Icon(Icons.keyboard_arrow_right),
                      onTap: () {
                        appBloc.inCurrentAd.add(snapshot.data.ads[index]);
                        print('Ads tapped index is ${index}');
                        _openAdPreviewPage(context);
                      },
                    );
                  },
                );
              }
              return Center(child: CircularProgressIndicator());
            }),
      ),
    );
  }

  void _openAdPreviewPage(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (BuildContext context) {
        return BlocProvider<AdsBloc>(
          bloc: AdsBloc(),
          child: AdPreviewPage(),
        );
      }),
    );
  }
}
