import 'package:ads_cloner/blocs/application_bloc.dart';
import 'package:ads_cloner/blocs/bloc_provider.dart';
import 'package:ads_cloner/models/ad.dart';
import 'package:flutter/material.dart';

class AdInfoWidget extends StatelessWidget {
  final TextStyle _textStyleUp = TextStyle(
      color: Colors.grey, fontWeight: FontWeight.w300, fontSize: 14.0);
  final TextStyle _textStyleDown = TextStyle(
      color: Colors.black, fontWeight: FontWeight.normal, fontSize: 17.0);

  @override
  Widget build(BuildContext context) {
    ApplicationBloc appBloc = BlocProvider.of<ApplicationBloc>(context);
    return SingleChildScrollView(
      child: StreamBuilder<Ad>(
          stream: appBloc.outCurrentAd,
          initialData: appBloc.currentAd,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ExpansionTile(
                title: Text(
                  'Название объявления',
                  style: _textStyleUp,
                  textAlign: TextAlign.center,
                ),
                subtitle: Text(
                  snapshot.data.name,
                  style: _textStyleDown,
                  textAlign: TextAlign.center,
                ),
                children: <Widget>[
                  Divider(),
                  ListTile(
                    title: Text('Название кампании', style: _textStyleUp),
                    subtitle: Text(appBloc.currentCampaign.name,
                        style: _textStyleDown),
                  ),
                  ListTile(
                    title: Text('Дневной лимит', style: _textStyleUp),
                    subtitle: Text(
                        snapshot.data.dayLimit == '0'
                            ? "Не задан"
                            : snapshot.data.dayLimit,
                        style: _textStyleDown),
                  ),
                  ListTile(
                    title: Text('Лимит объявления', style: _textStyleUp),
                    subtitle: Text(
                        snapshot.data.allLimit == '0'
                            ? "Не задан"
                            : '${appBloc.currentAd.allLimit} ₽',
                        style: _textStyleDown),
                  ),
                  ListTile(
                    title: Text('Цена за 1000 показов', style: _textStyleUp),
                    subtitle: Text(
                        //'${snapshot.data.cpm.substring(0, snapshot.data.cpm.length - 2)}.${snapshot.data.cpm.substring(snapshot.data.cpm.length - 2)} ₽',
                        '${snapshot.data.cpm}',
                        style: _textStyleDown),
                  ),
                ],
              );
            }
            return Center(child: CircularProgressIndicator());
          }),
    );
  }
}
