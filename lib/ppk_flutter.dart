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
export "src/types/ppktypes.dart";
export "src/utils/android_permission_status.dart";
export "src/utils/configuration_options.dart";
export "src/views/ppkglobalview.dart";
export "src/views/ppkview.dart";
export "src/widgets/ppkwidget.dart";

class PpkFlutter {
  static const MethodChannel _channel = MethodChannel("ppk_flutter");

  static Future<String?> get platformVersion async {
    final String? version = await _channel.invokeMethod("getPlatformVersion");
    return version;
  }
}
