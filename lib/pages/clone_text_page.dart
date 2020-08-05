import 'package:ads_cloner/api/clone_factory.dart';
import 'package:ads_cloner/api/vk_api.dart';
import 'package:ads_cloner/blocs/application_bloc.dart';
import 'package:ads_cloner/blocs/bloc_provider.dart';
import 'package:ads_cloner/blocs/clone_text_bloc.dart';
import 'package:ads_cloner/models/create_ads_list.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart';

class CloneTextPage extends StatefulWidget {
  @override
  _CloneTextPageState createState() => _CloneTextPageState();
}

class _CloneTextPageState extends State<CloneTextPage> {
  bool _isLoading = false;
  bool _isClickable = true;
  bool _validateInput = false;
  String _textField;
  final _textController = TextEditingController();
  List<String> _cloneTextList;
  CloneFactory adsFactory;
  CreateAdsList createAdsList;

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _textController.addListener(_saveLastValue);
    ApplicationBloc appBloc = BlocProvider.of<ApplicationBloc>(context);
    final vk = VkApi(userToken: appBloc.vkAccessToken.token);
    adsFactory = CloneFactory(vk);
    createAdsList = CreateAdsList([]);
  }

  @override
  Widget build(BuildContext context) {
    ApplicationBloc appBloc = BlocProvider.of<ApplicationBloc>(context);
    CloneTextBloc bloc = BlocProvider.of<CloneTextBloc>(context);

    return Scaffold(
        appBar: AppBar(
          title: Text('Варианты текстов'),
        ),
        body: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextField(
                keyboardType: TextInputType.multiline,
                maxLines: null,
                controller: _textController,
                autofocus: true,
                decoration: InputDecoration(
                  errorText: _validateInput ? "Некорректный ввод" : null,
                  hintText: 'Введите текст',
                  suffix: IconButton(
                    icon: Icon(Icons.add),
                    onPressed: () {
                      switch (appBloc.currentAd.adFormat) {
                        case 11:
                          {
                            if ((_textField != "") &&
                                (_textField.length > 2) &&
                                (_textField.length <= 90)) {
                              setState(() {
                                _validateInput = false;
                              });
                              bloc.addTextToList.add(_textField);
                              _textController.clear();
                            } else {
                              setState(() {
                                _validateInput = true;
                              });
                            }
                            break;
                          }
                        default:
                          {
                            if (_textField != "") {
                              bloc.addTextToList.add(_textField);
                              _textController.clear();
                            }
                          }
                      }
                    },
                  ),
                ),
              ),
            ),
            Flexible(
              child: StreamBuilder<List<String>>(
                  stream: bloc.outTextList,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      _cloneTextList = snapshot.data;
                      return ListView.separated(
                        separatorBuilder: (BuildContext context, int index) =>
                            Divider(),
                        itemCount: snapshot.data.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ListTile(
                            title: Text(snapshot.data[index]),
                          );
                        },
                      );
                    }
                    return Center(
                      child: Text('Вариантов пока нет…'),
                    );
                  }),
            ),
          ],
        ),
        floatingActionButton: StreamBuilder<List<String>>(
            stream: bloc.outTextList,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                int badgeText = snapshot.data.length;
                return Badge(
                  animationType: BadgeAnimationType.scale,
                  badgeContent: Text(badgeText.toString(),
                      style: TextStyle(color: Colors.white)),
                  position: BadgePosition.topRight(top: -3, right: -3),
                  child: FloatingActionButton(
                    child: _isLoading
                        ? Center(
                            child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                    Colors.white)))
                        : Icon(Icons.send),
                    onPressed: () async {
                      setState(() {
                        _isLoading = true;
                      });
                      if (_isClickable) {
                        _isClickable = false;
                        for (var text in snapshot.data) {
                          var cloneTask =
                              CloneTask(type: CloneType.text, value: text);
                          var createdAd = await adsFactory.buildAd(
                              appBloc.currentAd,
                              appBloc.currentAdTargeting,
                              appBloc.currentAdLayout,
                              appBloc.currentWallPost,
                              cloneTask);
                          createAdsList.appendAd(createdAd);
                        }
                        appBloc.inCurrentCreateAdsList.add(createAdsList);
                        Navigator.pop(context);
                      }
                    },
                  ),
                );
              }
              return Container();
            }));
  }

  void _saveLastValue() {
    _textField = _textController.text;
  }
}
