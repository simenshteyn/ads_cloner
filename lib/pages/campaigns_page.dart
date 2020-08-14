import 'package:ads_cloner/api/error_check.dart';
import 'package:ads_cloner/blocs/ads_bloc.dart';
import 'package:ads_cloner/blocs/campaigns_bloc.dart';
import 'package:ads_cloner/models/campaign.dart';
import 'package:ads_cloner/models/campaigns_request.dart';
import 'package:ads_cloner/models/update_campaigns_request.dart';
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
  Widget build(BuildContext context) {
    ApplicationBloc appBloc = BlocProvider.of<ApplicationBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(appBloc.currentAccount.accountName),
      ),
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

    bloc.getCampaignsList.add(CampaignsRequest(
        appBloc.vkAccessToken, appBloc.currentAccount, appBloc.currentClient));

    bloc.outWarningMessage.forEach((e) {
      if (context != null) {
        _showSnackBar('${e}', context);
      }
    });

    bloc.outCampaignsStatus.forEach((event) {
      if (event.createCampaignsResultList[0].errorCode == null) {
        Scaffold.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.green,
          content: Text('Статус кампании изменен'),
        ));
      } else {
        bloc.inWarningMessage.add(
            'Ошибка ${event.createCampaignsResultList[0].errorCode}: ${event.createCampaignsResultList[0].errorDesc}');
      }
    });
  }

  _showSnackBar(String text, BuildContext context) {
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text('${text}'),
      backgroundColor: Colors.red,
    ));
  }

  @override
  Widget build(BuildContext context) {
    ApplicationBloc appBloc = BlocProvider.of<ApplicationBloc>(context);
    CampaignsBloc bloc = BlocProvider.of<CampaignsBloc>(context);

    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: StreamBuilder<CampaignsList>(
          stream: bloc.outCampaignsList,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              if (apiResponseHasError(snapshot)) {
                bloc.inWarningMessage.add(
                    'Ошибка ${snapshot.data.errorResponse.errorCode}: ${snapshot.data.errorResponse.errorMsg}');
                return Container();
              }
              return RefreshIndicator(
                onRefresh: () => _refresh(context),
                child: ListView.builder(
                  itemCount: snapshot.data.campaigns.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      leading: _buildStatusIcon(
                          context, snapshot.data.campaigns[index]),
                      title: Text(snapshot.data.campaigns[index].name),
                      trailing: Icon(Icons.keyboard_arrow_right),
                      onTap: () {
                        appBloc.inCurrentCampaign
                            .add(snapshot.data.campaigns[index]);
                        _openAdsPage(context);
                      },
                    );
                  },
                ),
              );
            }
            return Center(child: CircularProgressIndicator());
          }),
    );
  }

  Future<Null> _refresh(context) async {
    ApplicationBloc appBloc = BlocProvider.of<ApplicationBloc>(context);
    CampaignsBloc bloc = BlocProvider.of<CampaignsBloc>(context);
    bloc.getCampaignsList.add(CampaignsRequest(
        appBloc.vkAccessToken, appBloc.currentAccount, appBloc.currentClient));
  }

  Widget _buildStatusIcon(BuildContext context, Campaign campaign) {
    switch (campaign.status) {
      case 0:
        return _buildPopupMenuButton(
            context, campaign, Icon(Icons.pause_circle_filled));
        break;
      case 1:
        return _buildPopupMenuButton(context, campaign,
            Icon(Icons.play_circle_filled, color: Colors.green[200]));
        break;
      case 2:
        return _buildPopupMenuButton(context, campaign, Icon(Icons.cancel));
        break;
      default:
        return _buildPopupMenuButton(
            context, campaign, Icon(Icons.report_problem));
    }
  }

  Widget _buildPopupMenuButton(
      BuildContext context, Campaign campaign, Icon icon) {
    ApplicationBloc appBloc = BlocProvider.of<ApplicationBloc>(context);
    CampaignsBloc bloc = BlocProvider.of<CampaignsBloc>(context);
    return Container(
      width: 35,
      height: 35,
      child: PopupMenuButton(
          child: icon,
          itemBuilder: (_) => <PopupMenuItem<int>>[
                PopupMenuItem<int>(
                    child: Row(
                      children: [
                        Icon(Icons.play_circle_filled,
                            color: Colors.green[200]),
                        const Text('  Запустить'),
                      ],
                    ),
                    value: 1),
                PopupMenuItem<int>(
                    child: Row(
                      children: [
                        Icon(Icons.pause_circle_filled, color: Colors.red[200]),
                        const Text('  Остановить'),
                      ],
                    ),
                    value: 0),
              ],
          onSelected: (status) {
            bloc.getUpdateCampaigns.add(UpdateCampaignsRequest(
                appBloc.vkAccessToken,
                appBloc.currentAccount,
                campaign,
                status));
            final req = CampaignsRequest(appBloc.vkAccessToken,
                appBloc.currentAccount, appBloc.currentClient);
            bloc.getCampaignsList.add(req);
          }),
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
