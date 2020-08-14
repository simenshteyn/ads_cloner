import 'package:ads_cloner/blocs/application_bloc.dart';
import 'package:ads_cloner/blocs/bloc_provider.dart';
import 'package:ads_cloner/blocs/clone_bloc.dart';
import 'package:ads_cloner/models/create_ads_list.dart';
import 'package:ads_cloner/models/create_ads_request.dart';
import 'package:ads_cloner/models/create_ads_result_list.dart';
import 'package:ads_cloner/models/wall_post_list.dart';
import 'package:ads_cloner/models/wall_post_request.dart';
import 'package:flutter/material.dart';
import 'package:ads_cloner/widgets/clone_options_widget.dart';
import 'package:ads_cloner/api/error_check.dart';

class ClonePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ClonePageSnackbar(),
    );
  }
}

class ClonePageSnackbar extends StatefulWidget {
  @override
  _ClonePageSnackbarState createState() => _ClonePageSnackbarState();
}

class _ClonePageSnackbarState extends State<ClonePageSnackbar> {
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    ApplicationBloc appBloc = BlocProvider.of<ApplicationBloc>(context);
    CloneBloc bloc = BlocProvider.of<CloneBloc>(context);
    bloc.getWallPostList
        .add(WallPostRequest(appBloc.vkAccessToken, appBloc.currentPostId));
    appBloc.getCurrentCreateAdsList.add('give me');

    bloc.outCreateAdsResultList.forEach((event) {
      if (event.createAdsResultList[0].errorCode == null) {
        Scaffold.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.green,
          content:
              Text('Создано объявлений: ${event.createAdsResultList.length}'),
          action: SnackBarAction(
            textColor: Colors.white,
            label: 'Открыть',
            onPressed: () {
              var nav = Navigator.of(context);
              nav.pop();
              nav.pop();
            },
          ),
        ));
      }
    });

    bloc.outWallPostList.forEach((e) {
      if ((appBloc.currentAd.isWallPostFormat) && (e.wallPosts.length == 0)) {
        Scaffold.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.red,
          content: Text('Нельзя клонировать удаленный пост'),
          action: SnackBarAction(
            textColor: Colors.white,
            label: 'Назад',
            onPressed: () {
              var nav = Navigator.of(context);
              nav.pop();
              nav.pop();
            },
          ),
        ));
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
    ApplicationBloc appBloc = BlocProvider.of<ApplicationBloc>(context);
    CloneBloc bloc = BlocProvider.of<CloneBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Что клонируем?'),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
            child: CloneOptionsWidget(),
          ),
          StreamBuilder<WallPostList>(
              stream: bloc.outWallPostList,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  if (snapshot.data.isNotEmpty) {
                    var _currentWallPost = snapshot.data.wallPosts[0];
                    appBloc.inCurrentWallPost.add(_currentWallPost);
                    return Container(); //Text('${_currentWallPost.id}');
                  }
                }
                if (snapshot.hasError) {
                  bloc.inWarningMessage.add(snapshot.error.toString());
                }
                return Container();
              }),
          StreamBuilder<CreateAdsResultList>(
              stream: bloc.outCreateAdsResultList,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  if (createAdApiResponseHasError(snapshot)) {
                    appBloc.inCurrentCreateAdsList.add(CreateAdsList([]));
                    _isLoading = false;
                    return createAdShowError(context, snapshot, bloc);
                  } else {
                    appBloc.inCurrentCreateAdsList.add(CreateAdsList([]));
                    _isLoading = false;
                    return Container();
                  }

                  // appBloc.inCurrentCreateAdsList.add(CreateAdsList([]));
                  // _isLoading = false;
                  // return createAdApiResponseHasError(snapshot)
                  //     ? createAdShowError(snapshot, context)
                  //     : Container();
                }
                return Container();
              }),
          StreamBuilder<CreateAdsList>(
            stream: appBloc.outCurrentCreateAdsList,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                if (snapshot.data.isNotEmpty) {
                  return Expanded(
                    child: ListView.separated(
                        separatorBuilder: (BuildContext context, int index) =>
                            Divider(),
                        itemCount: snapshot.data.createAdsList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ListTile(
                            leading: Icon(Icons.content_copy),
                            title: Text('Объявление #${index + 1}'),
                            subtitle: Text(
                                '${snapshot.data.createAdsList[index]?.linkUrl}'),
                          );
                        }),
                  );
                }
              }
              return Flexible(
                  child: Center(child: Text('Создайте несколько вариантов…')));
            },
          ),
          StreamBuilder<CreateAdsList>(
              stream: appBloc.outCurrentCreateAdsList,
              builder: (context, snapshot) {
                if ((snapshot.hasData) && snapshot.data.isNotEmpty) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: FloatingActionButton.extended(
                      splashColor: Colors.blueAccent,
                      label: _isLoading
                          ? Center(
                              child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                      Colors.white)))
                          : Text('Клонировать',
                              style: TextStyle(fontSize: 18.0)),
                      onPressed: () async {
                        setState(() {
                          _isLoading = true;
                        });
                        _doneButtonPressed(context);
                      },
                    ),
                  );
                }
                return Container();
              }),
        ],
      ),
    );
  }

  void _doneButtonPressed(BuildContext cntx) {
    ApplicationBloc appBloc = BlocProvider.of<ApplicationBloc>(context);
    CloneBloc bloc = BlocProvider.of<CloneBloc>(context);
    var req = CreateAdsRequest(appBloc.vkAccessToken, appBloc.currentAccount,
        appBloc.currentCreateAdsList);
    bloc.getCreateAdsResultList.add(req);
    // appBloc.inCurrentCreateAdsList.add(CreateAdsList([]));
  }
}
