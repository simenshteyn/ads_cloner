import 'package:SmmHub/api/error_check.dart';
import 'package:SmmHub/blocs/bloc_provider.dart';
import 'dart:async';

import 'package:SmmHub/models/age_range.dart';
import 'package:flutter/material.dart';

class CloneAgeBloc implements BlocBase, BlocWithPageNotifier {
  List<AgeRange> _ageRangeList = [];

  StreamController<List<AgeRange>> _ageRangeListController =
      StreamController<List<AgeRange>>.broadcast();
  Stream<List<AgeRange>> get outAgeRangeList => _ageRangeListController.stream;
  StreamSink<List<AgeRange>> get inAgeRangeList => _ageRangeListController.sink;

  StreamController<AgeRangeRequest> _cmdAgeRangeListController =
      StreamController<AgeRangeRequest>.broadcast();
  StreamSink<AgeRangeRequest> get getAgeRangeList =>
      _cmdAgeRangeListController.sink;

  StreamController<String> _warningMessageController =
      StreamController<String>.broadcast();
  StreamSink<String> get inWarningMessage => _warningMessageController.sink;
  Stream<String> get outWarningMessage => _warningMessageController.stream;

  CloneAgeBloc() {
    print('CLONE AGE BLOC CREATED');
    _ageRangeListController.stream.listen(_handleLogic);
    _cmdAgeRangeListController.stream.listen(_handleCmdLogic);
    _warningMessageController.stream.listen(_handleWarningMessage);
  }

  void dispose() {
    print("CLONE AGE BLOC DISPOSED");
    _ageRangeListController.close();
    _cmdAgeRangeListController.close();
    _warningMessageController.close();
  }

  void _handleLogic(List<AgeRange> list) {
    _ageRangeList = list;
  }

  void _handleCmdLogic(AgeRangeRequest req) {
    print('LOGIC!');

    _ageRangeList = _createAgeRangleList(req.range, req.size);
    _ageRangeListController.sink.add(_ageRangeList);
  }

  List<AgeRange> _createAgeRangleList(RangeValues range, double size) {
    List<AgeRange> result = [];
    void _divide(int start, int end, int size) {
      if (end - start <= size) {
        result.add(AgeRange(start, end));
      } else {
        result.add(AgeRange(start, start + size - 1));
        return _divide(start + size, end, size);
      }
    }

    _divide(range.start.round(), range.end.round(), size.round());
    return result;
  }

  void _handleWarningMessage(data) {}
}
