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
  VoidCallback? pdfActivityOnCreate;
  VoidCallback? pdfActivityOnStart;
  VoidCallback? pdfActivityOnPause;
  VoidCallback? pdfActivityOnResume;
  VoidCallback? pdfActivityOnStop;
  VoidCallback? pdfActivityOnRestart;
  VoidCallback? pdfActivityOnDestroy;
  VoidCallback? pdfViewControllerWillDisplay;
  VoidCallback? pdfViewControllerWillDismiss;
  VoidCallback? pdfViewControllerDidDismiss;
  VoidCallback? pdfActivityOnDocumentLoaded;
  VoidCallback? pdfActivityOnDocumentLoadFailed;

  late MethodChannel _channel;

  PPKProxy instance = PPKProxy._privateConstructor();

  PPKProxy._privateConstructor() {
    _channel = const MethodChannel("de.solak.ppk-flutter.global");
    _channel.setMethodCallHandler(_platformCallHandler);
  }

  Future<String?> get pspdfkitVersion async => _channel.invokeMethod("pspdfkitVersion");

  Future<void> setLicenseKey(String licenseKey) async {
    return  await _channel.invokeMethod(
      "setLicenseKey",
      <String, String>{
        "licenseKey": licenseKey,
      },
    );
  }

  Future<bool?> presentGlobal(String document, PPKConfiguration configuration) async {
    return await _channel.invokeMethod(
        "presentGlobal",
        <String, dynamic>{
          "document": document,
          "configuration": configuration.methodChannelRepresentation(),
        },
      );
  }

  Future<bool?> presentGlobalWithWatermark(String document, String watermarkString, PPKConfiguration configuration) async {
    return await _channel.invokeMethod(
        "presentGlobalWithWatermark",
        <String, dynamic>{
          "document": document,
          "watermarkString": watermarkString,
          "configuration": configuration.methodChannelRepresentation(),
        },
      );
  }

  Future<void> _platformCallHandler(MethodCall call) {
    VoidCallback? _callToMake;
    switch (call.method) {
      // Android related Callbacks
      case "pdfActivityCreated":
        _callToMake = pdfActivityOnCreate;
        break;
      case "pdfActivityStarted":
        _callToMake = pdfActivityOnStart;
        break;
      case "pdfActivityPause":
        _callToMake = pdfActivityOnPause;
        break;
      case "pdfActivityResumed":
        _callToMake = pdfActivityOnResume;
        break;
      case "pdfActivityStopped":
        _callToMake = pdfActivityOnStop;
        break;
      case "pdfActivityRestarted":
        _callToMake = pdfActivityOnRestart;
        break;
      case "pdfActivityDestroyed":
        _callToMake = pdfActivityOnDestroy;
        break;
      // iOS Related Callbacks
      case "pdfViewControllerWillDismiss":
        _callToMake = pdfViewControllerWillDismiss;
        break;
      case "pdfViewControllerDidDismiss":
        _callToMake = pdfViewControllerDidDismiss;
        break;
      // Document related Callbacks
      case "pdfActivityDocumentLoaded":
        _callToMake = pdfActivityOnDocumentLoaded;
        break;
      case "pdfActivityDocumentLoadFailed":
        _callToMake = pdfActivityOnDocumentLoadFailed;
        break;
      default:
        print("Unknowm method ${call.method} ");
    }
    if (_callToMake != null) {
      try {
        _callToMake();
      } catch (e) {
      }
    }
    return Future.value();
  }
}
