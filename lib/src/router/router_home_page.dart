import 'package:flutter/material.dart';
import './second_page.dart';
import 'package:flutter/cupertino.dart';

class RouterHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new RouterHomeState();
  }
}

class RouterHomeState extends State<RouterHomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          // 去掉导航栏下面的阴影
          elevation: 0.0,
          title: new Text('路由导航'),
        ),
        body: new Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new Container(
              margin: EdgeInsets.all(10.0),
              height: 44.0,
              color: Color.fromARGB(255, 255, 0, 0),
              child: new FlatButton(
                onPressed: () {
                  Navigator
                      .of(context)
                      .pushNamed('/router/second')
                      .then((value) {
                    // dialog显示返回值
                    showDemoDialog<String>(
                      context: context,
                      child: new CupertinoAlertDialog(
                        title:  Text(value.toString()),
                        actions: <Widget>[
                          new CupertinoDialogAction(
                            child: const Text('关闭'),
                            isDestructiveAction: true,
                            onPressed: () {
                              Navigator.pop(context, 'Discard');
                            },
                          ),
//                          new CupertinoDialogAction(
//                            child: const Text('Cancel'),
//                            isDefaultAction: true,
//                            onPressed: () {
//                              Navigator.pop(context, 'Cancel');
//                            },
//                          ),
                        ],
                      ),
                    );
                  });
                },
                child: new Text('push 页面并接收返回值'),
              ),
            ),
            new Container(
              margin: EdgeInsets.all(10.0),
              height: 44.0,
              color: Color.fromARGB(255, 255, 0, 0),
              child: new FlatButton(
                onPressed: () {
                  Navigator
                      .of(context)
                      .push(new MaterialPageRoute(builder: (_) {
                    return new SecondPage(title: '路由是个好东西，要进一步封装');
                  }));
                },
                child: new Text('push 页面并传递参数过去'),
              ),
            ),
          ],
        ));
  }

//  _showDialog(BuildContext context, String text) {
//    CupertinoDialog dialog = new CupertinoDialog();

//    showDialog(
//        context: context,
//        barrierDismissible: true,
//        child: new Center(
//          child: new Column(
//            children: <Widget>[
//              new Text('${text}'),
//              new GestureDetector(
//                onTap: () {
//                  Navigator.of(context).pop();
//                },
//                child: new Container(
//                  child: new Text('关闭'),
//                ),
//              )
//            ],
//          ),
//        ));


//  }

    void showDemoDialog<T>({BuildContext context, Widget child}) {
      showDialog<T>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) => child,
      ).then<void>((T value) {
        // The value passed to Navigator.pop() or null.
        if (value != null) {
//          _scaffoldKey.currentState.showSnackBar(
//            new SnackBar(
//              content: new Text('You selected: $value'),
//            ),
//          );
        }
      });
    }
}
