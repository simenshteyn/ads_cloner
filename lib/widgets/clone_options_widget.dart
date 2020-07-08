import 'package:flutter/material.dart';

class CloneOptionsWidget extends StatefulWidget {
  @override
  _CloneOptionsWidgetState createState() => _CloneOptionsWidgetState();
}

class _CloneOptionsWidgetState extends State<CloneOptionsWidget> {
  int _index = 0;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 200,
        child: PageView.builder(
          itemCount: 10,
          controller: PageController(viewportFraction: 0.7),
          onPageChanged: (int index) => setState(() => _index = index),
          itemBuilder: (_, i) {
            return Transform.scale(
              scale: i == _index ? 1 : 0.95,
              child: Card(
                elevation: 6,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Text(
                    "Card ${i + i}",
                    style: TextStyle(fontSize: 32),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
