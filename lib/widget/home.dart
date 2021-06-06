import 'package:flutter/material.dart';
import 'package:music_player/music_player.dart';
import 'package:netease_music/components/home_page/Drawer.dart';
import 'package:netease_music/store/player_controller.dart';
import 'package:netease_music/widget/login.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Create Player instance.
  MusicPlayer player = MusicPlayer();
  
  // audio list
  final medias = [
    MusicMetadata(
      title: "Zhu Lin Jian",
      subtitle: "Zhu Lin Jian - SanWu marblue",
      mediaId: "bamboo",
      mediaUri: "asset:///tracks/bamboo.mp3",
      iconUri: "https://via.placeholder.com/150/FFCA28/000000/?text=bamboo",
    ),
    MusicMetadata(
      title: "Rise",
      subtitle: "Rise - The Glitch Mob",
      mediaId: "rise",
      mediaUri: "asset:///tracks/rise.mp3",
      iconUri: "https://via.placeholder.com/150/4CAF50/FFFFFF/?text=Rise",
    ),
    MusicMetadata(
      title: "Cang",
      subtitle: "Cang - xu meng yuan",
      mediaId: "hide",
      mediaUri: "asset:///tracks/hide.mp3",
      iconUri: "https://via.placeholder.com/150/03A9F4/000000/?text=Cang",
    ),
  ];
  @override
  void initState() {
    // TODO: implement initState
    PlayQueue queue = PlayQueue(queueTitle: "Simple Test", queueId: "test1", queue: medias);

    // Perform play operation.
    player.playWithQueue(queue, metadata: medias.first);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LoginPage();
    }));
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: Icon(Icons.reorder, color: Colors.white), //自定义图标
              onPressed: () {
                // 打开抽屉菜单  
                Scaffold.of(context).openDrawer(); 
              },
            );
          },
        ),
        title: Text(widget.title),
      ),
      drawer: SetDrawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Consumer<PlayerController>(builder: (context, playerPro, child) {
              return Text(
                '${playerPro.count}',
                style: Theme.of(context).textTheme.headline4,
              );
            })
          ],
        ),
      ),
      floatingActionButton: Consumer<PlayerController>(
        builder: (context, playerPro, child){
          return FloatingActionButton(
            onPressed: () => playerPro.increment(),
            tooltip: 'Increment',
            child: child,
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
