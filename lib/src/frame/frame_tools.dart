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
    list.add('list下拉刷新');
    list.add('list上拉加載');
    list.add('生命周期');
    list.add('动画');
    list.add('调用android native方法');
    list.add('paint');
    list.add('进入登录demo');
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
          Navigator.pushNamed(context, '/refresh/pullrefresh');
        }else if(index == 3){
          Navigator.pushNamed(context, '/refresh/loadmore');
        }else if(index == 4){
          Navigator.pushNamed(context, '/lifecycle/lifcycle');
        }else if(index == 5){
          Navigator.pushNamed(context, '/anim/animfade');
        }else if(index == 6){
          Navigator.pushNamed(context, '/platform/battery');
        }else if(index == 7){
          Navigator.pushNamed(context, '/ui/paint');
        }else if(index == 8){
          Navigator.pushNamed(context, '/flutterlogin/login');
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
