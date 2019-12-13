import 'package:ads_cloner/blocs/login_bloc.dart';
import 'package:ads_cloner/models/accounts_list.dart';
import 'package:flutter/material.dart';
import 'package:ads_cloner/blocs/bloc_provider.dart';
import 'package:ads_cloner/blocs/application_bloc.dart';
import 'package:ads_cloner/blocs/accounts_bloc.dart';
import 'package:flutter_vk_sdk/models/vk_access_token.dart';

class AccountsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ApplicationBloc appBloc = BlocProvider.of<ApplicationBloc>(context);
    AccountsBloc bloc = BlocProvider.of<AccountsBloc>(context);
    bloc.getAccountsList.add(appBloc.vkAccessToken);
    return Scaffold(
      appBar: AppBar(
        title: Text('Choose account'),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: StreamBuilder<AccountsList>(
            //initialData: loginBloc.accounts,
            stream: bloc.outAccountsList,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data.accounts.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                        title: Text(snapshot.data.accounts[index].accountName));
                  },
                );
              }
              return Center(child: CircularProgressIndicator());
            }),
      ),
    );
  }
}
