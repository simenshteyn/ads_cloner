import 'package:ads_cloner/blocs/application_bloc.dart';
import 'package:ads_cloner/blocs/bloc_provider.dart';
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
      child: ExpansionTile(
        title: Text(
          'Название объявления',
          style: _textStyleUp,
          textAlign: TextAlign.center,
        ),
        subtitle: Text(
          appBloc.currentAd.name,
          style: _textStyleDown,
          textAlign: TextAlign.center,
        ),
        children: <Widget>[
          Divider(),
          ListTile(
            title: Text('Название кампании',
                style: _textStyleUp),
            subtitle: Text(appBloc.currentCampaign.name,
                style: _textStyleDown),
          ),
          ListTile(
            title: Text('Дневной лимит',
                style: _textStyleUp),
            subtitle: Text(
                appBloc.currentAd.dayLimit == '0'
                    ? "Не задан"
                    : appBloc.currentAd.dayLimit,
                style: _textStyleDown),
          ),
          ListTile(
            title: Text('Лимит объявления',
                style: _textStyleUp),
            subtitle: Text(
                appBloc.currentAd.allLimit == '0'
                    ? "Не задан"
                    : '${appBloc.currentAd.allLimit} ₽',
                style: _textStyleDown),
          ),
          ListTile(
            title: Text('Цена за 1000 показов',
                style: _textStyleUp),
            subtitle: Text(appBloc.currentAd.cpm,
                style: _textStyleDown),
          ),
        ],
      ),
    );
  }
}
