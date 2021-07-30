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

part "ppkprintconfiguration.g.dart";

enum PPKPrintMode { interactive, choosePrinterOnly, direct }

@JsonSerializable()
class PPKPrintConfiguration {
  PPKPrintMode printMode = PPKPrintMode.interactive;
  // TODO: Unsupported feature
  // defaultPrinter

  PPKPrintConfiguration({
    this.printMode = PPKPrintMode.interactive,
  });
}
