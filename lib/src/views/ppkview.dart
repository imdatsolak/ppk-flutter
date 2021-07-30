///
///  Copyright © 2018-2021 PSPDFKit GmbH. All rights reserved.
///
///  THIS SOURCE CODE AND ANY ACCOMPANYING DOCUMENTATION ARE PROTECTED BY INTERNATIONAL COPYRIGHT LAW
///  AND MAY NOT BE RESOLD OR REDISTRIBUTED. USAGE IS BOUND TO THE PSPDFKIT LICENSE AGREEMENT.
///  UNAUTHORIZED REPRODUCTION OR DISTRIBUTION IS SUBJECT TO CIVIL AND CRIMINAL PENALTIES.
///  This notice may not be removed from this file.
///

import 'dart:async';
import 'package:flutter/services.dart';

class PPKView {
  late MethodChannel _channel;

  PPKView.init(int id, String documentPath, dynamic configuration) {
    _channel = MethodChannel('de.solak.ppk-flutter.widget.$id');
    _channel.invokeMethod<dynamic>('initializePlatformView', <String, dynamic>{
      'document': documentPath,
      'configuration': configuration,
    });
  }

  Future<bool?> setFormFieldValue(String value, String fullyQualifiedName) async {
    return _channel.invokeMethod('setFormFieldValue', <String, dynamic>{
      'fullyQualifiedName': fullyQualifiedName,
      'value': value,
    });
  }

  Future<String?> getFormFieldValue(String fullyQualifiedName) async {
    return _channel.invokeMethod('getFormFieldValue', <String, dynamic>{'fullyQualifiedName': fullyQualifiedName});
  }

  Future<bool?> applyInstantJson(String annotationsJson) async {
    return _channel.invokeMethod('applyInstantJson', <String, String>{'annotationsJson': annotationsJson});
  }

  Future<String?> exportInstantJson() async {
    return _channel.invokeMethod('exportInstantJson');
  }

  Future<bool?> addAnnotation(dynamic jsonAnnotation) async {
    return _channel.invokeMethod('addAnnotation', <String, dynamic>{'jsonAnnotation': jsonAnnotation});
  }

  Future<bool?> removeAnnotation(dynamic jsonAnnotation) async {
    return _channel.invokeMethod('removeAnnotation', <String, dynamic>{'jsonAnnotation': jsonAnnotation});
  }

  Future<dynamic> getAnnotations(int pageIndex, String type) async {
    return _channel.invokeMethod<dynamic>('getAnnotations', <String, dynamic>{'pageIndex': pageIndex, 'type': type});
  }

  Future<dynamic> getAllUnsavedAnnotations() async {
    return _channel.invokeMethod<dynamic>('getAllUnsavedAnnotations');
  }

  Future<bool?> processAnnotations(String type, String processingMode, String destinationPath) async {
    return _channel.invokeMethod('processAnnotations', <String, String>{
      'type': type,
      'processingMode': processingMode,
      'destinationPath': destinationPath,
    });
  }

  Future<bool?> importXfdf(String xfdfPath) async {
    return _channel.invokeMethod('importXfdf', <String, String>{'xfdfPath': xfdfPath});
  }

  Future<bool?> exportXfdf(String xfdfPath) async {
    return _channel.invokeMethod('exportXfdf', <String, String>{'xfdfPath': xfdfPath});
  }

  Future<bool?> save() async {
    return _channel.invokeMethod('save');
  }
}
