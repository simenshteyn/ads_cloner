import 'package:ads_cloner/api/error_check.dart';
import 'package:ads_cloner/blocs/campaigns_bloc.dart';
import 'package:ads_cloner/models/accounts_list.dart';
import 'package:ads_cloner/pages/campaigns_page.dart';
import 'package:flutter/material.dart';
import 'package:ads_cloner/blocs/bloc_provider.dart';
import 'package:ads_cloner/blocs/application_bloc.dart';
import 'package:ads_cloner/blocs/accounts_bloc.dart';

class AccountsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AccountsPageSnackbar(),
    );
  }
}

class AccountsPageSnackbar extends StatefulWidget {
  @override
  _AccountsPageSnackbarState createState() => _AccountsPageSnackbarState();
}

class _AccountsPageSnackbarState extends State<AccountsPageSnackbar> {
  @override
  void initState() {
    super.initState();
    ApplicationBloc appBloc = BlocProvider.of<ApplicationBloc>(context);
    AccountsBloc bloc = BlocProvider.of<AccountsBloc>(context);
    bloc.getAccountsList.add(appBloc.vkAccessToken);
    appBloc.outWarningMessage.forEach((e) {
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text('${e}'),
        backgroundColor: Colors.red,
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    ApplicationBloc appBloc = BlocProvider.of<ApplicationBloc>(context);
    AccountsBloc bloc = BlocProvider.of<AccountsBloc>(context);
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
                return apiResponseHasError(snapshot)
                    ? showError(snapshot, context)
                    : ListView.builder(
                        itemCount: snapshot.data.accounts.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ListTile(
                            leading: Icon(Icons.account_circle),
                            title:
                                Text(snapshot.data.accounts[index].accountName),
                            trailing: Icon(Icons.keyboard_arrow_right),
                            onTap: () {
                              appBloc.inCurrentAccount
                                  .add(snapshot.data.accounts[index]);
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
