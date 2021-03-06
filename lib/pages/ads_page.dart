import 'package:SmmHub/api/error_check.dart';
import 'package:SmmHub/blocs/ad_preview_bloc.dart';
import 'package:SmmHub/blocs/ads_bloc.dart';
import 'package:SmmHub/models/ad.dart';
import 'package:SmmHub/models/ads_request.dart';
import 'package:SmmHub/models/delete_ads_request.dart';
import 'package:SmmHub/models/update_ads_request.dart';
import 'package:SmmHub/pages/ad_preview_page.dart';
import 'package:flutter/material.dart';
import 'package:SmmHub/blocs/bloc_provider.dart';
import 'package:SmmHub/blocs/application_bloc.dart';
import 'package:SmmHub/models/ads_list.dart';
import 'package:flutter/services.dart';

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
    _enableLandscapeOrientation();
    ApplicationBloc appBloc = BlocProvider.of<ApplicationBloc>(context);
    AdsBloc bloc = BlocProvider.of<AdsBloc>(context);
    bloc.getAdsList.add(AdsRequest(
        appBloc.vkAccessToken,
        appBloc.currentAccount,
        appBloc.currentCampaign,
        appBloc.currentClient));

    bloc.outWarningMessage.forEach((e) {
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
        bloc.inWarningMessage.add(
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
  void dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
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
                    ? showErrorOnCurrentPage(context, snapshot, bloc)
                    : RefreshIndicator(
                        onRefresh: () => _refresh(context),
                        child: _buildVerticalAdsList(context, snapshot),
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

Widget _buildVerticalAdsList(BuildContext context, AsyncSnapshot snapshot) {
  ApplicationBloc appBloc = BlocProvider.of<ApplicationBloc>(context);
  AdsBloc bloc = BlocProvider.of<AdsBloc>(context);
  return ListView.builder(
      itemCount: snapshot.data.ads.length,
      itemBuilder: (BuildContext context, int index) {
        return Dismissible(
          direction: DismissDirection.endToStart,
          key: UniqueKey(),
          onDismissed: (DismissDirection direction) {
            print('dismissed ${snapshot.data.ads[index]}');
            bloc.getDeleteAds.add(DeleteAdsRequest(appBloc.vkAccessToken,
                appBloc.currentAccount, snapshot.data.ads[index]));
          },
          background: Container(
            color: Colors.red[400],
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text('Архивировать', style: TextStyle(color: Colors.white)),
                  Icon(Icons.archive, color: Colors.white),
                ],
              ),
            ),
          ),
          child: ListTile(
            leading: _buildStatusIcon(context, snapshot.data.ads[index]),
            title: Text(snapshot.data.ads[index].name),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {
              appBloc.inCurrentAd.add(snapshot.data.ads[index]);
              _openAdPreviewPage(context);
            },
            onLongPress: () {},
          ),
        );
      });
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

void _enableLandscapeOrientation() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeRight,
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
}

void _openAdPreviewPage(BuildContext context) {
  ApplicationBloc appBloc = BlocProvider.of<ApplicationBloc>(context);
  AdsBloc bloc = BlocProvider.of<AdsBloc>(context);

  Navigator.of(context).push(
    MaterialPageRoute(builder: (BuildContext context) {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
      return BlocProvider<AdPreviewBloc>(
        bloc: AdPreviewBloc(),
        child: AdPreviewPage(),
      );
    }),
  ).whenComplete(() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    final req = AdsRequest(appBloc.vkAccessToken, appBloc.currentAccount,
        appBloc.currentCampaign, appBloc.currentClient);
    bloc.getAdsList.add(req);
  });
}
