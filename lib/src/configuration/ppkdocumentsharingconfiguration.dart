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

part "ppkdocumentsharingconfiguration.g.dart";

enum PPKDocumentSharingFileFormatOption { pdf, original, image }
enum PPKDocumentSharingPagesOption { current, range, all, annotated }
enum PPKDocumentSharingAnnotationOption { embed, flatten, flattenForPrint, summary, remove }
enum PPKDocumentSharingDestination { print, export, activity, messages, email, otherApplicaiton }

PPKDocumentSharingConfiguration? documentSharingConfigurationFromJson(Map<String, dynamic>? json) {
  if (json != null) {
    return PPKDocumentSharingConfiguration.fromJson(json);
  }
  return null;
}

Map<String, dynamic>? documentSharingConfigurationToJson(PPKDocumentSharingConfiguration? configuration) {
  if (configuration != null) {
    return configuration.toJson();
  }
  return null;
}

@JsonSerializable()
class PPKDocumentSharingConfiguration extends PPKMethodChannelObject {
  factory PPKDocumentSharingConfiguration.defaultConfigurationFoDestination(PPKDocumentSharingDestination dest) {
    return PPKDocumentSharingConfiguration();
  }

  PPKDocumentSharingFileFormatOption fileFormatOptions = PPKDocumentSharingFileFormatOption.pdf;
  PPKDocumentSharingPagesOption pageSelectionOptions = PPKDocumentSharingPagesOption.all;
  PPKDocumentSharingAnnotationOption annotationOptions = PPKDocumentSharingAnnotationOption.embed;
  PPKDocumentSharingDestination destination = PPKDocumentSharingDestination.print;

  @JsonKey(fromJson: printConfigurationFromjson, toJson: printConfigurationToJson)
  PPKPrintConfiguration? printConfiguration;
  // TODO: Unsupported features
  // applicationActivities
  // excludedActivityTypes
  // pageDescriptionProvider
  // selectedPagesDescriptionProvider
  // SelectedPages
  // selectedPagesDescriptionProvider

  PPKDocumentSharingConfiguration({
    this.fileFormatOptions = PPKDocumentSharingFileFormatOption.pdf,
    this.pageSelectionOptions = PPKDocumentSharingPagesOption.all,
    this.annotationOptions = PPKDocumentSharingAnnotationOption.embed,
    this.destination = PPKDocumentSharingDestination.print,
    this.printConfiguration,
  });

  factory PPKDocumentSharingConfiguration.fromJson(Map<String, dynamic> json) => _$PPKDocumentSharingConfigurationFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$PPKDocumentSharingConfigurationToJson(this);
}
