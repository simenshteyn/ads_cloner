import 'package:ads_cloner/api/vk_api.dart';
import 'package:ads_cloner/blocs/application_bloc.dart';
import 'package:ads_cloner/blocs/bloc_provider.dart';
import 'package:ads_cloner/models/ad_targeting.dart';
import 'package:flutter/material.dart';

class AdTargetWidget extends StatelessWidget {
  AdTargeting target;
  VkApi vk;
  AdTargetWidget(this.target, this.vk);
  final TextStyle _textStyleUp = TextStyle(
      color: Colors.grey, fontWeight: FontWeight.w300, fontSize: 12.0);
  final TextStyle _textStyleDown = TextStyle(
      color: Colors.black, fontWeight: FontWeight.normal, fontSize: 14.0);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          ExpansionTile(
            title: Text(
              'Целевая аудитория',
              style: _textStyleUp,
              textAlign: TextAlign.center,
            ),
            subtitle: Text(
              '${target.count} человек',
              style: _textStyleDown,
              textAlign: TextAlign.center,
            ),
            children: <Widget>[
              (target.country != null)
                  ? ListTile(
                      title: Text('Страна', style: _textStyleUp),
                      subtitle:
                          Text(target.getCountryString, style: _textStyleDown),
                    )
                  : null,
              (target.sex != null)
                  ? ListTile(
                      title: Text('Пол', style: _textStyleUp),
                      subtitle: Text(target.sex, style: _textStyleDown),
                    )
                  : null,
              (target.ageFrom != null)
                  ? ListTile(
                      title: Text('Возраст от', style: _textStyleUp),
                      subtitle: Text(target.ageFrom, style: _textStyleDown),
                    )
                  : null,
              (target.ageTo != null)
                  ? ListTile(
                      title: Text('Возраст до', style: _textStyleUp),
                      subtitle: Text(target.ageTo, style: _textStyleDown),
                    )
                  : null,
              (target.birthday != null)
                  ? ListTile(
                      title: Text('День рождения', style: _textStyleUp),
                      subtitle: Text(target.birthday, style: _textStyleDown),
                    )
                  : null,
              (target.cities != null)
                  ? FutureBuilder<String>(
                      future: target.getCitiesString(vk),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return ListTile(
                            title: Text('Города', style: _textStyleUp),
                            subtitle:
                                Text(snapshot.data, style: _textStyleDown),
                          );
                        }
                        return Center(child: CircularProgressIndicator());
                      })
                  : null,
              (target.citiesNot != null)
                  ? FutureBuilder<String>(
                      future: target.getCitiesNotString(vk),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return ListTile(
                            title:
                                Text('Исключенные города', style: _textStyleUp),
                            subtitle:
                                Text(snapshot.data, style: _textStyleDown),
                          );
                        }
                        return Center(child: CircularProgressIndicator());
                      })
                  : null,
              (target.geoNear != null)
                  ? ListTile(
                      title: Text('Гео-таргетинг', style: _textStyleUp),
                      subtitle: Text(target.geoNear, style: _textStyleDown),
                    )
                  : null,
              (target.geoPointType != null)
                  ? ListTile(
                      title: Text('Тип гео', style: _textStyleUp),
                      subtitle:
                          Text(target.geoPointType, style: _textStyleDown),
                    )
                  : null,
              (target.statuses != null)
                  ? ListTile(
                      title: Text('Семейное положение', style: _textStyleUp),
                      subtitle: Text(target.statuses, style: _textStyleDown),
                    )
                  : null,
              (target.groups != null)
                  ? ListTile(
                      title: Text('Сообщества', style: _textStyleUp),
                      subtitle: Text(target.groups, style: _textStyleDown),
                    )
                  : null,
              (target.groupsNot != null)
                  ? ListTile(
                      title:
                          Text('Исключенные сообщества', style: _textStyleUp),
                      subtitle: Text(target.groupsNot, style: _textStyleDown),
                    )
                  : null,
              (target.groupsActive != null)
                  ? ListTile(
                      title:
                          Text('Активность в сообществах', style: _textStyleUp),
                      subtitle:
                          Text(target.groupsActive, style: _textStyleDown),
                    )
                  : null,
              (target.groupsActiveRecommended != null)
                  ? ListTile(
                      title: Text('Активность в сообществах расширенная',
                          style: _textStyleUp),
                      subtitle: Text(target.groupsActiveRecommended,
                          style: _textStyleDown),
                    )
                  : null,
              (target.groupsActiveFormula != null)
                  ? ListTile(
                      title: Text('Активность в сообществах по формуле',
                          style: _textStyleUp),
                      subtitle: Text(target.groupsActiveFormula,
                          style: _textStyleDown),
                    )
                  : null,
              (target.groupsRecommended != null)
                  ? ListTile(
                      title:
                          Text('Рекомендованные группы', style: _textStyleUp),
                      subtitle:
                          Text(target.groupsRecommended, style: _textStyleDown),
                    )
                  : null,
              (target.groupsFormula != null)
                  ? ListTile(
                      title: Text('Формула групп', style: _textStyleUp),
                      subtitle:
                          Text(target.groupsFormula, style: _textStyleDown),
                    )
                  : null,
              (target.apps != null)
                  ? ListTile(
                      title: Text('Приложения', style: _textStyleUp),
                      subtitle: Text(target.apps, style: _textStyleDown),
                    )
                  : null,
              (target.appsNot != null)
                  ? ListTile(
                      title:
                          Text('Исключенные приложения', style: _textStyleUp),
                      subtitle: Text(target.appsNot, style: _textStyleDown),
                    )
                  : null,
              (target.districts != null)
                  ? ListTile(
                      title: Text('Районы', style: _textStyleUp),
                      subtitle: Text(target.districts, style: _textStyleDown),
                    )
                  : null,
              (target.stations != null)
                  ? ListTile(
                      title: Text('Станции метро', style: _textStyleUp),
                      subtitle: Text(target.stations, style: _textStyleDown),
                    )
                  : null,
              (target.streets != null)
                  ? ListTile(
                      title: Text('Улицы', style: _textStyleUp),
                      subtitle: Text(target.streets, style: _textStyleDown),
                    )
                  : null,
              (target.schools != null)
                  ? ListTile(
                      title: Text('Учебные заведения', style: _textStyleUp),
                      subtitle: Text(target.schools, style: _textStyleDown),
                    )
                  : null,
              (target.positions != null)
                  ? ListTile(
                      title: Text('Должности', style: _textStyleUp),
                      subtitle: Text(target.positions, style: _textStyleDown),
                    )
                  : null,
              (target.religions != null)
                  ? ListTile(
                      title: Text('Религия', style: _textStyleUp),
                      subtitle: Text(target.religions, style: _textStyleDown),
                    )
                  : null,
              (target.interestCategories != null)
                  ? ListTile(
                      title: Text('Категории интересов', style: _textStyleUp),
                      subtitle: Text(target.getInterestsCategoriesString,
                          style: _textStyleDown),
                    )
                  : null,
              (target.interests != null)
                  ? ListTile(
                      title: Text('Интересы', style: _textStyleUp),
                      subtitle: Text(target.interests, style: _textStyleDown),
                    )
                  : null,
              (target.userDevices != null)
                  ? ListTile(
                      title: Text('Устройства', style: _textStyleUp),
                      subtitle: Text(target.userDevices, style: _textStyleDown),
                    )
                  : null,
              (target.userOs != null)
                  ? ListTile(
                      title: Text('Операционные системы', style: _textStyleUp),
                      subtitle: Text(target.userOs, style: _textStyleDown),
                    )
                  : null,
              (target.userBrowsers != null)
                  ? ListTile(
                      title: Text('Интернет-браузеры', style: _textStyleUp),
                      subtitle:
                          Text(target.userBrowsers, style: _textStyleDown),
                    )
                  : null,
              (target.retargetingGroups != null)
                  ? ListTile(
                      title: Text('Группы ретаргетинга', style: _textStyleUp),
                      subtitle:
                          Text(target.retargetingGroups, style: _textStyleDown),
                    )
                  : null,
              (target.retargetingGroupsNot != null)
                  ? ListTile(
                      title: Text('Исключенные группы ретаргетинга',
                          style: _textStyleUp),
                      subtitle: Text(target.retargetingGroupsNot,
                          style: _textStyleDown),
                    )
                  : null,
              (target.paying != null)
                  ? ListTile(
                      title: Text('Платили голосами ВК', style: _textStyleUp),
                      subtitle: Text(target.paying, style: _textStyleDown),
                    )
                  : null,
              (target.travellers != null)
                  ? ListTile(
                      title: Text('Путешественники', style: _textStyleUp),
                      subtitle: Text(target.travellers, style: _textStyleDown),
                    )
                  : null,
              (target.schoolFrom != null)
                  ? ListTile(
                      title: Text('Окончание школы от', style: _textStyleUp),
                      subtitle: Text(target.schoolFrom, style: _textStyleDown),
                    )
                  : null,
              (target.schoolTo != null)
                  ? ListTile(
                      title: Text('Окончание школы до', style: _textStyleUp),
                      subtitle: Text(target.schoolTo, style: _textStyleDown),
                    )
                  : null,
              (target.uniFrom != null)
                  ? ListTile(
                      title: Text('Окончание ВУЗа от', style: _textStyleUp),
                      subtitle: Text(target.uniFrom, style: _textStyleDown),
                    )
                  : null,
              (target.uniTo != null)
                  ? ListTile(
                      title: Text('Окончание ВУЗа до ', style: _textStyleUp),
                      subtitle: Text(target.uniTo, style: _textStyleDown),
                    )
                  : null,
            ]..removeWhere((widget) => widget == null),
          ),
        ],
      ),
    );
  }
}
