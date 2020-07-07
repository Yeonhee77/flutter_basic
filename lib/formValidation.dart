import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyFormValidation extends StatefulWidget {
  @override
  _MyFormValidationState createState() => _MyFormValidationState();
}

class _MyFormValidationState extends State<MyFormValidation> {
  final _formkey = GlobalKey<FormState>();
  //글로벌 키란? 위젯이 가지는 속성 중 하나로 전체 앱에서 유니크한 값이어야 한다.
  //(위젯을 나타낼 수 있는 유니크한 값)
  FocusNode nameFocusNode;
  final nameController = TextEditingController();

  @override
  void initState(){
    super.initState();
    nameFocusNode = FocusNode();
  }

  @override
  void dispose(){
    nameFocusNode.dispose();
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form Validation'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextFormField(
                  validator: (value) {
                    if(value.isEmpty) { return '공백은 허용되지 않습니다.'; }
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RaisedButton(
                      onPressed: () {
                        if(_formkey.currentState.validate()) {
                          //valid
                          Scaffold.of(_formkey.currentContext).showSnackBar(SnackBar(content: Text('처리중')));
                        }
                      },
                      child: Text('완료')),
                ),

                TextField(//validator 기능 없음
                  controller: nameController,
                  onChanged: (text) {
                    print(text);
                  },
                  autofocus: true, //화면이 떴을때 먼저 활성화 되게
                  decoration: InputDecoration(
                    hintText: '이름을 입력해주세요',
                    //border: InputBorder.none ,//밑줄 사라짐
                    labelText: '이름'
                  ),
                ),
                RaisedButton(
                  onPressed: () {
                    FocusScope.of(context).requestFocus(nameFocusNode);
                  },
                  child: Text('포커스'),
                ),
                RaisedButton(
                  onPressed: () {
                    print(nameController.text);
                    showDialog(context: context,
                        builder: (context) {
                          return AlertDialog(content: Text(nameController.text),);
                    });
                  },
                  child: Text('TextField의 값 확인'),
                ),
              ],
            )
        ),
      ),
    );
  }
}
