import 'package:ads_cloner/blocs/application_bloc.dart';
import 'package:ads_cloner/blocs/bloc_provider.dart';
import 'package:ads_cloner/blocs/clone_text_bloc.dart';
import 'package:flutter/material.dart';

class CloneTextPage extends StatefulWidget {
  @override
  _CloneTextPageState createState() => _CloneTextPageState();
}

class _CloneTextPageState extends State<CloneTextPage> {
  String _textField;
  final _textController = TextEditingController();

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
    CloneTextBloc bloc = BlocProvider.of<CloneTextBloc>(context);
    final bool showFab = MediaQuery.of(context).viewInsets.bottom == 0.0;
    return Scaffold(
      appBar: AppBar(
        title: Text('Enter text'),
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
                      FocusScope.of(context).unfocus();
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
                    child: Text('Пока текстов нет…'),
                  );
                }),
          ),
        ],
      ),
      floatingActionButton: showFab
          ? FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () {},
            )
          : null,
    );
  }

  void _saveLastValue() {
    print("Text field now is ${_textController.text}");
    _textField = _textController.text;
  }
}
