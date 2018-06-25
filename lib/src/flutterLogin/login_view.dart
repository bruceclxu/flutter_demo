// Copyright 2017 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import './constant.dart';
import './input_vcode.dart';

class LoginDemo extends StatefulWidget {
  @override
  createState() => new LoginState();
}

class LoginState extends State<LoginDemo>  {

  @override
  void initState() {
    phone_num = "";
    v_code = "";
    isread = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget logoSection = new Container(
      margin: const EdgeInsets.only(left:130.0,top: 30.0,right: 130.0,bottom: 20.0),
      child:  new Image.asset(
        'assets/logo.png',
        width: 40.0,
        height: 120.0,
        fit: BoxFit.contain,
      ),
    );

    Widget input_phonenum = new Container(
      margin: const EdgeInsets.only(left:20.0,top: 20.0,right: 20.0,bottom: 10.0),
      child: new TextField(

        keyboardType:TextInputType.phone,
        style: new TextStyle(color: Colors.black),
        decoration: new InputDecoration(
            prefixIcon: new Container(
              margin: const EdgeInsets.only(left:10.0,top: 10.0,right: 10.0,bottom: 10.0),
              child: new Icon(
                Icons.stay_current_portrait,
                color: Colors.purple[300],
                size: 30.0,
              ),
            ),
            contentPadding: const EdgeInsets.only(left:10.0,top: 15.0,right: 10.0,bottom: 15.0),
            hintText: "请输入手机号码",
            hintStyle: new TextStyle(color: Colors.black26),
            border: new OutlineInputBorder(borderRadius: new BorderRadius.circular(100.0),borderSide: new BorderSide(width: 0.5,color: Colors.green))
        ),

        onChanged: (String text){
          print(text);

          setState(() {
            phone_num = text;
            print("here2 = " + text);
          });
        },
      ),
    );

    void showTextDialog<T>({BuildContext context,String text}) {
      showDialog<T>(
        context: context,
        child: new CupertinoAlertDialog(
          title:  Text(text),
          actions: <Widget>[
            new CupertinoDialogAction(
              child: const Text('关闭'),
              isDestructiveAction: true,
              onPressed: () {
                Navigator.pop(context, 'Discard');
              },
            ),
          ],
        ),
      ).then<void>((T value) {
        if (value != null) {

        }
      });
    }
    VoidCallback pressCallback() {
      print("pressCallback = " + v_code);

      if(v_code.isNotEmpty&&v_code.length==6&&phone_num.isNotEmpty&&phone_num.length==11&&isread){
        return () {
          showTextDialog(context: context,text:"提交服务器");
        };
      }else{
        return null;
      }
    }

    Widget submit_btn = new Container(
      margin: const EdgeInsets.only(left:20.0,top: 20.0,right: 20.0,bottom: 20.0),
      child:  new CupertinoButton(
        color:Colors.purple[300],
        minSize: 50.0,
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        borderRadius: new BorderRadius.circular(10.0),
        child: const Text(
          'Log in',
          style: const TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.w700,
          ),
        ),
        onPressed: pressCallback(),
      ),
    );

    Widget check_document = new Align(
        alignment: const Alignment(0.0, -0.2),
        child: new Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              new Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  new Checkbox(
                    value: isread,
                    activeColor:Colors.purple[300],
                    onChanged: (bool value) {
                      print(value);
                      isread = value;
                      setState(() {
                      });
                    },
                  ),
                  new Text("阅读并同意《xxxx协议》"),
                ],
              ),
            ]
        )
    );

    return new Scaffold(
        appBar: new AppBar(
          title: new Text('Log in',style: new TextStyle(color: Colors.black54),),
          backgroundColor: Colors.white,
          iconTheme:new IconThemeData(color: Colors.black54),
          textTheme: new TextTheme(),
          elevation: 0.5, // 阴影高度
//          textTheme: new TextTheme(new TextStyle(color: Colors.black26)),
        ),
        body: new ListView(
          children: [
            logoSection,
            input_phonenum,
            new VcodeInput(),
            check_document,
            submit_btn,
          ],
      ),
    );

  }


}