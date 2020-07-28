import 'package:ads_cloner/blocs/ad_preview_bloc.dart';
import 'package:ads_cloner/blocs/ads_bloc.dart';
import 'package:ads_cloner/models/ads_layout_list.dart';
import 'package:ads_cloner/models/ads_request.dart';
import 'package:ads_cloner/pages/ad_preview_page.dart';
import 'package:flutter/material.dart';
import 'package:ads_cloner/blocs/bloc_provider.dart';
import 'package:ads_cloner/blocs/application_bloc.dart';
import 'package:ads_cloner/models/ads_list.dart';
import 'package:provider/provider.dart';

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
    final req = AdsRequest(
        appBloc.vkAccessToken, appBloc.currentAccount, appBloc.currentCampaign);
    bloc.getAdsList.add(req);
    bloc.getAdsLayoutList.add(req);
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
          child: MultiProvider(providers: [
            StreamProvider<AdsList>.value(value: bloc.outAdsList),
            StreamProvider<AdsLayoutList>.value(value: bloc.outLayoutList),
          ], child: ListWidget()),
        ));
  }
}

class ListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AdsList ads = Provider.of<AdsList>(context);
    AdsLayoutList layout = Provider.of<AdsLayoutList>(context);
    ApplicationBloc appBloc = BlocProvider.of<ApplicationBloc>(context);
    return (ads != null)
        ? ListView.builder(
            itemCount: ads.ads.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                leading: Icon(Icons.photo),
                title: Text(ads.ads[index].name),
                trailing: Icon(Icons.keyboard_arrow_right),
                onTap: () {
                  appBloc.inCurrentAd.add(ads.ads[index]);
                  _openAdPreviewPage(context);
                },
              );
            })
        : Center(child: CircularProgressIndicator());
  }

  void _openAdPreviewPage(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (BuildContext context) {
        return BlocProvider<AdPreviewBloc>(
          bloc: AdPreviewBloc(),
          child: AdPreviewPage(),
        );
      }),
    ).whenComplete(() {
      ApplicationBloc appBloc = BlocProvider.of<ApplicationBloc>(context);
      AdsBloc bloc = BlocProvider.of<AdsBloc>(context);
      final req = AdsRequest(appBloc.vkAccessToken, appBloc.currentAccount,
          appBloc.currentCampaign);
      bloc.getAdsList.add(req);
      bloc.getAdsLayoutList.add(req);
    });
  }
}
