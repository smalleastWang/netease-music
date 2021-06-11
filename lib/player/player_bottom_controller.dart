import 'package:flutter/material.dart';
import 'package:music_player/music_player.dart';
import 'package:netease_music/page_playing.dart';
import 'package:netease_music/player/player.dart';
import 'package:netease_music/widgets/music_controller.dart';

import '../page_play_queue.dart';

class PlayerBottomController extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final MusicMetadata metadata = context.listenPlayerValue.metadata;
    // ignore: unnecessary_null_comparison
    if (metadata == null) {
      return Container();
    }
    return Material(
      color: Colors.white,
      child: ListTile(
        leading: Icon(Icons.music_note),
        title: Text(metadata.title),
        subtitle: Text(metadata.subtitle),
        trailing: ButtonBar(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            IconButton(
                icon: Icon(Icons.skip_previous),
                onPressed: () {
                  PlayerWidget.transportControls(context).skipToPrevious();
                }),
            PlayPauseButton(),
            IconButton(
                icon: Icon(Icons.skip_next),
                onPressed: () {
                  PlayerWidget.transportControls(context).skipToNext();
                }),
            IconButton(
              icon: Icon(Icons.queue_music),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => PagePlayingQueue()));
              },
            ),
          ],
        ),
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => PagePlaying()));
        },
      ),
    );
  }
}
