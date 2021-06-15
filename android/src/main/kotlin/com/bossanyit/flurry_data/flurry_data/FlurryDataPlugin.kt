package com.bossanyit.flurry_data.flurry_data

import android.content.Context
import android.util.Log
import androidx.annotation.NonNull
import com.flurry.android.FlurryAgent
import com.flurry.android.FlurryAgentListener
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result


/** FlurryDataPlugin */
class FlurryDataPlugin : FlutterPlugin, MethodCallHandler {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private var channel: MethodChannel? = null
  private var context: Context? = null

  override fun onAttachedToEngine(
      @NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding
  ) {
    channel =
        MethodChannel(flutterPluginBinding.binaryMessenger, "com.bossanyit.flurry_data.flurry_data")
    channel?.setMethodCallHandler(this)
    context = flutterPluginBinding.applicationContext
  }

  private fun logEvent(message: String) {
    FlurryAgent.logEvent(message)
  }

  private fun setUserId(userId: String) {
    FlurryAgent.setUserId(userId)
  }

  override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
    when (call.method) {
      "initialize" -> {
        val apiKey: String? = call.argument("api_key_android")
        val showLog: Boolean = call.argument("is_log_enabled") ?: false

        if (apiKey == null) {
          throw Exception("API key for android is not set")
        }

        FlurryAgent.Builder()
            .withLogEnabled(showLog)
            .withCaptureUncaughtExceptions(true)
            .withContinueSessionMillis(10000)
            .withLogLevel(Log.DEBUG)
            .withListener(
                FlurryAgentListener() {
                  fun onSessionStarted() {
                    //result.success(null);
                  }
                })
            .build(context!!, apiKey)
        result.success(null);
      }
      "userId" -> {
        val userId: String? = call.argument("userId")
        if (userId != null) {
          setUserId(userId)
        }
        result.success(null)
      }
      "logEvent" -> {
        val message: String? = call.argument("message")
        if (message != null) {
          logEvent(message)
        }
        result.success(null)
      }
      else -> {
        result.notImplemented()
      }
    }
  }

  override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
    channel?.setMethodCallHandler(null)
    channel = null
  }
}
