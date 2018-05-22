import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SpTest extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new SpTestState();
  }
}

class SpTestState extends State<SpTest> {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        body: new Center(
          child: new RaisedButton(
            onPressed: _incrementCounter,
            child: new Text('Increment Counter'),
          ),
        ),
      ),
    );
  }
}
_incrementCounter() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  int counter = (prefs.getInt('counter') ?? 0) + 1;
  print('Pressed $counter times.');
  prefs.setInt('counter', counter);
}