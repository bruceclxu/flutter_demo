package com.neo.flutterapp

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

class MainActivity(): FlutterActivity() {
  private val BATTERY_CHANNEL = "samples.flutter.io/battery"
  private val CHARGING_CHANNEL = "samples.flutter.io/charging"

  override fun onCreate(savedInstanceState: Bundle?) {
    super.onCreate(savedInstanceState)
    GeneratedPluginRegistrant.registerWith(this)

    EventChannel(flutterView, CHARGING_CHANNEL).setStreamHandler(
            object : EventChannel.StreamHandler{
              private var chargingStateChangeReceiver: BroadcastReceiver? = null
              override fun onListen(arguments: Any, events: EventSink) {
                chargingStateChangeReceiver = createChargingStateChangeReceiver(events)
                registerReceiver(
                        chargingStateChangeReceiver, IntentFilter(Intent.ACTION_BATTERY_CHANGED))
              }

              override fun onCancel(arguments: Any) {
                unregisterReceiver(chargingStateChangeReceiver)
                chargingStateChangeReceiver = null
              }
            }
    )

    MethodChannel(flutterView, BATTERY_CHANNEL).setMethodCallHandler(
            object : MethodCallHandler {

              override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
                if (call.method == "getBatteryLevel") {
                  val batteryLevel = getBatteryLevel()

                  if (batteryLevel != -1) {
                    result.success(batteryLevel)
                  } else {
                    result.error("UNAVAILABLE", "Battery level not available.", null)
                  }
                } else {
                  result.notImplemented()
                }
              }
            }
    )
  }

  private fun createChargingStateChangeReceiver(events: EventSink): BroadcastReceiver {
    return object : BroadcastReceiver() {
      override fun onReceive(context: Context, intent: Intent) {
        val status = intent.getIntExtra(BatteryManager.EXTRA_STATUS, -1)

        if (status == BatteryManager.BATTERY_STATUS_UNKNOWN) {
          events.error("UNAVAILABLE", "Charging status unavailable", null)
        } else {
          val isCharging = status == BatteryManager.BATTERY_STATUS_CHARGING || status == BatteryManager.BATTERY_STATUS_FULL
          events.success(if (isCharging) "charging" else "discharging")
        }
      }
    }
  }

  private fun getBatteryLevel(): Int {
    if (VERSION.SDK_INT >= VERSION_CODES.LOLLIPOP) {
      val batteryManager = getSystemService(Context.BATTERY_SERVICE) as BatteryManager
      return batteryManager.getIntProperty(BatteryManager.BATTERY_PROPERTY_CAPACITY)
    } else {
      val intent = ContextWrapper(applicationContext).registerReceiver(null, IntentFilter(Intent.ACTION_BATTERY_CHANGED))
      return intent!!.getIntExtra(BatteryManager.EXTRA_LEVEL, -1) * 100 / intent.getIntExtra(BatteryManager.EXTRA_SCALE, -1)
    }
  }

}
