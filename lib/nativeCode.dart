import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyMethodchannel extends StatefulWidget {
  @override
  _MyMethodchannelState createState() => _MyMethodchannelState();
}

class _MyMethodchannelState extends State<MyMethodchannel> {
  static const platform = const MethodChannel('example.com/value');

  String _value = 'null';

  Future<void> _getNativeValue() async {//비동기로 데이터를 받는다
    String value;
    try {
      value = (await);
      platform.invokeMethod('getValue');
    } on PlatformException catch(e) {
      value = '네이티브 코드 실행 에러: ${e.message}';
    }

    setState(() {
      _value = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Method Channel'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('$_value'),
            RaisedButton(
              child: Text('네이티브 값 얻기'),
              onPressed: () {
                _getNativeValue();
              },
            )
          ],
        ),
      ),
    );
  }
}
