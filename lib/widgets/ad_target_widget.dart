import 'package:ads_cloner/blocs/application_bloc.dart';
import 'package:ads_cloner/blocs/bloc_provider.dart';
import 'package:ads_cloner/models/ad_targeting.dart';
import 'package:flutter/material.dart';

class AdTargetWidget extends StatelessWidget {
  AdTargeting target;
  AdTargetWidget(this.target);
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
              Divider(),
            ],
          ),
        ],
      ),
    );
  }
}
