import 'package:SmmHub/models/users.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_vk_sdk/flutter_vk_sdk.dart';
import 'package:flutter_vk_sdk/models/vk_access_token.dart';
import 'package:flutter_vk_sdk/vk_scope.dart';
import 'package:SmmHub/blocs/bloc_provider.dart';
import 'package:SmmHub/blocs/login_bloc.dart';
import 'package:SmmHub/blocs/accounts_bloc.dart';
import 'package:SmmHub/pages/accounts_page.dart';
import 'package:SmmHub/blocs/application_bloc.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LoginPageSnackbar(),
    );
  }
}

class LoginPageSnackbar extends StatefulWidget {
  @override
  _LoginPageSnackbarState createState() => _LoginPageSnackbarState();
}

class _LoginPageSnackbarState extends State<LoginPageSnackbar> {
  @override
  void initState() {
    super.initState();
    LoginBloc bloc = BlocProvider.of<LoginBloc>(context);

    _checkLoggedIn().then((result) {
      if (result) {
        _getToken().then((token) {
          bloc.getUser.add(token);
        });
      }
    });

    bloc.outWarningMessage.forEach((e) {
      if (context != null) {
        _showSnackBar('${e}', context);
      }
    });
  }

  _showSnackBar(String text, BuildContext context) {
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text('${text}'),
      backgroundColor: Colors.red,
    ));
  }

  @override
  Widget build(BuildContext context) {
    final ApplicationBloc applicationBloc =
        BlocProvider.of<ApplicationBloc>(context);
    LoginBloc bloc = BlocProvider.of<LoginBloc>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Ads Cloner')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            StreamBuilder<Users>(
                stream: bloc.outUsers,
                builder: (BuildContext context, AsyncSnapshot<Users> snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 50,
                          backgroundImage:
                              NetworkImage(snapshot.data.result[0].photo100),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10, bottom: 20),
                          child: Text(
                              '${snapshot.data.result[0].firstName} ${snapshot.data.result[0].lastName}'),
                        ),
                      ],
                    );
                  }
                  return Container();
                }),
            FlatButton(
              color: Colors.red,
              textColor: Colors.white,
              padding: EdgeInsets.all(8.0),
              // child: Image.asset('lib/icon/vk.png'),
              onPressed: () {
                _vkLogin(context, applicationBloc);
              },
              child: Text(
                '????????????????????',
                style: TextStyle(fontSize: 16.0),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<bool> _checkLoggedIn() async {
    var isLoggedIn = await FlutterVKSdk.isLoggedIn();
    return isLoggedIn;
  }

  Future<VKAccessToken> _getToken() async {
    return await FlutterVKSdk.getAccessToken();
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

  Future<void> _vkLogin(BuildContext context, ApplicationBloc appBloc) async {
    LoginBloc bloc = BlocProvider.of<LoginBloc>(context);
    if (await _checkLoggedIn() == false) {
      FlutterVKSdk.login(
          scope: '${VKScope.ads}, ${VKScope.offline}, ${VKScope.photos}',
          onSuccess: (VKAccessToken token) async {
            appBloc.inVkAccessToken.add(token);
            _openAccountsPage(context);
          },
          onError: (error) {
            bloc.inWarningMessage.add('LOGIN ERROR: ${error}');
          });
    } else {
      print('Already logged in');
      VKAccessToken token = await FlutterVKSdk.getAccessToken();
      appBloc.inVkAccessToken.add(token);
      _openAccountsPage(context);
    }
  }
}
