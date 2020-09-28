import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutteravpdemo/video_player.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Key videoPlayerKey = UniqueKey();
  String url =
      "http://vt1.doubanio.com/202004011618/8f34039bc2a8b9732ac3014cabaf38fb/view/movie/M/402320974.mp4";
  String title = "鬼怪";
  bool fullScreen = false;

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
        body: CustomScrollView(
      slivers: <Widget>[
        !fullScreen
            ? SliverAppBar(
                title: Text("切换视频"),
              )
            : SliverToBoxAdapter(),
        SliverToBoxAdapter(
            child: VideoPlayerG(
          title: title,
          videoUrl: url,
          key: videoPlayerKey,
          onfullscreen: (value) {
            setState(() {
              fullScreen = value;
            });
          },
        )),
        !fullScreen
            ? SliverToBoxAdapter(
                child: InkWell(
                    onTap: () {
                      setState(() {
                        videoPlayerKey = UniqueKey();
                        url =
                            "http://vt1.doubanio.com/202005091443/a5325a32796a6c9fb05e9cfc32534fbf/view/movie/M/402480072.mp4";
                        title = "天气之子";
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.all(100),
                      alignment: Alignment.center,
                      child: Text("切换",
                          style: TextStyle(
                              fontSize: 20, color: Colors.lightBlueAccent)),
                    )))
            : SliverToBoxAdapter()
      ],
    ));
  }
}
