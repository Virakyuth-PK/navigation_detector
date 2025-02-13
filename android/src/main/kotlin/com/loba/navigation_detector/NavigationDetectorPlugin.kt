package com.loba.navigation_detector

import android.os.Build
import android.view.View
import androidx.annotation.NonNull
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel

class NavigationDetectorPlugin : FlutterPlugin, MethodChannel.MethodCallHandler {

  private lateinit var channel: MethodChannel

  override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "navigation_detector")
    channel.setMethodCallHandler(this)
  }

  override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
    if (call.method == "getNavigationMode") {
      result.success(getNavigationMode())
    } else {
      result.notImplemented()
    }
  }

  private fun getNavigationMode(): String {
    return if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) {
      when (View.SYSTEM_GESTURE_NAVIGATION) {
        View.SYSTEM_GESTURE_NAVIGATION -> "gesture"
        else -> "buttons"
      }
    } else {
      "buttons"
    }
  }

  override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }
}
