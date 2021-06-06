import 'package:flutter/material.dart';
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
  @override
  void initState() {
    // TODO: implement initState
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
