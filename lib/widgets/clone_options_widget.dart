import 'package:SmmHub/api/clone_factory.dart';
import 'package:SmmHub/blocs/bloc_provider.dart';
import 'package:SmmHub/blocs/clone_age_bloc.dart';
import 'package:SmmHub/blocs/clone_image_bloc.dart';
import 'package:SmmHub/blocs/clone_text_bloc.dart';
import 'package:SmmHub/models/option_card.dart';
import 'package:SmmHub/pages/clone_age_page.dart';
import 'package:SmmHub/pages/clone_image_page.dart';
import 'package:SmmHub/pages/clone_text_page.dart';
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
          controller: PageController(viewportFraction: 0.5),
          onPageChanged: (int index) => setState(() => _index = index),
          itemBuilder: (_, i) {
            return Transform.scale(
              scale: i == _index ? 1 : 0.97,
              child: Card(
                elevation: 6,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: InkWell(
                  splashColor: Colors.blue.withAlpha(30),
                  onTap: () {
                    print('Card ${cards[i].title} tapped');
                    switch (cards[i].type) {
                      case CloneType.text:
                        {
                          _openCloneTextPage(context);
                          break;
                        }
                      case CloneType.image:
                        {
                          _openCloneImagePage(context);
                          break;
                        }
                      case CloneType.age:
                        {
                          _openCloneAgePage(context);
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
