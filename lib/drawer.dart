import 'package:flutter/material.dart';

class MyDrawer extends StatefulWidget {
  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero, //헤더 위 상단까지 채우는 것
          children: <Widget>[
            DrawerHeader(
              child: Text('Header'),
              decoration: BoxDecoration(
                color: Colors.blue
              ),
            ),

            ListTile(
              title: Text('item 1'),
              onTap: () {
                //To do
                Navigator.pop(context); //누르면 다시 이전 화면으로 돌아가게
              },
            ),
            ListTile(
              title: Text('item 2'),
            ),
            ListTile(
              title: Text('item 3'),
            ),

          ],
        ),
      ),
      appBar: AppBar(
        title: Text('Drawer'),
      ),
      body: Center(
        child: Text('Drawer example'),
      )
    );
  }
}
