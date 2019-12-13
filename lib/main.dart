import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_vk_sdk/flutter_vk_sdk.dart';
import 'package:ads_cloner/blocs/bloc_provider.dart';
import 'package:ads_cloner/blocs/application_bloc.dart';
import 'package:ads_cloner/blocs/login_bloc.dart';
import 'package:ads_cloner/pages/login_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  //FlutterVKSdk.init(appId: '7219294', apiVersion: '5.96');
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then(
    (_) => runApp(
      BlocProvider<ApplicationBloc>(
        bloc: ApplicationBloc(),
        child: MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ads Cloner Demo',
      home: BlocProvider<LoginBloc>(
        bloc: LoginBloc(),
        child: LoginPage(),
      ),
    );
  }
}
