import 'package:ads_cloner/blocs/campaigns_bloc.dart';
import 'package:ads_cloner/blocs/login_bloc.dart';
import 'package:ads_cloner/models/accounts_list.dart';
import 'package:ads_cloner/pages/campaigns_page.dart';
import 'package:flutter/material.dart';
import 'package:ads_cloner/blocs/bloc_provider.dart';
import 'package:ads_cloner/blocs/application_bloc.dart';
import 'package:ads_cloner/blocs/accounts_bloc.dart';
import 'package:flutter_vk_sdk/models/vk_access_token.dart';

class AccountsPage extends StatefulWidget {
  @override
  _AccountsPageState createState() => _AccountsPageState();
}

class _AccountsPageState extends State<AccountsPage> {
  @override
  void initState() {
    super.initState();
    ApplicationBloc appBloc = BlocProvider.of<ApplicationBloc>(context);
    AccountsBloc bloc = BlocProvider.of<AccountsBloc>(context);
    bloc.getAccountsList.add(appBloc.vkAccessToken);
  }

  @override
  Widget build(BuildContext context) {
    ApplicationBloc appBloc = BlocProvider.of<ApplicationBloc>(context);
    AccountsBloc bloc = BlocProvider.of<AccountsBloc>(context);
    //bloc.getAccountsList.add(appBloc.vkAccessToken);
    return Scaffold(
      appBar: AppBar(
        title: Text('Рекламные аккаунты'),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: StreamBuilder<AccountsList>(
            stream: bloc.outAccountsList,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data.accounts.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      leading: Icon(Icons.account_circle),
                      title: Text(snapshot.data.accounts[index].accountName),
                      trailing: Icon(Icons.keyboard_arrow_right),
                      onTap: () {
                        appBloc.inCurrentAccount
                            .add(snapshot.data.accounts[index]);
                        print('Account tapped index is ${index}');
                        _openCampaignsPage(context);
                      },
                    );
                  },
                );
              }
              return Center(child: CircularProgressIndicator());
            }),
      ),
    );
  }

  void _openCampaignsPage(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (BuildContext context) {
        return BlocProvider<CampaignsBloc>(
          bloc: CampaignsBloc(),
          child: CampaignsPage(),
        );
      }),
    );
  }
}
