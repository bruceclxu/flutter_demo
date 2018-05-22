//package com.neo.flutterapp
//
//import android.os.Bundle
//
//import io.flutter.app.FlutterActivity
//import io.flutter.plugins.GeneratedPluginRegistrant
//
//class SplashActivity(): Activity() {
//
//  override fun onCreate(savedInstanceState: Bundle?) {
//    super.onCreate(savedInstanceState)
//    setTheme(R.style.AppTheme)
//    initMW()
//    goHome()
//  }
//
//  private fun initMW() {
//    val config = MWConfiguration(this)
//    if (BuildConfig.DEBUG) {
//      config.setLogEnable(true)
//    }
//    MagicWindowSDK.initSDK(config)
//  }
//
//  private fun goHome() {
//
////        Debug.startMethodTracing()
//    if (SPHelper.create(this).getBoolean(Config.SP_GUIDE_TAG)) {
//      routerWithAnim(Config.ROUTER_MAIN_ACTIVITY).go(this)
//    } else {
//      routerWithAnim(Config.ROUTER_GUIDE_ACTIVITY).go(this)
//
//    }
////        routerWithAnim(io.merculet.core.config.Config.ROUTER_GUIDE_ACTIVITY).go(this)
//
//    finish()
//  }
//
//}
