
import 'package:flutter/material.dart';

class SetDrawer extends StatelessWidget {
  const SetDrawer({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical:  MediaQuery.of(context).padding.top + 10, horizontal: 16),
        child: Column(
          children: [
            Row(
              children: [
                ClipOval(
                  child: Image.network(
                    'https://ae01.alicdn.com/kf/U6de089ce45ff468a8f06c50e19ad7379N.jpg',
                    fit: BoxFit.cover,
                    alignment: Alignment(0, -0.5),
                    width: 50,
                    height: 50,
                  )
                ),
                Padding(
                  padding: EdgeInsets.only(left: 16),
                  child: Text('啊实打实的', textScaleFactor: 1.2)
                )
              ],
            )
          ],
        ),
      )
    );
  }
}