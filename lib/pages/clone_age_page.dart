import 'package:SmmHub/api/clone_factory.dart';
import 'package:SmmHub/api/vk_api.dart';
import 'package:SmmHub/blocs/application_bloc.dart';
import 'package:SmmHub/blocs/bloc_provider.dart';
import 'package:SmmHub/blocs/clone_age_bloc.dart';
import 'package:SmmHub/models/age_range.dart';
import 'package:SmmHub/models/create_ads_list.dart';
import 'package:SmmHub/widgets/age_grid_widget.dart';
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';

class CloneAgePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: CloneAgePageSnackbar());
  }
}

class CloneAgePageSnackbar extends StatefulWidget {
  @override
  _CloneAgePageSnackbarState createState() => _CloneAgePageSnackbarState();
}

class _CloneAgePageSnackbarState extends State<CloneAgePageSnackbar> {
  bool _isLoading = false;
  bool _isClickable = true;

  RangeValues _currentRangeValues = const RangeValues(18, 35);
  double _currentSliderValue = 4;
  List<AgeRange> _ageRangleList = [];
  CloneFactory adsFactory;
  CreateAdsList createAdsList;

  @override
  void initState() {
    super.initState();
    ApplicationBloc appBloc = BlocProvider.of<ApplicationBloc>(context);
    CloneAgeBloc bloc = BlocProvider.of<CloneAgeBloc>(context);
    final vk = VkApi(userToken: appBloc.vkAccessToken.token);
    adsFactory = CloneAgeFactory(vk);
    createAdsList = CreateAdsList([]);
    bloc.getAgeRangeList
        .add(AgeRangeRequest(_currentRangeValues, _currentSliderValue));

    bloc.outWarningMessage.forEach((e) {
      if (context != null) {
        _showSnackBar('${e}', context);
      }
    });
  }

  _showSnackBar(String text, BuildContext context) {
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text('${text}'),
      backgroundColor: Colors.red,
    ));
  }

  @override
  Widget build(BuildContext context) {
    CloneAgeBloc bloc = BlocProvider.of<CloneAgeBloc>(context);
    ApplicationBloc appBloc = BlocProvider.of<ApplicationBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Разбивка по возрастам'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: Column(
          children: <Widget>[
            RangeSlider(
              values: _currentRangeValues,
              min: 14,
              max: 80,
              divisions: 66,
              labels: RangeLabels(
                _currentRangeValues.start.round().toString(),
                _currentRangeValues.end.round().toString(),
              ),
              onChanged: (RangeValues values) {
                setState(() {
                  _currentRangeValues = values;
                  bloc.getAgeRangeList
                      .add(AgeRangeRequest(values, _currentSliderValue));
                });
              },
            ),
            Text('От ${_currentRangeValues.start.round()} до '
                '${_currentRangeValues.end.round()} '
                'лет'),
            Container(
              height: 30,
            ),
            Slider(
                value: _currentSliderValue,
                min: 1,
                max: 10,
                divisions: 9,
                label: _currentSliderValue.round().toString(),
                onChanged: (double value) {
                  setState(() {
                    _currentSliderValue = value;
                    bloc.getAgeRangeList
                        .add(AgeRangeRequest(_currentRangeValues, value));
                    print('IN AGE BLOC!');
                  });
                }),
            Text('Сегмент — ${_currentSliderValue.round()} года'),
            StreamBuilder<List<AgeRange>>(
                stream: bloc.outAgeRangeList,
                builder: (BuildContext context, snapshot) {
                  if (snapshot.hasData) {
                    return Expanded(child: AgeGridWidget(snapshot.data));
                  }
                  return Text('no data');
                }),
          ],
        ),
      ),
      floatingActionButton: StreamBuilder<List<AgeRange>>(
          stream: bloc.outAgeRangeList,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              int badgeText = snapshot.data.length;
              return Badge(
                animationType: BadgeAnimationType.scale,
                badgeContent: Text(badgeText.toString(),
                    style: TextStyle(color: Colors.white)),
                position: BadgePosition.topRight(top: -3, right: -3),
                child: FloatingActionButton(
                  child: _isLoading
                      ? Center(
                          child: CircularProgressIndicator(
                              valueColor:
                                  AlwaysStoppedAnimation<Color>(Colors.white)))
                      : Icon(Icons.send),
                  onPressed: () async {
                    setState(() {
                      _isLoading = true;
                    });
                    if (_isClickable) {
                      _isClickable = false;
                      await _sendAgeListToAdsFactory(snapshot.data, context);
                      appBloc.inCurrentCreateAdsList.add(createAdsList);
                      Navigator.pop(context);
                    }
                  },
                ),
              );
            }
            return Container();
          }),
    );
  }

  Future<void> _sendAgeListToAdsFactory(
      List<AgeRange> ageList, BuildContext context) async {
    ApplicationBloc appBloc = BlocProvider.of<ApplicationBloc>(context);
    CloneAgeBloc bloc = BlocProvider.of<CloneAgeBloc>(context);

    for (var age in ageList) {
      var cloneTask = CloneTask(type: CloneType.age, value: age);
      try {
        var createdAd = await adsFactory.buildAd(
            appBloc.currentAd,
            appBloc.currentAdTargeting,
            appBloc.currentAdLayout,
            appBloc.currentWallPost,
            cloneTask);
        createAdsList.appendAd(createdAd);
      } on Exception catch (e) {
        bloc.inWarningMessage.add('${e}');
      }
    }
  }
}
