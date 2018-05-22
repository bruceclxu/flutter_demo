import 'package:flutter/material.dart';
import 'dart:async';

class GestureDemo extends StatefulWidget {
  GestureDemo({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _GestureDemoState createState() => new _GestureDemoState();
}

class _GestureDemoState extends State<GestureDemo> {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        // 去掉导航栏下面的阴影
        elevation: 0.0,
        title: new Text('手势demo'),

      ),
        body:new GestureDetector(
            onTap: () {
              // 点击按钮开始下拉刷新
              print("onTap");
            },
            onDoubleTap: (){
              // 双击
              print("onDoubleTap");
            },
            onLongPress: (){
              //长按
              print("onLongPress");
            },
            onHorizontalDragCancel: (){
              //下拉松手
              print("onHorizontalDragCancel");
            },
            onHorizontalDragDown: (type){
              //下拉
              print("onHorizontalDragDown");
            },
            onHorizontalDragStart: (type){
              print("onHorizontalDragStart");
            },
            onHorizontalDragEnd: (type){
              print("onHorizontalDragEnd");
            },
            onVerticalDragDown: (type){
              print("onVerticalDragDown");
            },
            onVerticalDragCancel: (){
              print("onVerticalDragCancel");
            },


            child: new Container(
                alignment: Alignment.center,
                child: new Text('点击触摸看log',style: new TextStyle(fontWeight: FontWeight.w300,fontSize: 42.0,color: Colors.blue,height: 3.0))
            )
        )
    );
  }

}
