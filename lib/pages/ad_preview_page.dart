import 'package:SmmHub/api/error_check.dart';
import 'package:SmmHub/api/vk_api.dart';
import 'package:SmmHub/blocs/ad_preview_bloc.dart';
import 'package:SmmHub/blocs/application_bloc.dart';
import 'package:SmmHub/blocs/bloc_provider.dart';
import 'package:SmmHub/blocs/clone_bloc.dart';
import 'package:SmmHub/models/ad_layout.dart';
import 'package:SmmHub/models/ad_targeting.dart';
import 'package:SmmHub/models/ads_layout_list.dart';
import 'package:SmmHub/models/ads_layout_request.dart';
import 'package:SmmHub/models/ads_targeting_list.dart';
import 'package:SmmHub/models/ads_targeting_request.dart';
import 'package:SmmHub/models/create_ads_list.dart';
import 'package:SmmHub/pages/clone_page.dart';
import 'package:SmmHub/widgets/ad_info_widget.dart';
import 'package:SmmHub/widgets/ad_target_widget.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class AdPreviewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AdPreviewPageSnackbar(),
    );
  }
}

class AdPreviewPageSnackbar extends StatefulWidget {
  @override
  _AdPreviewPageSnackbarState createState() => _AdPreviewPageSnackbarState();
}

class _AdPreviewPageSnackbarState extends State<AdPreviewPageSnackbar> {
  AdLayout _currentLayout;
  AdTargeting _currentTargeting;
  String _currentWallPostId;

  @override
  void initState() {
    super.initState();
    ApplicationBloc appBloc = BlocProvider.of<ApplicationBloc>(context);
    AdPreviewBloc bloc = BlocProvider.of<AdPreviewBloc>(context);
    bloc.getAdsLayoutList.add(AdsLayoutRequest(appBloc.vkAccessToken,
        appBloc.currentAccount, appBloc.currentAd, appBloc.currentClient));
    bloc.getAdsTargetingList.add(AdsTargetingRequest(appBloc.vkAccessToken,
        appBloc.currentAccount, appBloc.currentAd, appBloc.currentClient));
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
    ApplicationBloc appBloc = BlocProvider.of<ApplicationBloc>(context);
    AdPreviewBloc bloc = BlocProvider.of<AdPreviewBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('????????????????????'),
      ),
      body: Stack(children: <Widget>[
        SingleChildScrollView(
          child: Column(
            children: [
              AdInfoWidget(),
              //Divider(),
              StreamBuilder<AdsTargetingList>(
                stream: bloc.outAdsTargetingList,
                builder: (context, snapshot) {
                  if (apiResponseHasError(snapshot))
                    return showErrorOnCurrentPage(context, snapshot, bloc);
                  else if ((snapshot.hasData) &&
                      (snapshot.data.adsTargeting?.length > 0)) {
                    _currentTargeting = snapshot.data.adsTargeting[0];
                    var vk = VkApi(userToken: appBloc.vkAccessToken.token);
                    return AdTargetWidget(_currentTargeting, vk);
                  }
                  return Center(child: CircularProgressIndicator());
                },
              ),
            ],
          ),
        ),
        StreamBuilder<AdsLayoutList>(
            stream: bloc.outAdsLayoutList,
            builder: (context, snapshot) {
              if (apiResponseHasError(snapshot))
                return showErrorOnCurrentPage(context, snapshot, bloc);
              else if ((snapshot.hasData) &&
                  (snapshot.data.adsLayout?.length > 0)) {
                _currentLayout = snapshot.data.adsLayout[0];
                _currentWallPostId =
                    _postUrlConvertor(snapshot.data.adsLayout[0].linkUrl);

                return DraggableScrollableSheet(
                  initialChildSize: 0.2,
                  maxChildSize: 0.8,
                  minChildSize: 0.1,
                  builder: (context, controller) {
                    return SingleChildScrollView(
                      controller: controller,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(width: 1, color: Colors.grey[200]),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30),
                              bottomLeft: Radius.circular(30),
                              bottomRight: Radius.circular(30)),
                        ),
                        child: Column(
                          children: [
                            Icon(Icons.drag_handle),
                            Container(
                              height: 500,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Container(
                                  child: AbsorbPointer(
                                    child: WebView(
                                      gestureNavigationEnabled: false,
                                      javascriptMode: JavascriptMode.disabled,
                                      initialUrl:
                                          snapshot.data.adsLayout[0].previewLink,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              }
              return Center(child: CircularProgressIndicator());
            }),
      ]),
      floatingActionButton: StreamBuilder<AdsLayoutList>(
          stream: bloc.outAdsLayoutList,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return apiResponseHasError(snapshot)
                  ? showErrorOnCurrentPage(context, snapshot, bloc)
                  : FloatingActionButton(
                      child: Icon(Icons.content_copy),
                      onPressed: () {
                        appBloc.inCurrentAdLayout.add(_currentLayout);
                        appBloc.inCurrentAdTargeting.add(_currentTargeting);
                        appBloc.inCurrentPostId.add(_currentWallPostId);
                        _openClonePage(context);
                      });
            }
            return Container();
          }),
    );
  }

  void _openClonePage(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (BuildContext context) {
        return BlocProvider<CloneBloc>(
          bloc: CloneBloc(),
          child: ClonePage(),
        );
      }),
    ).whenComplete(() {
      ApplicationBloc appBloc = BlocProvider.of<ApplicationBloc>(context);
      appBloc.inCurrentCreateAdsList.add(CreateAdsList([]));
    });
  }

  String _postUrlConvertor(String linkUrl) {
    //Convert linkUrl to postId, check if external or internal,
    //if external -- returns string '-1'
    if (linkUrl.length < 20) {
      return '-1';
    }
    return (linkUrl.substring(0, 19) == 'http://vk.com/wall-')
        ? linkUrl.substring(18)
        : '-1';
  }
}
