import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_basic/tabController.dart';
import 'cupertino_page.dart';
import 'package:flutter_basic/myAnimationContainer.dart';
import 'animationOpacity.dart';
import 'drawer.dart';
import 'snackBar.dart';
import 'orientationBuilder.dart';
import 'tabController.dart';
import 'formValidation.dart';
import 'swipeToDismiss.dart';
import 'nativeCode.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        //accentColor: Colors.yellow --> 직접 커스터마이징 가능
        //brightness: Brightness.dark --> 밤 모드
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyMethodchannel() //커밋 테스트용 주석
    );
  }
}

class HelloPage extends StatefulWidget {
  final String title;

  HelloPage(this.title) : super(); //Generate에서 생성

  @override
  _HelloPageState createState() => _HelloPageState();
}

class _HelloPageState extends State<HelloPage> {
  String _message = 'Hello World!';
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: _changeMessage),
        appBar: AppBar(title: Text(widget.title),
        ),
        body: Center(
            child: Column (
              mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(_message, style: TextStyle(fontSize: 30)),
                  RaisedButton(
                    child: Text('화면 이동'), //,과 ;의 차이?
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => CupertinoPage()));
                    },
                  )
                ]
            ))
    );
  }

  void _changeMessage() {
    setState(() {
      _message = '잘 되는군';
    });
  }
}
