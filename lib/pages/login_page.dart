import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_vk_sdk/flutter_vk_sdk.dart';
import 'package:flutter_vk_sdk/vk_scope.dart';

class LoginPage extends StatelessWidget {
  void vkLogin() async {
    FlutterVKSdk.login(
        scope: '${VKScope.ads}, ${VKScope.offline}',
        onSuccess: (res) {
          print('login is ok');
        },
        onError: (error) {
          print('LOGIN ERROR: $error}');
        });
  }

  @override
  Widget build(BuildContext context) {
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
              onPressed: vkLogin,
              child: Text(
                'Login VK',
                style: TextStyle(fontSize: 20.0),
              ),
            )
          ],
        ),
      ),
    );
  }
}
