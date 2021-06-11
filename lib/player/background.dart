import 'package:flutter/services.dart';
import 'package:music_player/music_player.dart';
import 'package:netease_music/main.dart';

class ExamplePlayQueueInterceptor extends PlayQueueInterceptor {
  @override
  Future<List<MusicMetadata>> fetchMoreMusic(BackgroundPlayQueue queue, PlayMode playMode) async {
    if (queue.queueId == "fm" && queue.queue.length == 1) {
      return medias.getRange(1, 3).toList();
    }
    throw MissingPluginException();
  }
}
