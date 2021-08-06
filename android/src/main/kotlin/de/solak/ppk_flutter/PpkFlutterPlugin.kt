package de.solak.ppk_flutter

import android.content.Context
import android.content.Intent
import android.graphics.pdf.PdfDocument
import android.net.Uri
import android.os.Build
import androidx.annotation.NonNull
import com.pspdfkit.PSPDFKit
import com.pspdfkit.configuration.activity.PdfActivityConfiguration
import com.pspdfkit.ui.PdfActivity
import com.pspdfkit.ui.PdfActivityIntentBuilder

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.plugin.common.PluginRegistry.Registrar
import kotlin.reflect.KClass

/** PpkFlutterPlugin */
class PpkFlutterPlugin: FlutterPlugin, MethodCallHandler {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  var channel : MethodChannel? = null
  lateinit var context : Context

  companion object {
    fun registerWith(registrar: Registrar) {
      val instance = PpkFlutterPlugin()
      val channel = MethodChannel(registrar.messenger(), "de.solak.ppk-flutter.global")
      instance.context = registrar.activeContext()
      instance.channel = channel
      channel.setMethodCallHandler(instance)
      PpkFlutterNotifier.setChannel(channel)
    }
  }

  override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
//    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "de.solak.ppk-flutter.global")
//    channel.setMethodCallHandler(this)
//    context = flutterPluginBinding.applicationContext
//    PpkFlutterNotifier.setChannel(channel)
  }

  override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
    var arguments: Map<String, Any>? = null

    if (call.arguments != null) {
      try {
        @Suppress("UNCHECKED_CAST")
        arguments = call.arguments as Map<String, Any>
      } catch (e: Error) {

      }
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
      "present" -> {
        if (arguments != null) {
          present(arguments, result, false)
        }
      }
      "presentWithWatermark" -> {
        if (arguments != null) {
          present(arguments, result, true)
        }
      }
      else -> {
        result.notImplemented()
      }
    }
  }

  override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
    channel?.setMethodCallHandler(null)
    PpkFlutterNotifier.setChannel(null)
  }

  private fun present(arguments: Map<String, Any>, @NonNull result: Result, watermarked: Boolean) {
    var documentPath: String? = PpkArgumentConverter.documentPathFromArguments(arguments)
    if (documentPath != null) {
      val ppkConfig = PpkConfiguration(arguments, context)
      val configuration = ppkConfig.configuration
      val isImageDocument: Boolean

      documentPath = PpkHelper.checkDocumentPathForFileScheme(documentPath)
      isImageDocument = PpkArgumentConverter.isImageDocument(documentPath)
      PpkActivity.setLoadedDocumentResult(result)

      if (watermarked) {
        var watermarkString: String? = PpkArgumentConverter.watermarkFromArguments(arguments)
        if (watermarkString == null) {
          watermarkString = "This preview was generated using netfiles app for Android."
        }
        PpkWatermarkedActivity.setWatermarkString(watermarkString)
        if (isImageDocument) {
          val intent: Intent = PdfActivityIntentBuilder.fromImageUri(context, Uri.parse(documentPath))
            .activityClass(PpkWatermarkedActivity::class.java)
            .configuration(configuration)
            .build()
          context.startActivity(intent)
        } else {
          val intent: Intent = PdfActivityIntentBuilder.fromUri(context, Uri.parse(documentPath))
            .activityClass(PpkWatermarkedActivity::class.java)
            .configuration(configuration)
            .passwords(ppkConfig.documentPassword)
            .build()
          context.startActivity(intent)
        }
      } else {
        if (isImageDocument) {
          val intent: Intent = PdfActivityIntentBuilder.fromImageUri(context, Uri.parse(documentPath))
            .activityClass(PpkActivity::class.java)
            .configuration(configuration)
            .build()
          context.startActivity(intent)
        } else {
          val intent: Intent = PdfActivityIntentBuilder.fromUri(context, Uri.parse(documentPath))
            .activityClass(PpkActivity::class.java)
            .configuration(configuration)
            .passwords(ppkConfig.documentPassword)
            .build()
          context.startActivity(intent)
        }
      }
    }
  }
}
