/*
 * **********************************************************************
 * PPK Flutter - A plugin to provide expanded Interface to PSPDFKit
 *
 * Copyright (c) 2021 Imdat Solak (imdat@solak.de)
 *
 * For license, check out LICENSE.txt in the root of this repository
 * **********************************************************************
 */

import 'package:flutter/services.dart';

import "package:ppk_flutter/ppk_flutter.dart";

class PPKViewProxy {
  late MethodChannel _channel;

  PPKViewProxy.init(int id, String documentPath, PPKConfiguration configuration) {
    _channel = MethodChannel('de.solak.ppk-flutter.widget.$id');
    _channel.invokeMethod<dynamic>('initializePlatformView', <String, dynamic>{
      'document': documentPath,
      'configuration': configuration.methodChannelRepresentation(),
    });
  }
}
