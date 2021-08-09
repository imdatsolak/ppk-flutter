// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ppkprintconfiguration.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PPKPrintConfiguration _$PPKPrintConfigurationFromJson(
    Map<String, dynamic> json) {
  return PPKPrintConfiguration(
    printMode: _$enumDecode(_$PPKPrintModeEnumMap, json['printMode']),
  );
}

Map<String, dynamic> _$PPKPrintConfigurationToJson(
        PPKPrintConfiguration instance) =>
    <String, dynamic>{
      'printMode': _$PPKPrintModeEnumMap[instance.printMode],
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

const _$PPKPrintModeEnumMap = {
  PPKPrintMode.interactive: 'interactive',
  PPKPrintMode.choosePrinterOnly: 'choosePrinterOnly',
  PPKPrintMode.direct: 'direct',
};
