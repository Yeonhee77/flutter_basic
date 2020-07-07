import 'package:flutter/material.dart';

class MySwipeToDismiss extends StatefulWidget {
  @override
  _MySwipeToDismissState createState() => _MySwipeToDismissState();
}

class _MySwipeToDismissState extends State<MySwipeToDismiss> {
  final items = List<String>.generate(20, (i) => "Item ${i+1}");
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Swipe to Dismiss'),
      ),
      body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];
            return Dismissible( //실제로 삭제된 것이 아닌 삭제된 것처럼 보이는 것
              background: Container(color: Colors.red,),
                direction: DismissDirection.startToEnd, //방향조절
                onDismissed: (direction) {
                  setState(() {
                    //direction: DismissDirection.startToEnd,
                    items.removeAt(index); //slide하면 실제로 삭제되도록
                  });
                },
                child: ListTile(title: Text('${items[index]}'),),
                key: Key(item), //각각 아이템에 유니크한 키 값 할당
            );
          }
      )
    );
  }
}
