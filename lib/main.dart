// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:netease_music/store/player_controller.dart';
// import 'package:netease_music/widgets/home.dart';
// import 'package:provider/provider.dart';
//
// SystemUiOverlayStyle uiStyle = SystemUiOverlayStyle.light.copyWith(
//   statusBarColor: Colors.transparent,
//   // statusBarIconBrightness: Brightness.light,
// );
//
// void main() {
//   runApp(MyApp());
//   SystemChrome.setSystemUIOverlayStyle(uiStyle);
// }
//
// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MultiProvider(
//       providers: [
//         ChangeNotifierProvider(create: (_) => PlayerController())
//       ],
//       child: MaterialApp(
//         title: '音乐播放器',
//         theme: ThemeData(
//           primarySwatch: Colors.red,
//         ),
//         home: HomePage(title: '首页'),
//         // home: LoginPage(),
//       ),
//     );
//   }
// }


import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:logging/logging.dart';
import 'package:music_player/music_player.dart';
import 'package:netease_music/page_play_queue.dart';
import 'package:netease_music/player/background.dart';
import 'package:overlay_support/overlay_support.dart';

import 'player/player.dart';
import 'player/player_bottom_controller.dart';

final medias = [
  MusicMetadata(
    title: "Zhu Lin Jian",
    subtitle: "Zhu Lin Jian - SanWu marblue",
    mediaId: "bamboo",
    mediaUri: "https://luan.xyz/files/audio/ambient_c_motion.mp3",
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

final playQueueList = [
  PlayQueue(queueTitle: "Simple Test", queueId: "test1", queue: medias),
  PlayQueue(queueTitle: "Auto Fetch Test", queueId: "fm", queue: medias.getRange(0, 1).toList()),
  PlayQueue(queueTitle: "Failed to Play", queueId: "test_failed", queue: [
    MusicMetadata(
      title: "Cang",
      subtitle: "Cang - xu meng yuan",
      mediaId: "hide",
      mediaUri: "asset:///tracks/file_not_exists.mp3",
    ),
  ])
];

void main() {
  Logger.root.onRecord.listen((record) {
    print('${record.level.name}: ${record.time}: ${record.message}');
  });
  runApp(ExampleApp());
}

@pragma("vm:entry-point")
void playerBackgroundService() {
  debugPrint("start playerBackgroundService");
  Logger.root.onRecord.listen((record) {
    print('${record.level.name}: ${record.time}: ${record.message}');
  });
  runBackgroundService(
    config: Config(
      pauseWhenTaskRemoved: false,
    ),
    playUriInterceptor: (mediaId, fallbackUrl) async {
      debugPrint("get media play uri : $mediaId , $fallbackUrl");
      if (mediaId == 'rise') return "asset:///tracks/rise.mp3";
      return fallbackUrl;
    },
    imageLoadInterceptor: (metadata) async {
      debugPrint("load image for ${metadata.mediaId} , ${metadata.title}");
      if (metadata.mediaId == "bamboo") {
        final data = await rootBundle.load("images/bamboo.jpg");
        return Uint8List.view(data.buffer);
      }
      return null;
    },
    playQueueInterceptor: ExamplePlayQueueInterceptor(),
  );
}

class ExampleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PlayerWidget(
      child: OverlaySupport(
        child: MaterialApp(
          home: ExamplePage(),
        ),
      ),
    );
  }
}

class ExamplePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Flutter Music Player Example")),
      body: Column(
        children: <Widget>[
          Expanded(child: _PlayQueueListView(playQueueList: playQueueList)),
          PlayerBottomController(),
        ],
      ),
    );
  }
}

class _PlayQueueListView extends StatelessWidget {
  final List<PlayQueue> playQueueList;

  const _PlayQueueListView({Key? key, required this.playQueueList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: playQueueList.length,
        itemBuilder: (context, index) {
          final queue = playQueueList[index];
          return ListTile(
            title: Text(queue.queueTitle),
            onTap: () {
              Navigator.push(context, new MaterialPageRoute(builder: (context) => PagePlayQueue(queue: queue)));
            },
          );
        });
  }
}

