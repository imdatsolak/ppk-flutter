// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ppkdocumentsharingconfiguration.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PPKDocumentSharingConfiguration _$PPKDocumentSharingConfigurationFromJson(
    Map<String, dynamic> json) {
  return PPKDocumentSharingConfiguration(
    fileFormatOptions: _$enumDecode(
        _$PPKDocumentSharingFileFormatOptionEnumMap, json['fileFormatOptions']),
    pageSelectionOptions: _$enumDecode(
        _$PPKDocumentSharingPagesOptionEnumMap, json['pageSelectionOptions']),
    annotationOptions: _$enumDecode(
        _$PPKDocumentSharingAnnotationOptionEnumMap, json['annotationOptions']),
    destination: _$enumDecode(
        _$PPKDocumentSharingDestinationEnumMap, json['destination']),
    printConfiguration: printConfigurationFromjson(
        json['printConfiguration'] as Map<String, dynamic>?),
  );
}

Map<String, dynamic> _$PPKDocumentSharingConfigurationToJson(
        PPKDocumentSharingConfiguration instance) =>
    <String, dynamic>{
      'fileFormatOptions': _$PPKDocumentSharingFileFormatOptionEnumMap[
          instance.fileFormatOptions],
      'pageSelectionOptions':
          _$PPKDocumentSharingPagesOptionEnumMap[instance.pageSelectionOptions],
      'annotationOptions': _$PPKDocumentSharingAnnotationOptionEnumMap[
          instance.annotationOptions],
      'destination':
          _$PPKDocumentSharingDestinationEnumMap[instance.destination],
      'printConfiguration':
          printConfigurationToJson(instance.printConfiguration),
    };

K _$enumDecode<K, V>(
  Map<K, V> enumValues,
  Object? source, {
  K? unknownValue,
}) {
  if (source == null) {
    throw ArgumentError(
      'A value must be provided. Supported values: '
      '${enumValues.values.join(', ')}',
    );
  }

  return enumValues.entries.singleWhere(
    (e) => e.value == source,
    orElse: () {
      if (unknownValue == null) {
        throw ArgumentError(
          '`$source` is not one of the supported values: '
          '${enumValues.values.join(', ')}',
        );
      }
      return MapEntry(unknownValue, enumValues.values.first);
    },
  ).key;
}

const _$PPKDocumentSharingFileFormatOptionEnumMap = {
  PPKDocumentSharingFileFormatOption.pdf: 'pdf',
  PPKDocumentSharingFileFormatOption.original: 'original',
  PPKDocumentSharingFileFormatOption.image: 'image',
};

const _$PPKDocumentSharingPagesOptionEnumMap = {
  PPKDocumentSharingPagesOption.current: 'current',
  PPKDocumentSharingPagesOption.range: 'range',
  PPKDocumentSharingPagesOption.all: 'all',
  PPKDocumentSharingPagesOption.annotated: 'annotated',
};

const _$PPKDocumentSharingAnnotationOptionEnumMap = {
  PPKDocumentSharingAnnotationOption.embed: 'embed',
  PPKDocumentSharingAnnotationOption.flatten: 'flatten',
  PPKDocumentSharingAnnotationOption.flattenForPrint: 'flattenForPrint',
  PPKDocumentSharingAnnotationOption.summary: 'summary',
  PPKDocumentSharingAnnotationOption.remove: 'remove',
};

const _$PPKDocumentSharingDestinationEnumMap = {
  PPKDocumentSharingDestination.print: 'print',
  PPKDocumentSharingDestination.export: 'export',
  PPKDocumentSharingDestination.activity: 'activity',
  PPKDocumentSharingDestination.messages: 'messages',
  PPKDocumentSharingDestination.email: 'email',
  PPKDocumentSharingDestination.otherApplicaiton: 'otherApplicaiton',
};
