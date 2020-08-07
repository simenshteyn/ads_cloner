import 'dart:io';

import 'package:flutter/material.dart';

class ImageGridWidget extends StatelessWidget {
  ImageGridWidget(this.imageList);
  List<File> imageList;
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      primary: false,
      padding: const EdgeInsets.all(4),
      crossAxisSpacing: 4,
      mainAxisSpacing: 4,
      crossAxisCount: 3,
      children: _showImageList(imageList),
    );
  }

  List<Widget> _showImageList(List<File> imageList) {
    List<Widget> lst = [];
    for (var file in imageList) {
      final widget = Container(
        padding: const EdgeInsets.all(8),
        child: Image.file(file),
      );
      lst.add(widget);
    }
    return lst;
  }
}
