import 'package:ads_cloner/api/clone_factory.dart';
import 'package:ads_cloner/blocs/bloc_provider.dart';
import 'package:ads_cloner/blocs/clone_image_bloc.dart';
import 'package:ads_cloner/blocs/clone_text_bloc.dart';
import 'package:ads_cloner/models/option_card.dart';
import 'package:ads_cloner/pages/clone_image_page.dart';
import 'package:ads_cloner/pages/clone_text_page.dart';
import 'package:flutter/material.dart';

class CloneOptionsWidget extends StatefulWidget {
  @override
  _CloneOptionsWidgetState createState() => _CloneOptionsWidgetState();
}

class _CloneOptionsWidgetState extends State<CloneOptionsWidget> {
  int _index = 0;
  List<OptionCard> cards = [
    OptionCard(title: "Text", type: CloneType.text),
    OptionCard(title: "Image", type: CloneType.image),
    OptionCard(title: "Age", type: CloneType.age),
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 200,
        child: PageView.builder(
          itemCount: cards.length,
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
                child: InkWell(
                  splashColor: Colors.blue.withAlpha(30),
                  onTap: () {
                    print('Card ${cards[i].title} tapped');
                    switch (i) {
                      case 0:
                        {
                          _openCloneTextPage(context);
                          break;
                        }
                      case 1:
                        {
                          _openCloneImagePage(context);
                          break;
                        }
                    }
                  },
                  child: Center(
                    child: Text(
                      "${cards[i].title}",
                      style: TextStyle(fontSize: 32),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  void _openCloneTextPage(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      return BlocProvider<CloneTextBloc>(
        bloc: CloneTextBloc(),
        child: CloneTextPage(),
      );
    })).whenComplete(() {
      // do some shit
    });
  }

  void _openCloneImagePage(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      return BlocProvider<CloneImageBloc>(
          bloc: CloneImageBloc(), child: CloneImagePage());
    })).whenComplete(() {
      // do some shit
    });
  }

    void _openCloneAgePage(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      return BlocProvider<CloneAgeBloc>(
          bloc: CloneAgeBloc(), child: CloneAgePage());
    })).whenComplete(() {
      // do some shit
    });
  }
}
