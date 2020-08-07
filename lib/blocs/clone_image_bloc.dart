import 'dart:io';

import 'package:ads_cloner/blocs/bloc_provider.dart';
import 'dart:async';

class CloneImageBloc implements BlocBase {
  List<File> _fileList = [];

  StreamController<List<File>> _fileListController =
      StreamController<List<File>>.broadcast();
  Stream<List<File>> get outFileList => _fileListController.stream;
  StreamSink<List<File>> get inFileList => _fileListController.sink;

  StreamController<File> _cmdAddFile = StreamController<File>.broadcast();
  StreamSink get addFileToList => _cmdAddFile.sink;

  CloneImageBloc() {
    print('CLONE IMAGE BLOC CREATED');
    _fileListController.stream.listen(_handleLogic);
    _cmdAddFile.stream.listen(_handleLogicAddFile);
  }

  void dispose() {
    print("CLONE IMAGE BLOC DISPOSED");
    _fileListController.close();
    _cmdAddFile.close();
  }

  void _handleLogic(List<File> list) {
    _fileList = list;
  }

  void _handleLogicAddFile(text) {
    _fileList.add(text);
    _fileListController.sink.add(_fileList);
  }
}
