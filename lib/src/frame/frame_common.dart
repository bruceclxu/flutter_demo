import 'package:flutter/material.dart';

class ListViewPage extends StatefulWidget {
  @override
  ListViewPageState createState() => new ListViewPageState();
}

class ListViewPageState extends State<ListViewPage> {
  List<String> list = <String>[];

  @override
  void initState() {
    super.initState();
    list.add('官网 第一个小页面');
    list.add('官网 扁平化页面');
    list.add('dialogs');

    list.add('Basics');
    list.add('Material Components');
    list.add('Cupertino (iOS-style widgets)');
    list.add('Layout');
    list.add('Text');
    list.add('Assets, Images, and Icons');
    list.add('Input');
    list.add('Animation and Motion');
    list.add('Interaction Models');
    list.add('Styling');
    list.add('Painting and effects');
    list.add('Async');

    list.add('Scrolling');
    list.add('Accessibility');
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('ui控件一览'),
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
            Navigator.pushNamed(context, '/demos/demo1');
          }else if (index == 1) {
            Navigator.pushNamed(context,'/demos/demo2');
          }else if (index == 2) {
          }else if (index == 3) {
          }else if (index == 6) {
            Navigator.pushNamed(context, '/ui/textstyle');
          }
          else {
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
