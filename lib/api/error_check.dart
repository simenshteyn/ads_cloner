import 'package:flutter/material.dart';

bool apiResponseHasError(snapshot) {
  return (snapshot.data?.errorResponse != null) ? true : false;
}

Widget showError(snapshot) {
  return AlertDialog(
    title: Text('Ошибка ${snapshot.data.errorResponse.errorCode}'),
    content: Text('${snapshot.data.errorResponse.errorMsg}'),
  );
}
