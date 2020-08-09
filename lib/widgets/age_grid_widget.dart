import 'dart:io';

import 'package:ads_cloner/models/age_range.dart';
import 'package:flutter/material.dart';

class AgeGridWidget extends StatelessWidget {
  List<AgeRange> ageList;
  AgeGridWidget(this.ageList);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      primary: false,
      padding: const EdgeInsets.all(4),
      crossAxisSpacing: 4,
      mainAxisSpacing: 4,
      crossAxisCount: 3,
      children: _showAgeList(ageList),
    );
  }

  List<Widget> _showAgeList(List<AgeRange> ageList) {
    List<Widget> lst = [];
    for (var age in ageList) {
      final widget = Container(
        margin: const EdgeInsets.all(15.0),
        //padding: const EdgeInsets.all(3.0),
        decoration: BoxDecoration(border: Border.all(color: Colors.blueAccent)),
        alignment: Alignment.center,
        padding: const EdgeInsets.all(8),
        child: Text('${age.startAge}—${age.endAge}'),
      );
      lst.add(widget);
    }
    return lst;
  }
}
