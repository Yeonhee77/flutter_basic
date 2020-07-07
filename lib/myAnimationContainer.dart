import 'dart:math';

import 'package:flutter/material.dart';

class MyAnimationContainer extends StatefulWidget {
  @override
  _MyAnimationContainerState createState() => _MyAnimationContainerState();
}

class _MyAnimationContainerState extends State<MyAnimationContainer> {
  double _width = 50;
  double _height = 50;
  Color _color = Colors.green;
  BorderRadius _radius = BorderRadius.circular(8);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animation Container'),
      ),
      body: Center(
        child: AnimatedContainer(
            width: _width,
            height: _height,
            duration: Duration(seconds: 1),
            curve: Curves.fastOutSlowIn, //속도조절
            decoration: BoxDecoration(
                color: _color,
              borderRadius: _radius //decoration을 쓸 때는 color가 null이고 decoration 안에서 컬러를 설정한다.
            ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            final random = Random();
            _width = random.nextInt(300).toDouble();
            _height = random.nextInt(300).toDouble();
            _color = Color.fromRGBO(random.nextInt(256), random.nextInt(256), random.nextInt(256), 1);
            _radius = BorderRadius.circular(random.nextInt(100).toDouble());
          });
        },
        child: Icon(Icons.play_arrow),
      ),
    );
  }
}