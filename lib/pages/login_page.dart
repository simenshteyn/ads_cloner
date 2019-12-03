import 'package:flutter/material.dart';
import 'dart:async';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ads Cloner'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            FlatButton(
              color: Colors.blue,
              textColor: Colors.white,
              onPressed: () {},
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
