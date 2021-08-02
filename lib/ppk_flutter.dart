/*
 * **********************************************************************
 * PPK Flutter - A plugin to provide expanded Interface to PSPDFKit
 *
 * Copyright (c) 2021 Imdat Solak (imdat@solak.de)
 *
 * For license, check out LICENSE.txt in the root of this repository
 * **********************************************************************
 */

library ppk_flutter;

import "dart:async";

import "package:flutter/services.dart";

export "src/configuration/ppkconfiguration.dart";
export "src/configuration/ppkdocumentsharingconfiguration.dart";
export "src/configuration/ppkprintconfiguration.dart";
export "src/configuration/ppkdocumentinfoviewconfiguration.dart";
export "src/types/ppktypes.dart";
export "src/types/ppkmethodchannelobject.dart";
export "src/utils/auxfunctions.dart";
export "src/proxy/ppkproxy.dart";
export "src/proxy/ppkviewproxy.dart";
export "src/widgets/ppkwidget.dart";

class PpkFlutter {
  static const MethodChannel _channel = MethodChannel("ppk_flutter");

  static Future<String?> get platformVersion async {
    final String? version = await _channel.invokeMethod("getPlatformVersion");
    return version;
  }
}
