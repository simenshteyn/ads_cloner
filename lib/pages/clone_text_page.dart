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
  String _textField;
  final _textController = TextEditingController();
  List<String> _cloneTextList;

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _textController.addListener(_saveLastValue);
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
                  hintText: 'Введите текст',
                  suffix: IconButton(
                    icon: Icon(Icons.add),
                    onPressed: () {
                      if (_textField != "") {
                        bloc.addTextToList.add(_textField);
                        _textController.clear();
                        //FocusScope.of(context).unfocus();
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
                    child: Icon(Icons.send),
                    onPressed: () async {
                      final vk = VkApi(userToken: appBloc.vkAccessToken.token);
                      print(vk);
                      print(appBloc.vkAccessToken.token);
                      final adsFactory = CloneFactory(vk);
                      final createAdsList = CreateAdsList();
                      for (var text in snapshot.data) {
                        print(text);
                        print('ok');
                        var cloneTask =
                            CloneTask(type: CloneType.text, value: text);
                        var createdAd = await adsFactory.buildAd(
                            appBloc.currentAd,
                            appBloc.currentAdTargeting,
                            appBloc.currentAdLayout,
                            appBloc.currentWallPost,
                            cloneTask);
                        print('ad created!');
                        print(createdAd.toString());
                        createAdsList.appendAd(createdAd);
                        print('add appended');
                      }
                      appBloc.inCurrentCreateAdsList.add(createAdsList);
                      //print('number of ads ${appBloc.currentCreateAdsList.createAdsList.length}');
                      Navigator.pop(context);
                    },
                  ),
                );
              }
              print('NO DATA');
              return Container();
            }));
  }

  void _saveLastValue() {
    print("Text field now is ${_textController.text}");
    _textField = _textController.text;
  }
}
