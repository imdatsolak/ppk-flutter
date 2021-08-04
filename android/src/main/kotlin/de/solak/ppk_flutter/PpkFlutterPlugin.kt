package de.solak.ppk_flutter

import android.content.Context
import android.graphics.pdf.PdfDocument
import android.os.Build
import androidx.annotation.NonNull
import com.pspdfkit.PSPDFKit

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

/** PpkFlutterPlugin */
class PpkFlutterPlugin: FlutterPlugin, MethodCallHandler {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private lateinit var channel : MethodChannel
  private lateinit var context : Context

  override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "de.solak.ppk-flutter.global")
    channel.setMethodCallHandler(this)
    context = flutterPluginBinding.applicationContext
    PpkFlutterNotifier.setChannel(channel)
  }

  override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
    var arguments: Map<String, Any>? = null

    try {
      arguments = call.arguments as Map<String, Any>
    } catch (e: Error) {

    }

    when (call.method) {
      "pspdfkitVersion" -> {
        result.success("Android ${Build.VERSION.RELEASE}")
      }
      "setLicenseKey" -> {
        if (arguments != null) {
          val licenseKey: String? = PpkArgumentConverter.licenseKeyFromArguments(arguments)
          if (licenseKey != null) {
            PSPDFKit.initialize(context, licenseKey)
          }
        }
      }
      "presentGlobal" -> {
        if (arguments != null) {
          presentGlobal(arguments, result)
        }
      }
      "presentGlobalWithWatermark" -> {

      }
      else -> {
        result.notImplemented()
      }
    }
  }

  override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
    PpkFlutterNotifier.setChannel(null)
  }

  private fun presentGlobal(arguments: Map<String, Any>, @NonNull result: Result) {
    var documentPath: String? = PpkArgumentConverter.documentPathFromArguments(arguments)
    if (documentPath != null) {
      documentPath = PpkHelper.checkDocumentPathForFileScheme(documentPath)
    }

  }
}
