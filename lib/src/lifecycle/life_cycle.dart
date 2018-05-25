import 'package:flutter/material.dart';

class LifeCyclePage extends StatefulWidget {
  @override
  LifeCyclePageState createState() => new LifeCyclePageState();
}

class LifeCyclePageState extends State<LifeCyclePage> {



  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('生命周期'),
        elevation: 0.0, // 阴影高度
      ),
      body: new Text("测试组件")
    );
  }



}
