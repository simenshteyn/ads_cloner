import 'package:ads_cloner/blocs/application_bloc.dart';
import 'package:ads_cloner/blocs/bloc_provider.dart';
import 'package:ads_cloner/blocs/clone_text_bloc.dart';
import 'package:flutter/material.dart';

class CloneTextPage extends StatefulWidget {
  @override
  _CloneTextPageState createState() => _CloneTextPageState();
}

class _CloneTextPageState extends State<CloneTextPage> {
  @override
  void initState() {
    super.initState();
//    ApplicationBloc appBloc = BlocProvider.of<ApplicationBloc>(context);
//    CloneTextBloc bloc = BlocProvider.of<CloneTextBloc>(context);
//    bloc.addTextToList.add("Some");
//    CloneBloc cloneBloc = BlocProvider.of<CloneBloc>(context);
//    cloneBloc.getWallPostList
//        .add(WallPostRequest(appBloc.vkAccessToken, appBloc.currentPostId));
//    cloneBloc.getAdsTargetingList.add(AdsTargetingRequest(
//        appBloc.vkAccessToken, appBloc.currentAccount, appBloc.currentAd));
  }

  @override
  Widget build(BuildContext context) {
  //  ApplicationBloc appBloc = BlocProvider.of<ApplicationBloc>(context);
    //CloneBloc cloneBloc = BlocProvider.of<CloneBloc>(context);
    CloneTextBloc bloc = BlocProvider.of<CloneTextBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Enter text'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: StreamBuilder<String>(
                stream: bloc.outTextStream,
                builder: (context, AsyncSnapshot<String> textStream) {
                  return TextField(
                    onChanged: (String text) => bloc.inTextStream.add(text),
                    autofocus: true,
                    decoration: InputDecoration(
                      errorText: textStream.hasError ? textStream.error : null,
                      suffix: IconButton(
                        icon: Icon(Icons.add),
                        onPressed: () {
                          //something when button clicked
                        },
                      ),
                    ),
                  );
                }
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height,
              child: StreamBuilder<List<String>>(
                  stream: bloc.outTextList,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                        itemCount: snapshot.data.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ListTile(
                            title: Text(snapshot.data[index]),
                          );
                        },
                      );
                    }
                    return Text('Пока текстов нет…');
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
