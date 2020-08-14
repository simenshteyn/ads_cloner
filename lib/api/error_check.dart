import 'dart:async';

import 'package:SmmHub/blocs/application_bloc.dart';
import 'package:SmmHub/blocs/bloc_provider.dart';
import 'package:flutter/material.dart';

bool apiResponseHasError(snapshot) {
  return (snapshot.data?.errorResponse != null) ? true : false;
}

Widget showErrorOnCurrentPage(
    BuildContext context, AsyncSnapshot snapshot, BlocWithPageNotifier bloc) {
  bloc.inWarningMessage.add(
      'Ошибка ${snapshot.data.errorResponse.errorCode}: ${snapshot.data.errorResponse.errorMsg}');
  return Container();
}

bool createAdApiResponseHasError(snapshot) {
  return (snapshot.data?.createAdsResultList[0]?.errorCode != null)
      ? true
      : false;
}

Widget createAdShowError(
    BuildContext context, AsyncSnapshot snapshot, BlocWithPageNotifier bloc) {
  bloc.inWarningMessage.add(
      'Ошибка ${snapshot.data.createAdsResultList[0].errorCode}: ${snapshot.data.createAdsResultList[0].errorDesc}');
  return Container();
}

abstract class BlocWithPageNotifier {
  StreamSink<String> get inWarningMessage;
  Stream<String> get outWarningMessage;
}
