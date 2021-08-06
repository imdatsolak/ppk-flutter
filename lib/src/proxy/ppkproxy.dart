/*
 * **********************************************************************
 * PPK Flutter - A plugin to provide expanded Interface to PSPDFKit
 *
 * Copyright (c) 2021 Imdat Solak (imdat@solak.de)
 *
 * For license, check out LICENSE.txt in the root of this repository
 * **********************************************************************
 * Some code is based on github.com/PSPDFKit/pspdfkit_flutter
 */

import "dart:async";
import "dart:ui";

import "package:flutter/services.dart";
import "package:ppk_flutter/ppk_flutter.dart";

class PPKProxy {
  VoidCallback? ppkActivityCreated;
  VoidCallback? ppkActivityStarted;
  VoidCallback? ppkActivityPaused;
  VoidCallback? ppkActivityResumed;
  VoidCallback? ppkActivityStopped;
  VoidCallback? ppkActivityRestarted;
  VoidCallback? ppkActivityDestroyed;
  VoidCallback? ppkViewControllerWillDisplay;
  VoidCallback? ppkViewControllerWillDismiss;
  VoidCallback? ppkViewControllerDidDismiss;
  VoidCallback? ppkActivityDocumentLoaded;
  VoidCallback? ppkActivityDocumentLoadFailed;

  late MethodChannel _channel;

  static PPKProxy instance = PPKProxy._privateConstructor();

  PPKProxy._privateConstructor() {
    _channel = const MethodChannel("de.solak.ppk-flutter.global");
    _channel.setMethodCallHandler(_platformCallHandler);
  }

  Future<String?> get pspdfkitVersion async => _channel.invokeMethod("pspdfkitVersion");

  Future<void> setLicenseKey(String licenseKey) async {
    return await _channel.invokeMethod(
      "setLicenseKey",
      <String, String>{
        "licenseKey": licenseKey,
      },
    );
  }

  Future<bool?> present(String document, {PPKConfiguration? configuration}) async {
    if (configuration == null) {
      configuration = PPKConfiguration();
    }
    return await _channel.invokeMethod(
      "present",
      <String, dynamic>{
        "document": document,
        "configuration": configuration.methodChannelRepresentation(),
      },
    );
  }

  Future<bool?> presentWithWatermark(String document, String watermarkString, {PPKConfiguration? configuration}) async {
    if (configuration == null) {
      configuration = PPKConfiguration();
    }
    return await _channel.invokeMethod(
      "presentWithWatermark",
      <String, dynamic>{
        "document": document,
        "watermark": watermarkString,
        "configuration": configuration.methodChannelRepresentation(),
      },
    );
  }

  Future<void> _platformCallHandler(MethodCall call) {
    VoidCallback? _callToMake;
    switch (call.method) {
      // Android related Callbacks
      case "ppkActivityCreated":
        _callToMake = ppkActivityCreated;
        break;
      case "ppkActivityStarted":
        _callToMake = ppkActivityStarted;
        break;
      case "ppkActivityPaused":
        _callToMake = ppkActivityPaused;
        break;
      case "ppkActivityResumed":
        _callToMake = ppkActivityResumed;
        break;
      case "ppkActivityStopped":
        _callToMake = ppkActivityStopped;
        break;
      case "ppkActivityRestarted":
        _callToMake = ppkActivityRestarted;
        break;
      case "ppkActivityDestroyed":
        _callToMake = ppkActivityDestroyed;
        break;
      // iOS Related Callbacks
      case "pdfViewControllerWillDismiss":
        _callToMake = ppkViewControllerWillDismiss;
        break;
      case "pdfViewControllerDidDismiss":
        _callToMake = ppkViewControllerDidDismiss;
        break;
      // Document related Callbacks
      case "ppkActivityDocumentLoaded":
        _callToMake = ppkActivityDocumentLoaded;
        break;
      case "ppkActivityDocumentLoadFailed":
        _callToMake = ppkActivityDocumentLoadFailed;
        break;
      default:
        print("Unknowm method ${call.method} ");
    }
    if (_callToMake != null) {
      try {
        _callToMake();
      } catch (e) {}
    }
    return Future.value();
  }
}
