import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_vk_sdk/flutter_vk_sdk.dart';
import 'package:flutter_vk_sdk/models/vk_access_token.dart';
import 'package:flutter_vk_sdk/vk_scope.dart';
import 'package:ads_cloner/blocs/bloc_provider.dart';
import 'package:ads_cloner/blocs/login_bloc.dart';
import 'package:ads_cloner/blocs/accounts_bloc.dart';
import 'package:ads_cloner/pages/accounts_page.dart';
import 'package:ads_cloner/blocs/application_bloc.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ApplicationBloc applicationBloc = BlocProvider.of<ApplicationBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Ads Cloner'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton(
              color: Colors.blue,
              textColor: Colors.white,
              onPressed: () {
                vkLogin(context, applicationBloc);
              },
              child: Text(
                'Login VK',
                style: TextStyle(fontSize: 20.0),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void vkLogin(BuildContext context, ApplicationBloc bloc) {
    FlutterVKSdk.login(
        scope: '${VKScope.ads}, ${VKScope.offline}',
        onSuccess: (VKAccessToken token) async {
          bloc.inVkAccessToken.add(token);
          _openAccountsPage(context);          
        },
        onError: (error) {
          print('LOGIN ERROR: $error}');
        });
  }

  void _openAccountsPage(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (BuildContext context) {
        return BlocProvider<AccountsBloc>(
          bloc: AccountsBloc(),
          child: AccountsPage(),
        );
      }),
    );
  }
}
