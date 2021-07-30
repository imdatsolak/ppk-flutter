///
///  Copyright © 2018-2021 PSPDFKit GmbH. All rights reserved.
///
///  THIS SOURCE CODE AND ANY ACCOMPANYING DOCUMENTATION ARE PROTECTED BY INTERNATIONAL COPYRIGHT LAW
///  AND MAY NOT BE RESOLD OR REDISTRIBUTED. USAGE IS BOUND TO THE PSPDFKIT LICENSE AGREEMENT.
///  UNAUTHORIZED REPRODUCTION OR DISTRIBUTION IS SUBJECT TO CIVIL AND CRIMINAL PENALTIES.
///  This notice may not be removed from this file.
///

import 'dart:async';
import 'dart:ui';

import 'package:flutter/services.dart';

import 'package:ppk_flutter/src/utils/android_permission_status.dart';

class PPKGlobalView {
  static MethodChannel? _privateChannel;

  static MethodChannel get _channel {
    if (_privateChannel == null) {
      _privateChannel = const MethodChannel('de.solak.ppk-flutter.global');
      _privateChannel!.setMethodCallHandler(_platformCallHandler);
    }
    return _privateChannel!;
  }

  static Future<String?> get frameworkVersion async => _channel.invokeMethod('frameworkVersion');
  static Future<void> setLicenseKey(String licenseKey) async =>
      await _channel.invokeMethod('setLicenseKey', <String, String>{'licenseKey': licenseKey});

  static Future<bool?> present(String document, [dynamic configuration]) async =>
      await _channel.invokeMethod('present', <String, dynamic>{'document': document, 'configuration': configuration});

  static Future<bool?> presentWithWatermark(String document, String watermarkString, [dynamic configuration]) async =>
      await _channel.invokeMethod('presentWithWatermark',
          <String, dynamic>{'document': document, 'watermarkString': watermarkString, 'configuration': configuration});

  static Future<bool?> setFormFieldValue(String value, String fullyQualifiedName) async =>
      _channel.invokeMethod('setFormFieldValue', <String, dynamic>{'value': value, 'fullyQualifiedName': fullyQualifiedName});

  static Future<String?> getFormFieldValue(String fullyQualifiedName) async =>
      _channel.invokeMethod('getFormFieldValue', <String, dynamic>{'fullyQualifiedName': fullyQualifiedName});
  static Future<bool?> applyInstantJson(String annotationsJson) async =>
      _channel.invokeMethod('applyInstantJson', <String, String>{'annotationsJson': annotationsJson});
  static Future<String?> exportInstantJson() async => _channel.invokeMethod('exportInstantJson');
  static Future<bool?> addAnnotation(dynamic jsonAnnotation) async =>
      _channel.invokeMethod('addAnnotation', <String, dynamic>{'jsonAnnotation': jsonAnnotation});
  static Future<bool?> removeAnnotation(dynamic jsonAnnotation) async =>
      _channel.invokeMethod('removeAnnotation', <String, dynamic>{'jsonAnnotation': jsonAnnotation});
  static Future<dynamic> getAnnotations(int pageIndex, String type) async =>
      _channel.invokeMethod<dynamic>('getAnnotations', <String, dynamic>{'pageIndex': pageIndex, 'type': type});
  static Future<dynamic> getAllUnsavedAnnotations() async => _channel.invokeMethod<dynamic>('getAllUnsavedAnnotations');

  static Future<bool?> processAnnotations(String type, String processingMode, String destinationPath) async =>
      _channel.invokeMethod('processAnnotations',
          <String, String>{'type': type, 'processingMode': processingMode, 'destinationPath': destinationPath});

  static Future<bool?> importXfdf(String xfdfPath) async =>
      _channel.invokeMethod('importXfdf', <String, String>{'xfdfPath': xfdfPath});
  static Future<bool?> exportXfdf(String xfdfPath) async =>
      _channel.invokeMethod('exportXfdf', <String, String>{'xfdfPath': xfdfPath});
  static Future<bool?> save() async => _channel.invokeMethod('save');
  static Future<bool?> checkAndroidWriteExternalStoragePermission() async =>
      _channel.invokeMethod('checkPermission', {'permission': 'WRITE_EXTERNAL_STORAGE'});

  static Future<AndroidPermissionStatus> requestAndroidWriteExternalStoragePermission() async {
    final dynamic status = await _channel.invokeMethod<dynamic>('requestPermission', {'permission': 'WRITE_EXTERNAL_STORAGE'});
    return status is int
        ? _intToAndroidPermissionStatus(status)
        : status is bool
            ? (status ? AndroidPermissionStatus.authorized : AndroidPermissionStatus.denied)
            : AndroidPermissionStatus.notDetermined;
  }

  static Future<void> openAndroidSettings() async => _channel.invokeMethod('openSettings');

  static AndroidPermissionStatus _intToAndroidPermissionStatus(int status) {
    switch (status) {
      case 0:
        return AndroidPermissionStatus.notDetermined;
      case 1:
        return AndroidPermissionStatus.denied;
      case 2:
        return AndroidPermissionStatus.authorized;
      case 3:
        return AndroidPermissionStatus.deniedNeverAsk;
      default:
        return AndroidPermissionStatus.notDetermined;
    }
  }

  static late VoidCallback flutterPdfActivityOnCreate;
  static late VoidCallback flutterPdfActivityOnStart;
  static late VoidCallback flutterPdfActivityOnPause;
  static late VoidCallback flutterPdfActivityOnResume;
  static late VoidCallback flutterPdfActivityOnStop;
  static late VoidCallback flutterPdfActivityOnRestart;
  static late VoidCallback flutterPdfActivityOnDestroy;
  static late VoidCallback pdfViewControllerWillDisplay;
  static late VoidCallback pdfViewControllerWillDismiss;
  static late VoidCallback pdfViewControllerDidDismiss;
  static late VoidCallback flutterPdfActivityOnDocumentLoaded;
  static late VoidCallback flutterPdfActivityOnDocumentLoadFailed;

  static Future<void> _platformCallHandler(MethodCall call) {
    try {
      switch (call.method) {
        case 'flutterPdfActivityCreated':
          flutterPdfActivityOnCreate();
          break;
        case 'flutterPdfActivityStarted':
          flutterPdfActivityOnStart();
          break;
        case 'flutterPdfActivityPause':
          flutterPdfActivityOnPause();
          break;
        case 'flutterPdfActivityResumed':
          flutterPdfActivityOnResume();
          break;
        case 'flutterPdfActivityStopped':
          flutterPdfActivityOnStop();
          break;
        case 'flutterPdfActivityRestarted':
          flutterPdfActivityOnRestart();
          break;
        case 'flutterPdfActivityDestroyed':
          flutterPdfActivityOnDestroy();
          break;
        case 'pdfViewControllerWillDismiss':
          pdfViewControllerWillDismiss();
          break;
        case 'pdfViewControllerDidDismiss':
          pdfViewControllerDidDismiss();
          break;
        case 'flutterPdfActivityDocumentLoaded':
          flutterPdfActivityOnDocumentLoaded();
          break;
        case 'flutterPdfActivityDocumentLoadFailed':
          flutterPdfActivityOnDocumentLoadFailed();
          break;
        default:
          print('Unknowm method ${call.method} ');
      }
    } catch (e) {
      print(e);
    }
    return Future.value();
  }
}
