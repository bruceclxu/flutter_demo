import 'package:flutter/widgets.dart';

class LifecycleWatcher extends StatefulWidget {
  @override
  _LifecycleWatcherState createState() => new _LifecycleWatcherState();
}

class _LifecycleWatcherState extends State<LifecycleWatcher> with WidgetsBindingObserver {
  AppLifecycleState _lastLifecyleState;

  @override
  void initState() {
    // 这里进行数据初始化
    print("initState");
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // 这个state 为 inactive  paused  resumed等
    print("didChangeAppLifecycleState"+state.toString());
    setState(() {
      _lastLifecyleState = state;
    });
  }

  @override
  Widget build(BuildContext context) {
    print("build");
    if (_lastLifecyleState == null)
      return new Text('This widget has not observed any lifecycle changes.', textDirection: TextDirection.ltr,style: new TextStyle(fontSize: 15.0));

      return new Text('The most recent lifecycle state this widget observed was: $_lastLifecyleState.',
        textDirection: TextDirection.ltr,style: new TextStyle(fontSize: 15.0));
  }
}
