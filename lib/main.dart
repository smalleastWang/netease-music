import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:netease_music/store/player_controller.dart';
import 'package:netease_music/widget/home.dart';
import 'package:netease_music/widget/login.dart';
import 'package:provider/provider.dart';


SystemUiOverlayStyle uiStyle = SystemUiOverlayStyle.light.copyWith(
  statusBarColor: Colors.transparent,
  // statusBarIconBrightness: Brightness.light,
);

void main() {
  runApp(MyApp());
  SystemChrome.setSystemUIOverlayStyle(uiStyle);
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PlayerController())
      ],
      child: MaterialApp(
        title: '音乐播放器',
        theme: ThemeData(
          primarySwatch: Colors.red,
          
        ),
        home: HomePage(title: '首页'),
        // home: LoginPage(),
      ),
    );
  }
}
