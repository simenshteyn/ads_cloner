import 'package:ads_cloner/api/clone_factory.dart';
import 'package:ads_cloner/blocs/ad_preview_bloc.dart';
import 'package:ads_cloner/blocs/bloc_provider.dart';
import 'package:flutter/material.dart';

class OptionCard {
  String title;
  CloneType type;
  OptionCard({this.title, this.type});
}
