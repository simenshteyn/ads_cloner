import 'package:ads_cloner/blocs/ad_preview_bloc.dart';
import 'package:ads_cloner/blocs/ads_bloc.dart';
import 'package:ads_cloner/models/ads_request.dart';
import 'package:ads_cloner/pages/ad_preview_page.dart';
import 'package:flutter/material.dart';
import 'package:ads_cloner/blocs/bloc_provider.dart';
import 'package:ads_cloner/blocs/application_bloc.dart';
import 'package:ads_cloner/models/ads_list.dart';

class AdsPage extends StatefulWidget {
  @override
  _AdsPageState createState() => _AdsPageState();
}

class _AdsPageState extends State<AdsPage> {
  @override
  void initState() {
    super.initState();
    ApplicationBloc appBloc = BlocProvider.of<ApplicationBloc>(context);
    AdsBloc bloc = BlocProvider.of<AdsBloc>(context);
    bloc.getAdsList.add(AdsRequest(appBloc.vkAccessToken,
        appBloc.currentAccount, appBloc.currentCampaign));
  }

  @override
  Widget build(BuildContext context) {
    ApplicationBloc appBloc = BlocProvider.of<ApplicationBloc>(context);
    AdsBloc bloc = BlocProvider.of<AdsBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(appBloc.currentCampaign.name),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: StreamBuilder<AdsList>(
            stream: bloc.outAdsList,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data.ads.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      leading: Icon(Icons.photo),
                      title: Text(snapshot.data.ads[index].name),
                      trailing: Icon(Icons.keyboard_arrow_right),
                      onTap: () {
                        appBloc.inCurrentAd.add(snapshot.data.ads[index]);
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
        return BlocProvider<AdPreviewBloc>(
          bloc: AdPreviewBloc(),
          child: AdPreviewPage(),
        );
      }),
    );
  }
}
