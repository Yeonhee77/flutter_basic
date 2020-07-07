import 'package:flutter/material.dart';

class MyAnimatedOpacity extends StatefulWidget {
  @override
  _MyAnimatedOpacityState createState() => _MyAnimatedOpacityState();
}

class _MyAnimatedOpacityState extends State<MyAnimatedOpacity> {
  bool _visible = true; //1과 0을 왔다갔다 하게

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animated Opacity'),
      ),
      body: Center(
        child: AnimatedOpacity(opacity: _visible ? 1.0 : 0.0, duration: Duration(seconds: 1),
          //opacity는 0부터 1.0까지, 0.5초는 miliseconds: 500
          child: Container(
            width: 200,
            height: 200,
            color: Colors.green,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.play_arrow), onPressed: () {
          setState(() {
            _visible = !_visible;
          });
      },
      ),
    );
  }
}
