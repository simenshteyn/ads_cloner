import 'package:ads_cloner/blocs/bloc_provider.dart';
import 'dart:async';

class CloneTextBloc implements BlocBase {
  List<String> _textList = [];

  StreamController<List<String>> _textListController =
      StreamController<List<String>>.broadcast();
  Stream<List<String>> get outTextList => _textListController.stream;
  StreamSink<List<String>> get inTextList => _textListController.sink;

  StreamController<String> _cmdAddText = StreamController<String>.broadcast();
  StreamSink get addTextToList => _cmdAddText.sink;

  CloneTextBloc() {
    print('CLONE TEXT BLOC CREATED');
    _textListController.stream.listen(_handleLogic);
    _cmdAddText.stream.listen(_handleLogicAddText);
  }

  void dispose() {
    print("CLONE TEXT BLOC DISPOSED");
    _textListController.close();
    _cmdAddText.close();
  }

  void _handleLogic(List<String> list) {
    _textList = list;
  }

  void _handleLogicAddText(text) {
    _textList.add(text);
    _textListController.sink.add(_textList);
    print('handle add logic!');
  }
}
