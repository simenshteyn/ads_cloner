import 'package:ads_cloner/api/error_check.dart';
import 'package:ads_cloner/blocs/application_bloc.dart';
import 'package:ads_cloner/blocs/bloc_provider.dart';
import 'package:ads_cloner/blocs/campaigns_bloc.dart';
import 'package:ads_cloner/blocs/clients_bloc.dart';
import 'package:ads_cloner/models/clients_list.dart';
import 'package:ads_cloner/models/clients_request.dart';
import 'package:ads_cloner/pages/campaigns_page.dart';
import 'package:flutter/material.dart';

class ClientsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ApplicationBloc appBloc = BlocProvider.of<ApplicationBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(appBloc.currentAccount.accountName),
      ),
      body: ClientsPageSnackbar(),
    );
  }
}

class ClientsPageSnackbar extends StatefulWidget {
  @override
  _ClientsPageSnackbarState createState() => _ClientsPageSnackbarState();
}

class _ClientsPageSnackbarState extends State<ClientsPageSnackbar> {
  @override
  void initState() {
    super.initState();
    ApplicationBloc appBloc = BlocProvider.of<ApplicationBloc>(context);
    ClientsBloc bloc = BlocProvider.of<ClientsBloc>(context);
    bloc.getClientsList
        .add(ClientsRequest(appBloc.vkAccessToken, appBloc.currentAccount));
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
    ApplicationBloc appBloc = BlocProvider.of<ApplicationBloc>(context);
    ClientsBloc bloc = BlocProvider.of<ClientsBloc>(context);

    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: StreamBuilder<ClientsList>(
          stream: bloc.outClientsList,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              if (apiResponseHasError(snapshot)) {
                bloc.inWarningMessage.add(
                    'Ошибка ${snapshot.data.errorResponse.errorCode}: ${snapshot.data.errorResponse.errorMsg}');
                return Container();
              }
              return ListView.builder(
                itemCount: snapshot.data.clients.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    leading: Icon(Icons.business_center),
                    title: Text(snapshot.data.clients[index].name),
                    trailing: Icon(Icons.keyboard_arrow_right),
                    onTap: () {
                      appBloc.inCurrentClient.add(snapshot.data.clients[index]);
                      _openCampaignsPage(context);
                    },
                  );
                },
              );
            }
            return Center(child: CircularProgressIndicator());
          }),
    );
    //);
  }

  void _openCampaignsPage(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (BuildContext context) {
        return BlocProvider<CampaignsBloc>(
          bloc: CampaignsBloc(),
          child: CampaignsPage(),
        );
      }),
    ).whenComplete(() {
      ApplicationBloc appBloc = BlocProvider.of<ApplicationBloc>(context);
      appBloc.inCurrentClient.add(null);
    });
  }
}
