import 'package:ads_cloner/api/error_check.dart';
import 'package:ads_cloner/blocs/ads_bloc.dart';
import 'package:ads_cloner/blocs/campaigns_bloc.dart';
import 'package:ads_cloner/models/campaigns_request.dart';
import 'package:ads_cloner/pages/ads_page.dart';
import 'package:flutter/material.dart';
import 'package:ads_cloner/blocs/bloc_provider.dart';
import 'package:ads_cloner/blocs/application_bloc.dart';
import 'package:ads_cloner/models/campaigns_list.dart';

class CampaignsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CampaignsPageSnackbar(),
    );
  }
}

class CampaignsPageSnackbar extends StatefulWidget {
  @override
  _CampaignsPageSnackbarState createState() => _CampaignsPageSnackbarState();
}

class _CampaignsPageSnackbarState extends State<CampaignsPageSnackbar> {
  @override
  void initState() {
    super.initState();
    ApplicationBloc appBloc = BlocProvider.of<ApplicationBloc>(context);
    CampaignsBloc bloc = BlocProvider.of<CampaignsBloc>(context);
    bloc.getCampaignsList
        .add(CampaignsRequest(appBloc.vkAccessToken, appBloc.currentAccount));
    appBloc.outWarningMessage.forEach((e) {
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text('${e}'),
        backgroundColor: Colors.red,
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    ApplicationBloc appBloc = BlocProvider.of<ApplicationBloc>(context);
    CampaignsBloc bloc = BlocProvider.of<CampaignsBloc>(context);
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
                return apiResponseHasError(snapshot)
                    ? showError(snapshot, context)
                    : ListView.builder(
                        itemCount: snapshot.data.campaigns.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ListTile(
                            leading: Icon(Icons.photo_library),
                            title: Text(snapshot.data.campaigns[index].name),
                            trailing: Icon(Icons.keyboard_arrow_right),
                            onTap: () {
                              appBloc.inCurrentCampaign
                                  .add(snapshot.data.campaigns[index]);
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
