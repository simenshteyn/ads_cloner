import 'package:ads_cloner/blocs/application_bloc.dart';
import 'package:ads_cloner/blocs/bloc_provider.dart';
import 'package:flutter/material.dart';

bool apiResponseHasError(snapshot) {
  return (snapshot.data?.errorResponse != null) ? true : false;
}

Widget showError(snapshot, BuildContext context) {
  ApplicationBloc appBloc = BlocProvider.of<ApplicationBloc>(context);
  appBloc.inWarningMessage.add(
      'Ошибка ${snapshot.data.errorResponse.errorCode}: ${snapshot.data.errorResponse.errorMsg}');

  return Container();
}
