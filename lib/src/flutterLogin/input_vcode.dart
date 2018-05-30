import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import './constant.dart';
import 'dart:async';

class VcodeInput extends StatefulWidget {
  @override
  createState() => new VcodeInputState();
}

class VcodeInputState extends State<VcodeInput>{
  int count=60;

  @override
  Widget build(BuildContext context) {
    void callback(Timer timer) {
      print(count);
      setState(() {
        if(count>0){
          count--;
        }else{
          timer.cancel();
          count = 60;
        }
      });
    }
    VoidCallback pressCallback() {
      print('VcodeInputState=' +phone_num);
      if(phone_num.isNotEmpty&&phone_num.length==11){
        if(count==60){
          return () {
            count = 59;
            new Timer.periodic(new Duration(milliseconds: 1000), callback);
          };
        }else{
          return null;
        }
      }
    }

    String getBtnText(){
      if(count == 60){
        return "Get";
      }else{
        return count.toString();
      }
    }


    return  new Container(
      margin: const EdgeInsets.only(left:20.0,top: 20.0,right: 20.0,bottom: 10.0),
      child:new TextField(
        keyboardType:TextInputType.phone,
        style: new TextStyle(color: Colors.black),
        decoration: new InputDecoration(
            prefixIcon:
            new Container(
              margin: const EdgeInsets.only(left:10.0,top: 10.0,right: 10.0,bottom: 10.0),
              child: new Icon(
                Icons.verified_user,
                color: Colors.purple[300],
                size: 30.0,
              ),
            ),

            suffixIcon: new CupertinoButton(
              color: Colors.purple[300],
              minSize: 50.0,
              padding: const EdgeInsets.symmetric(horizontal: 34.0),
              borderRadius: new BorderRadius.circular(32.0),
              child: Text(
                getBtnText(),
                style: const TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
              onPressed: pressCallback(),

            ),
            contentPadding: const EdgeInsets.only(left:10.0,top: 15.0,right: 2.0,bottom: 15.0),
            hintText: "请输验证码",
            hintStyle: new TextStyle(color: Colors.black26),
            border: new OutlineInputBorder(borderRadius: new BorderRadius.circular(100.0),borderSide: new BorderSide(width: 0.5,color: Colors.green))
        ),

        onChanged: (String text){
          v_code=text;
          setState(() {
            print("here");
          });
        },
      ),
    );
  }
}
