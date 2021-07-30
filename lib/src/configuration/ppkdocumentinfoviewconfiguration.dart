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

part "ppkdocumentinfoviewconfiguration.g.dart";

@JsonSerializable()
class PPKDocumentInfoViewConfiguration {
  bool outline = true;
  bool annotations = true;
  bool embeddedFiles = true;
  bool bookmarks = true;
  bool documentInfo = true;
  bool security = true;

  PPKDocumentInfoViewConfiguration({
    this.outline = true,
    this.annotations = true,
    this.embeddedFiles = true,
    this.bookmarks = true,
    this.documentInfo = true,
    this.security = true,
  });

  factory PPKDocumentInfoViewConfiguration.fromJson(Map<String, dynamic> json) => _$PPKDocumentInfoViewConfigurationFromJson(json);
  Map<String, dynamic> toJson() => _$PPKDocumentInfoViewConfigurationToJson(this);
}
