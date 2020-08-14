import 'package:ads_cloner/api/clone_factory.dart';
import 'package:ads_cloner/api/vk_api.dart';
import 'package:ads_cloner/blocs/application_bloc.dart';
import 'package:ads_cloner/blocs/bloc_provider.dart';
import 'package:ads_cloner/blocs/clone_image_bloc.dart';
import 'package:ads_cloner/models/create_ads_list.dart';
import 'package:ads_cloner/widgets/image_grid_widget.dart';
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_image/flutter_native_image.dart';
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
  CloneFactory adsFactory;
  CreateAdsList createAdsList;

  @override
  void initState() {
    super.initState();
    state = AppState.free;
    ApplicationBloc appBloc = BlocProvider.of<ApplicationBloc>(context);
    CloneImageBloc bloc = BlocProvider.of<CloneImageBloc>(context);
    final vk = VkApi(userToken: appBloc.vkAccessToken.token);
    adsFactory = CloneImageFactory(vk);
    createAdsList = CreateAdsList([]);

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
    CloneImageBloc bloc = BlocProvider.of<CloneImageBloc>(context);
    ApplicationBloc appBloc = BlocProvider.of<ApplicationBloc>(context);
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
              return Center(child: Text('Выберите несколько картинок…'));
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
              else if (state == AppState.picked) {
                if (appBloc.currentAd.isAdaptiveFormat) {
                  _cropImage(context, 1080, 607);
                } else if (appBloc.currentAd.isWallPostFormat) {
                  _cropImage(context, 537, 240);
                } else if (appBloc.currentAd.isImageTextFormat) {
                  _cropImage(context, 145, 85);
                } else if (appBloc.currentAd.isBigImageFormat) {
                  _cropImage(context, 145, 165);
                }
              } else if (state == AppState.cropped) _clearImage();
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
                return _buildSendButton(context, snapshot);
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
    final pickedFile = await picker.getImage(
        source: ImageSource.gallery, maxHeight: 3840, maxWidth: 3840);
    if (pickedFile != null) {
      setState(() {
        state = AppState.picked;
        currentImageFile = File(pickedFile.path);
      });
    }
  }

  Future<Null> _cropImage(
      BuildContext context, int cropWidth, int cropHeight) async {
    CloneImageBloc bloc = BlocProvider.of<CloneImageBloc>(context);
    // ApplicationBloc appBloc = BlocProvider.of<ApplicationBloc>(context);
    try {
      File croppedFile = await ImageCropper.cropImage(
          sourcePath: currentImageFile.path,
          maxWidth: cropWidth,
          maxHeight: cropHeight,
          aspectRatio: CropAspectRatio(
              ratioX: cropWidth.toDouble(), ratioY: cropHeight.toDouble()),
          androidUiSettings: AndroidUiSettings(
              toolbarTitle: 'Обрезка',
              toolbarColor: Colors.deepOrange,
              toolbarWidgetColor: Colors.white,
              lockAspectRatio: true), //changed
          iosUiSettings: IOSUiSettings(
            title: 'Обрезка',
          ));
      if (croppedFile != null) {
        File compressedFile = await FlutterNativeImage.compressImage(
            croppedFile.path,
            quality: 100,
            targetWidth: cropWidth,
            targetHeight: cropHeight);
        // var decodedImage =
        //     await decodeImageFromList(compressedFile.readAsBytesSync());
        bloc.addFileToList.add(compressedFile);
        currentImageFile = compressedFile;
        setState(() {
          state = AppState.cropped;
        });
      }
    } catch (e) {
      bloc.inWarningMessage.add(e.toString());
    }
  }

  void _clearImage() {
    currentImageFile = null;
    setState(() {
      state = AppState.free;
    });
  }

  Widget _buildSendButton(BuildContext context, snapshot) {
    int badgeText = snapshot.data.length;
    ApplicationBloc appBloc = BlocProvider.of<ApplicationBloc>(context);

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
            await _sendFileListToAdsFactory(snapshot.data, context);
            appBloc.inCurrentCreateAdsList.add(createAdsList);
            Navigator.pop(context);
          }
        },
      ),
    );
  }

  Future<void> _sendFileListToAdsFactory(
      List<File> fileList, BuildContext context) async {
    ApplicationBloc appBloc = BlocProvider.of<ApplicationBloc>(context);
    CloneImageBloc bloc = BlocProvider.of<CloneImageBloc>(context);
    for (var file in fileList) {
      var cloneTask = CloneTask(type: CloneType.image, value: file);
      try {
        var createdAd = await adsFactory.buildAd(
            appBloc.currentAd,
            appBloc.currentAdTargeting,
            appBloc.currentAdLayout,
            appBloc.currentWallPost,
            cloneTask);
        createAdsList.appendAd(createdAd);
      } catch (e) {
        bloc.inWarningMessage.add('${e}');
      }
    }
  }
}
