
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class PlayerWidget extends StatefulWidget {
  @override
  _PlayerWidgetState createState() => _PlayerWidgetState();
}

class _PlayerWidgetState extends State<PlayerWidget> {
  final url = 'https://luan.xyz/files/audio/ambient_c_motion.mp3';
  AudioPlayer audioPlayer = AudioPlayer();
  @override
  void initState() {
    // TODO: implement initState
    play();
    super.initState();
  }
  play() async {
    int result = await audioPlayer.play(url);
    if (result == 1) {
      // success
      print('success');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}