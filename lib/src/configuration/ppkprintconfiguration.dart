/*
 * **********************************************************************
 * PPK Flutter - A plugin to provide expanded Interface to PSPDFKit
 *
 * Copyright (c) 2021 Imdat Solak (imdat@solak.de)
 *
 * For license, check out LICENSE.txt in the root of this repository
 * **********************************************************************
 */

import "package:json_annotation/json_annotation.dart";
import "package:ppk_flutter/ppk_flutter.dart";

part "ppkprintconfiguration.g.dart";

enum PPKPrintMode { interactive, choosePrinterOnly, direct }

PPKPrintConfiguration? printConfigurationFromjson(Map<String, dynamic>? json) {
  if (json != null) {
    return PPKPrintConfiguration.fromJson(json);
  }
  return null;
}

Map<String, dynamic>? printConfigurationToJson(PPKPrintConfiguration? that) {
  if (that != null) {
    return that.toJson();
  }
  return null;
}

@JsonSerializable()
class PPKPrintConfiguration extends PPKMethodChannelObject {
  PPKPrintMode printMode = PPKPrintMode.interactive;
  // TODO: Unsupported feature
  // defaultPrinter

  PPKPrintConfiguration({
    this.printMode = PPKPrintMode.interactive,
  });

  factory PPKPrintConfiguration.fromJson(Map<String, dynamic> json) => _$PPKPrintConfigurationFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$PPKPrintConfigurationToJson(this);
}
