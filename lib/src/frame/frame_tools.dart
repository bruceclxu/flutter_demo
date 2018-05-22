import 'package:flutter/material.dart';

class NativeFrame extends StatefulWidget {
  @override
  ListViewPageState createState() => new ListViewPageState();
}

class ListViewPageState extends State<NativeFrame> {
  List<String> list = <String>[];

  @override
  void initState() {
    super.initState();
    list.add('路由');
    list.add('手势');
    list.add('动画');
    list.add('本地存储');
    list.add('待更新');
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('其他工具'),
        elevation: 0.0, // 阴影高度
      ),
      body: new ListView.builder(
        physics: const AlwaysScrollableScrollPhysics(),
        itemCount: this.list.length,
        itemBuilder: (_, int index) => _createItem(context, index),
      ),
    );

  }
  _createItem(BuildContext context, int index) {
    return new GestureDetector(
      onTap: () {
        if (index == 0) {
          Navigator.pushNamed(context, '/router/home');
        }
        else if (index == 1) {
          Navigator.pushNamed(context, '/router/gesture');
        }
        else if (index == 2) {
          Navigator.pushNamed(context, '/ui/textstyle');
          print("2");
        }
        else {
          print("3");
        }
      },
      child: new Container(
        height: 50.0,
        color: Colors.white,
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(left: 15.0),
                    child: new Text('${this.list[index]}',style: new TextStyle(fontWeight: FontWeight.w300,fontSize: 22.0,color: Colors.blue)),
                  ),
                ],
              ),
            ),
            new Divider(
              height: 0.5,
            )
          ],
        ),
      ));

  }

}
