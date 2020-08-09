import 'package:ads_cloner/api/error_check.dart';
import 'package:ads_cloner/blocs/ad_preview_bloc.dart';
import 'package:ads_cloner/blocs/ads_bloc.dart';
import 'package:ads_cloner/models/ad.dart';
import 'package:ads_cloner/models/ads_layout_list.dart';
import 'package:ads_cloner/models/ads_request.dart';
import 'package:ads_cloner/models/update_ads_request.dart';
import 'package:ads_cloner/pages/ad_preview_page.dart';
import 'package:flutter/material.dart';
import 'package:ads_cloner/blocs/bloc_provider.dart';
import 'package:ads_cloner/blocs/application_bloc.dart';
import 'package:ads_cloner/models/ads_list.dart';
import 'package:provider/provider.dart';

class AdsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AdsPageSnackbar(),
    );
  }
}

class AdsPageSnackbar extends StatefulWidget {
  @override
  _AdsPageSnackbarState createState() => _AdsPageSnackbarState();
}

class _AdsPageSnackbarState extends State<AdsPageSnackbar> {
  @override
  void initState() {
    super.initState();
    ApplicationBloc appBloc = BlocProvider.of<ApplicationBloc>(context);
    AdsBloc bloc = BlocProvider.of<AdsBloc>(context);
    final req = AdsRequest(appBloc.vkAccessToken, appBloc.currentAccount,
        appBloc.currentCampaign, appBloc.currentClient);
    bloc.getAdsList.add(req);

    appBloc.outWarningMessage.forEach((e) {
      if (context != null) {
        _showSnackBar('${e}', context);
      }
    });

    bloc.outAdsStatus.forEach((event) {
      if (event.createAdsResultList[0].errorCode == null) {
        Scaffold.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.green,
          content: Text('Статус объявления изменен'),
        ));
      } else {
        appBloc.inWarningMessage.add(
            'Ошибка ${event.createAdsResultList[0].errorCode}: ${event.createAdsResultList[0].errorDesc}');
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
                return apiResponseHasError(snapshot)
                    ? showError(context, snapshot)
                    : RefreshIndicator(
                        onRefresh: () => _refresh(context),
                        child: ListView.builder(
                            itemCount: snapshot.data.ads.length,
                            itemBuilder: (BuildContext context, int index) {
                              return ListTile(
                                leading: _buildStatusIcon(
                                    context, snapshot.data.ads[index]),
                                title: Text(snapshot.data.ads[index].name),
                                trailing: Icon(Icons.keyboard_arrow_right),
                                onTap: () {
                                  appBloc.inCurrentAd
                                      .add(snapshot.data.ads[index]);
                                  _openAdPreviewPage(context);
                                },
                                onLongPress: () {},
                              );
                            }),
                      );
              }
              return Center(child: CircularProgressIndicator());
            }),
      ),
    );
  }

  Future<Null> _refresh(context) async {
    ApplicationBloc appBloc = BlocProvider.of<ApplicationBloc>(context);
    AdsBloc bloc = BlocProvider.of<AdsBloc>(context);
    final req = AdsRequest(appBloc.vkAccessToken, appBloc.currentAccount,
        appBloc.currentCampaign, appBloc.currentClient);
    bloc.getAdsList.add(req);
  }
}

Widget _buildStatusIcon(BuildContext context, Ad ad) {
  switch (ad.status) {
    case 0:
      {
        if (ad.approved == "0")
          return _buildPopupMenuButton(context, ad, Icon(Icons.stop));
        if (ad.approved == "1")
          return _buildPopupMenuButton(context, ad, Icon(Icons.access_time));
        if (ad.approved == "2")
          return _buildPopupMenuButton(context, ad, Icon(Icons.stop));
        if (ad.approved == "3")
          return _buildPopupMenuButton(
              context, ad, Icon(Icons.block, color: Colors.red[200]));
        break;
      }
    case 1:
      {
        if (ad.approved == "0")
          return _buildPopupMenuButton(context, ad, Icon(Icons.stop));
        if (ad.approved == "1")
          return _buildPopupMenuButton(context, ad, Icon(Icons.access_time));
        if (ad.approved == "2")
          return _buildPopupMenuButton(
              context, ad, Icon(Icons.play_arrow, color: Colors.green[200]));
        if (ad.approved == "3")
          return _buildPopupMenuButton(context, ad, Icon(Icons.block));
        break;
      }
    case 2:
      {
        return _buildPopupMenuButton(context, ad, Icon(Icons.delete));
        break;
      }
    default:
      return _buildPopupMenuButton(context, ad, Icon(Icons.report_problem));
  }
}

Widget _buildPopupMenuButton(BuildContext context, Ad ad, Icon icon) {
  AdsBloc bloc = BlocProvider.of<AdsBloc>(context);
  ApplicationBloc appBloc = BlocProvider.of<ApplicationBloc>(context);

  return Container(
    width: 35,
    height: 35,
    child: PopupMenuButton(
        child: icon,
        itemBuilder: (_) => <PopupMenuItem<int>>[
              PopupMenuItem<int>(
                  child: Row(
                    children: [
                      Icon(Icons.play_arrow, color: Colors.green[200]),
                      const Text('  Запустить'),
                    ],
                  ),
                  value: 1),
              PopupMenuItem<int>(
                  child: Row(
                    children: [
                      Icon(Icons.stop, color: Colors.red[200]),
                      const Text('  Остановить'),
                    ],
                  ),
                  value: 0),
            ],
        onSelected: (status) {
          bloc.getUpdateAds.add(UpdateAdsRequest(
              appBloc.vkAccessToken, appBloc.currentAccount, ad, status));
          final req = AdsRequest(appBloc.vkAccessToken, appBloc.currentAccount,
              appBloc.currentCampaign, appBloc.currentClient);
          bloc.getAdsList.add(req);
        }),
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
  ).whenComplete(() {
    ApplicationBloc appBloc = BlocProvider.of<ApplicationBloc>(context);
    AdsBloc bloc = BlocProvider.of<AdsBloc>(context);
    final req = AdsRequest(appBloc.vkAccessToken, appBloc.currentAccount,
        appBloc.currentCampaign, appBloc.currentClient);
    bloc.getAdsList.add(req);
  });
}
