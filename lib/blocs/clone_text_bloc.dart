import 'package:SmmHub/api/error_check.dart';
import 'package:SmmHub/blocs/bloc_provider.dart';
import 'dart:async';

class CloneTextBloc implements BlocBase, BlocWithPageNotifier {
  List<String> _textList = [];

  StreamController<List<String>> _textListController =
      StreamController<List<String>>.broadcast();
  Stream<List<String>> get outTextList => _textListController.stream;
  StreamSink<List<String>> get inTextList => _textListController.sink;

  StreamController<String> _cmdAddText = StreamController<String>.broadcast();
  StreamSink get addTextToList => _cmdAddText.sink;

  StreamController<String> _warningMessageController =
      StreamController<String>.broadcast();
  StreamSink<String> get inWarningMessage => _warningMessageController.sink;
  Stream<String> get outWarningMessage => _warningMessageController.stream;

  CloneTextBloc() {
    print('CLONE TEXT BLOC CREATED');
    _textListController.stream.listen(_handleLogic);
    _cmdAddText.stream.listen(_handleLogicAddText);
    _warningMessageController.stream.listen(_handleWarningMessage);
  }

  void dispose() {
    print("CLONE TEXT BLOC DISPOSED");
    _textListController.close();
    _cmdAddText.close();
    _warningMessageController.close();
  }

  void _handleLogic(List<String> list) {
    _textList = list;
  }

  void _handleLogicAddText(text) {
    _textList.add(text);
    _textListController.sink.add(_textList);
  }

  void _handleWarningMessage(data) {}
}
