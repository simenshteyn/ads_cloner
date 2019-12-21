import 'package:ads_cloner/blocs/ads_bloc.dart';
import 'package:ads_cloner/blocs/campaigns_bloc.dart';
import 'package:ads_cloner/models/campaigns_request.dart';
import 'package:ads_cloner/pages/ads_page.dart';
import 'package:flutter/material.dart';
import 'package:ads_cloner/blocs/bloc_provider.dart';
import 'package:ads_cloner/blocs/application_bloc.dart';
import 'package:ads_cloner/models/campaigns_list.dart';

class CampaignsPage extends StatefulWidget {
  @override
  _CampaignsPageState createState() => _CampaignsPageState();
}

class _CampaignsPageState extends State<CampaignsPage> {
  @override
  void initState() {
    super.initState();
    ApplicationBloc appBloc = BlocProvider.of<ApplicationBloc>(context);
    CampaignsBloc bloc = BlocProvider.of<CampaignsBloc>(context);
    bloc.getCampaignsList
        .add(CampaignsRequest(appBloc.vkAccessToken, appBloc.currentAccount));
  }

  @override
  Widget build(BuildContext context) {
    ApplicationBloc appBloc = BlocProvider.of<ApplicationBloc>(context);
    CampaignsBloc bloc = BlocProvider.of<CampaignsBloc>(context);
    //bloc.getCampaignsList
    //    .add(CampaignsRequest(appBloc.vkAccessToken, appBloc.currentAccount));

    return Scaffold(
      appBar: AppBar(
        title: Text(appBloc.currentAccount.accountName),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: StreamBuilder<CampaignsList>(
            stream: bloc.outCampaignsList,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data.campaigns.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      leading: Icon(Icons.photo_library),
                      title: Text(snapshot.data.campaigns[index].name),
                      trailing: Icon(Icons.keyboard_arrow_right),
                      onTap: () {
                        appBloc.inCurrentCampaign
                            .add(snapshot.data.campaigns[index]);
                        print('Account tapped index is ${index}');
                        _openAdsPage(context);
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

  void _openAdsPage(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (BuildContext context) {
        return BlocProvider<AdsBloc>(
          bloc: AdsBloc(),
          child: AdsPage(),
        );
      }),
    );
  }
}
