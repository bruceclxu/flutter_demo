// Step 4: Create an infinite scrolling lazily loaded list

import 'package:flutter/material.dart';
import './src/frame/frame_common.dart';
import './src/frame/frame_tools.dart';
import './src/frame/frame_network.dart';

//需要跳转页面，用于配置路由
import './src/router/router_home_page.dart';
import './src/router/second_page.dart';
import './src/gestuere/gesture_demo.dart';
import './src/demos/first_demo.dart';
import './src/demos/futher_demo.dart';
import './src/refresh/refreshIndicator_demo.dart';
import './src/refresh/load_more_demo.dart';
import './src/ui/text_demo.dart';
import './src/ui/beautiful_dialogs.dart';
import './src/nativedemos/native_battery_demos.dart';
import './src/lifecycles/lifecycle.dart';
import './src/ui/progress.dart';
import './src/anim/animition_test.dart';
import './src/ui/paint_test.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primaryColor: Colors.lightBlue[800],
        accentColor: Colors.cyan[600],
        primarySwatch: Colors.blue,
      ),
      home: new BottomTabBarPage(),// home相当于 /
      routes: <String, WidgetBuilder> {
        //静态路由，不能传参数
        '/demos/demo1': (_) =>RandomWords(),
        '/demos/demo2': (_) =>new FutherDemo(),
        '/router/home': (_) => new RouterHomePage(),
        '/router/second': (_) => new SecondPage(),
        '/router/gesture': (_) => new GestureDemo(),
        '/ui/textstyle': (_) => new TextStylePage(),
        '/refresh/pullrefresh': (_) => new RefreshIndicatorDemo(),
        '/refresh/loadmore': (_) => new LoadMorePage(),
        '/refresh/beautifulldialog': (_) => new CupertinoDialogDemo(),
        '/platform/battery': (_) => new PlatformChannel(),
        '/lifecycle/lifcycle': (_) => new LifecycleWatcher(),
        '/ui/progress': (_) => new ProgressApp(),
        '/anim/animfade': (_) => new FadeAppTest(),
        '/ui/paint': (_) => new PaintApp(),

    },
    );
  }
}

class BottomTabBarPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new BottomTabBarState();
  }
}

class BottomTabBarState extends State<BottomTabBarPage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Stack(
        children: <Widget>[
          /// Offstage 这个widget 在offstage条件为假的时候，不会显示，不会响应事件，不会占用任何的父widget的空间
          new Offstage(
            // offstage参数是一个bool类型，表示是否要显示这个widget
            offstage: _currentIndex != 0,
            child: new TickerMode(
              enabled: _currentIndex == 0,
              child: new ListViewPage(),
            ),
          ),
          new Offstage(
            offstage: _currentIndex != 1,
            child: new TickerMode(
              enabled: _currentIndex == 1,
                child: new NetWorkPage()
            ),
          ),
          new Offstage(
            offstage: _currentIndex != 2,
            child: new TickerMode(
              enabled: _currentIndex == 2,
                child: new NativeFrame(),
            ),
          ),
        ],
      ),
      bottomNavigationBar: new BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          new BottomNavigationBarItem(
              icon: new Icon(Icons.home), title: new Text('common')),
          new BottomNavigationBarItem(
              icon: new Icon(Icons.crop_square), title: new Text('network')),
          new BottomNavigationBarItem(
              icon: new Icon(Icons.ac_unit), title: new Text('tools')),
        ],
        // 可以改变这个来设置初始的时候显示哪个tab
        currentIndex: _currentIndex,
        onTap: (int index) {
          // 这里点击tab上的item后，会执行，setState来刷新选中状态
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
