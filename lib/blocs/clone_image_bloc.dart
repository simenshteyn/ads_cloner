import 'dart:io';

import 'package:ads_cloner/api/error_check.dart';
import 'package:ads_cloner/blocs/bloc_provider.dart';
import 'dart:async';

class CloneImageBloc implements BlocBase, BlocWithPageNotifier {
  List<File> _fileList = [];

  StreamController<List<File>> _fileListController =
      StreamController<List<File>>.broadcast();
  Stream<List<File>> get outFileList => _fileListController.stream;
  StreamSink<List<File>> get inFileList => _fileListController.sink;

  StreamController<File> _cmdAddFile = StreamController<File>.broadcast();
  StreamSink get addFileToList => _cmdAddFile.sink;

  StreamController<String> _warningMessageController =
      StreamController<String>.broadcast();
  StreamSink<String> get inWarningMessage => _warningMessageController.sink;
  Stream<String> get outWarningMessage => _warningMessageController.stream;

  CloneImageBloc() {
    print('CLONE IMAGE BLOC CREATED');
    _fileListController.stream.listen(_handleLogic);
    _cmdAddFile.stream.listen(_handleLogicAddFile);
    _warningMessageController.stream.listen(_handleWarningMessage);
  }

  void dispose() {
    print("CLONE IMAGE BLOC DISPOSED");
    _fileListController.close();
    _cmdAddFile.close();
    _warningMessageController.close();
  }

  void _handleLogic(List<File> list) {
    _fileList = list;
  }

  void _handleLogicAddFile(text) {
    _fileList.add(text);
    _fileListController.sink.add(_fileList);
  }

  void _handleWarningMessage(data) {}
}
