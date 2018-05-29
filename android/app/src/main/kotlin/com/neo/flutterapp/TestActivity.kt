package com.neo.flutterapp

import android.app.Activity
import android.content.*
import android.os.Bundle

import io.flutter.app.FlutterActivity
import io.flutter.plugins.GeneratedPluginRegistrant
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.EventChannel.EventSink
import io.flutter.plugin.common.EventChannel
import android.os.BatteryManager
import android.os.Build.VERSION_CODES
import android.os.Build.VERSION
import android.widget.TextView

class TestActivity(): Activity() {

  override fun onCreate(savedInstanceState: Bundle?) {
    super.onCreate(savedInstanceState)

    var tv:TextView= TextView(baseContext)
    tv.setText("test")
    setContentView(tv)
  }

}
