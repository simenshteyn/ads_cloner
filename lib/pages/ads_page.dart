import 'package:ads_cloner/api/error_check.dart';
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
    final req = AdsRequest(
        appBloc.vkAccessToken, appBloc.currentAccount, appBloc.currentCampaign, appBloc.currentClient);
    bloc.getAdsList.add(req);
    appBloc.outWarningMessage.forEach((e) {
      if (context != null) {
        _showSnackBar('${e}', context);
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
                    : ListView.builder(
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
                        });
              }
              return Center(child: CircularProgressIndicator());
            }),
      ),
    );
  }
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
    final req = AdsRequest(
        appBloc.vkAccessToken, appBloc.currentAccount, appBloc.currentCampaign, appBloc.currentClient);
    bloc.getAdsList.add(req);
  });
}
