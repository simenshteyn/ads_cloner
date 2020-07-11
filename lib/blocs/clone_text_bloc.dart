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

  StreamController<String> _inputTextController =
      StreamController<String>.broadcast();
  Stream<String> get outTextStream => _inputTextController.stream;
  StreamSink get inTextStream => _inputTextController.sink;

  CloneTextBloc() {
    print('CLONE TEXT BLOC CREATED');
    _textListController.stream.listen(_handleLogic);
    _cmdAddText.stream.listen(_handleLogicAddText);
    _inputTextController.stream.listen(_handleInputTextController);
  }

  void dispose() {
    print("CLONE TEXT BLOC DISPOSED");
    _textListController.close();
    _cmdAddText.close();
    _inputTextController.close();
  }

  void _handleLogic(List<String> list) {
    _textList = list;
  }

  void _handleLogicAddText(text) {
    _textList.add(text);
    _textListController.sink.add(_textList);
    print('handle add logic!');
  }

  void _handleInputTextController(String text) {
    print("handle INPUT LOGIC");
    (text == null || text == "")
        ? _inputTextController.sink.addError("Неверное значение")
        : _inputTextController.sink.add(text);
  }
}
