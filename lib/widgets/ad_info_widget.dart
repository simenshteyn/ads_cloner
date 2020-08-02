import 'package:ads_cloner/blocs/application_bloc.dart';
import 'package:ads_cloner/blocs/bloc_provider.dart';
import 'package:ads_cloner/models/ad.dart';
import 'package:flutter/material.dart';

class AdInfoWidget extends StatelessWidget {
  final TextStyle _textStyleUp = TextStyle(
      color: Colors.grey, fontWeight: FontWeight.w300, fontSize: 12.0);
  final TextStyle _textStyleDown = TextStyle(
      color: Colors.black, fontWeight: FontWeight.normal, fontSize: 14.0);

  @override
  Widget build(BuildContext context) {
    ApplicationBloc appBloc = BlocProvider.of<ApplicationBloc>(context);
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          ExpansionTile(
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
              Table(children: [
                TableRow(children: [
                  ListTile(
                    dense: true,
                    title: Text('Название кампании', style: _textStyleUp),
                    subtitle: Text(appBloc.currentCampaign.name,
                        style: _textStyleDown),
                  ),
                  ListTile(
                    dense: true,
                    title: Text('Расписание', style: _textStyleUp),
                    subtitle: Text(
                        appBloc.currentAd?.startTime == '0'
                            ? "Не установлено"
                            //: '${snapshot.data.weeklyScheduleHours}', //Need to do convertor
                            : "Есть",
                        style: _textStyleDown),
                  ),
                ]),
                TableRow(children: [
                  ListTile(
                    dense: true,
                    title: Text('Дневной лимит', style: _textStyleUp),
                    subtitle: Text(
                        appBloc.currentAd?.dayLimit == '0'
                            ? "Не задан"
                            : '${appBloc.currentAd.dayLimit} ₽',
                        style: _textStyleDown),
                  ),
                  ListTile(
                    dense: true,
                    title: Text('Рекламные площадки', style: _textStyleUp),
                    subtitle: Text(
                        appBloc.currentAd?.adPlatform == null
                            ? "Не заданы"
                            : '${appBloc.currentAd.adPlatform}',
                        style: _textStyleDown),
                  ),
                ]),
                TableRow(children: [
                  ListTile(
                    dense: true,
                    title: Text('Лимит объявления', style: _textStyleUp),
                    subtitle: Text(
                        appBloc.currentAd?.allLimit == '0'
                            ? "Не задан"
                            : '${appBloc.currentAd.allLimit} ₽',
                        style: _textStyleDown),
                  ),
                  ListTile(
                    dense: true,
                    title: Text('Ограничение показов', style: _textStyleUp),
                    subtitle: Text(
                        appBloc.currentAd?.impressionsLimit == null
                            ? "Не задано"
                            : '${appBloc.currentAd.impressionsLimit}',
                        style: _textStyleDown),
                  ),
                ]),
                TableRow(children: [
                  //Text('some text'),
                  appBloc.currentAd.getClickInfoWidget,
                  ListTile(
                    dense: true,
                    title: Text('Тематики', style: _textStyleUp),
                    subtitle: Text(
                        appBloc.currentAd.category1Id == '0'
                            ? "Не задано"
                            : '${appBloc.currentAd.category1Id}',
                        style: _textStyleDown),
                  ),
                ]),
                TableRow(children: [
                  ListTile(
                    dense: true,
                    title: Text('Дата запуска', style: _textStyleUp),
                    subtitle: Text(
                        appBloc.currentAd?.startTime == '0'
                            ? "Не задана"
                            : '${appBloc.currentAd.startTime}',
                        style: _textStyleDown),
                  ),
                  ListTile(
                    dense: true,
                    title: Text('Сохранение аудитории', style: _textStyleUp),
                    subtitle: Text(
                        appBloc.currentAd?.eventsRetargetingGroups == null
                            ? "Не задано"
                            : '${appBloc.currentAd.eventsRetargetingGroups}',
                        style: _textStyleDown),
                  ),
                ]),
                TableRow(children: [
                  ListTile(
                    dense: true,
                    title: Text('Дата остановки', style: _textStyleUp),
                    subtitle: Text(
                        appBloc.currentAd?.stopTime == '0'
                            ? "Не задана"
                            : '${appBloc.currentAd.stopTime}',
                        style: _textStyleDown),
                  ),
                  ListTile(
                    dense: true,
                    title: Text('Дата создания', style: _textStyleUp),
                    subtitle: Text(
                        appBloc.currentAd?.createTime == '0'
                            ? "Не задана"
                            : _timestampToDate(appBloc.currentAd.createTime),
                        style: _textStyleDown),
                  ),
                ]),
              ]),
            ],
          ),
        ],
      ),
    );
  }

  String _timestampToDate(String timestampString) {
    var date = DateTime.fromMillisecondsSinceEpoch(
        int.tryParse(timestampString) * 1000);
    return "${date.year.toString()}.${date.month.toString().padLeft(2, '0')}."
        "${date.day.toString().padLeft(2, '0')} в "
        "${date.hour.toString().padLeft(2, '0')}:"
        "${date.minute.toString().padLeft(2, '0')}";
  }
}
