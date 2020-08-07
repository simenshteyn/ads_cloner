import 'package:ads_cloner/blocs/application_bloc.dart';
import 'package:ads_cloner/blocs/bloc_provider.dart';
import 'package:ads_cloner/blocs/clone_image_bloc.dart';
import 'package:ads_cloner/widgets/image_grid_widget.dart';
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';

import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class CloneImagePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CloneImagePageSnackbar(),
    );
  }
}

class CloneImagePageSnackbar extends StatefulWidget {
  @override
  _CloneImagePageSnackbarState createState() => _CloneImagePageSnackbarState();
}

enum AppState {
  free,
  picked,
  cropped,
  added //added this
}

class _CloneImagePageSnackbarState extends State<CloneImagePageSnackbar> {
  bool _isLoading = false;
  bool _isClickable = true;
  AppState state;
  File currentImageFile;
  List<File> imageFileList = [];
  final picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    state = AppState.free;
    ApplicationBloc appBloc = BlocProvider.of<ApplicationBloc>(context);
    CloneImageBloc bloc = BlocProvider.of<CloneImageBloc>(context);
    appBloc.outWarningMessage.forEach((e) {
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text('${e}'),
        backgroundColor: Colors.red,
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    CloneImageBloc bloc = BlocProvider.of<CloneImageBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Варианты картинок'),
      ),
      body: StreamBuilder<List<File>>(
          stream: bloc.outFileList,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Center(child: _showInformation(snapshot));
            }
            if (state == AppState.free) {
              return Center(child: Text('Выберите несколько картинок'));
            } else {
              return Image.file(currentImageFile);
            }
          }),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: null,
            backgroundColor: Colors.deepOrange,
            onPressed: () {
              if (state == AppState.free)
                _pickImage();
              else if (state == AppState.picked)
                _cropImage(context);
              else if (state == AppState.cropped) _clearImage();
            },
            child: _buildButtonIcon(),
          ),
          Container(
            height: 10,
          ),
          StreamBuilder<List<File>>(
            stream: bloc.outFileList,
            builder: (context, snapshot) {
              if ((snapshot.hasData) && (state == AppState.free)) {
                return _buildSendButton(snapshot);
              }
              return Container();
            },
          ),
        ],
      ),
    );
  }

  Widget _showInformation(AsyncSnapshot snapshot) {
    var fileList = snapshot.data;
    switch (state) {
      case AppState.free:
        return fileList.length > 0
            ? ImageGridWidget(fileList)
            : Center(child: Text('Добавьте несколько картинок'));
        break;
      case AppState.picked:
        return Image.file(currentImageFile);
        break;
      case AppState.cropped:
        return Image.file(currentImageFile);
        break;
      default:
        return Container();
    }
  }

  Widget _buildButtonIcon() {
    if (state == AppState.free)
      return Icon(Icons.add);
    else if (state == AppState.picked)
      return Icon(Icons.crop);
    else if (state == AppState.cropped)
      return Icon(Icons.done);
    else
      return Container();
  }

  Future _pickImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        state = AppState.picked;
        currentImageFile = File(pickedFile.path);
      });
    }
  }

  Future<Null> _cropImage(BuildContext context) async {
    CloneImageBloc bloc = BlocProvider.of<CloneImageBloc>(context);
    File croppedFile = await ImageCropper.cropImage(
        sourcePath: currentImageFile.path,
        aspectRatioPresets: Platform.isAndroid
            ? [
                CropAspectRatioPreset.square,
                CropAspectRatioPreset.ratio3x2,
                CropAspectRatioPreset.original,
                CropAspectRatioPreset.ratio4x3,
                CropAspectRatioPreset.ratio16x9
              ]
            : [
                CropAspectRatioPreset.original,
                CropAspectRatioPreset.square,
                CropAspectRatioPreset.ratio3x2,
                CropAspectRatioPreset.ratio4x3,
                CropAspectRatioPreset.ratio5x3,
                CropAspectRatioPreset.ratio5x4,
                CropAspectRatioPreset.ratio7x5,
                CropAspectRatioPreset.ratio16x9
              ],
        androidUiSettings: AndroidUiSettings(
            toolbarTitle: 'Обрезка',
            toolbarColor: Colors.deepOrange,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        iosUiSettings: IOSUiSettings(
          title: 'Обрезка',
        ));
    if (croppedFile != null) {
      bloc.addFileToList.add(croppedFile);
      currentImageFile = croppedFile;
      setState(() {
        state = AppState.cropped;
      });
    }
  }

  void _clearImage() {
    currentImageFile = null;
    setState(() {
      state = AppState.free;
    });
  }

  Widget _buildSendButton(snapshot) {
    int badgeText = snapshot.data.length;
    return Badge(
      animationType: BadgeAnimationType.scale,
      badgeContent:
          Text(badgeText.toString(), style: TextStyle(color: Colors.white)),
      position: BadgePosition.topRight(top: -3, right: -3),
      child: FloatingActionButton(
        child: _isLoading
            ? Center(
                child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white)))
            : Icon(Icons.send),
        onPressed: () async {
          setState(() {
            _isLoading = true;
          });
          if (_isClickable) {
            _isClickable = false;
            //await _sendTextListToAdsFactory(snapshot.data, context);
            //appBloc.inCurrentCreateAdsList.add(createAdsList);
            Navigator.pop(context);
          }
        },
      ),
    );
  }
}
