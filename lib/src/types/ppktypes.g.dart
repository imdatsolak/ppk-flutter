// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ppktypes.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PPKEdgeInsets _$PPKEdgeInsetsFromJson(Map<String, dynamic> json) {
  return PPKEdgeInsets(
    top: (json['top'] as num).toDouble(),
    bottom: (json['bottom'] as num).toDouble(),
    left: (json['left'] as num).toDouble(),
    right: (json['right'] as num).toDouble(),
  );
}

Map<String, dynamic> _$PPKEdgeInsetsToJson(PPKEdgeInsets instance) => <String, dynamic>{
      'top': instance.top,
      'bottom': instance.bottom,
      'left': instance.left,
      'right': instance.right,
    };

PPKSize _$PPKSizeFromJson(Map<String, dynamic> json) {
  return PPKSize(
    width: (json['width'] as num).toDouble(),
    height: (json['height'] as num).toDouble(),
  );
}

Map<String, dynamic> _$PPKSizeToJson(PPKSize instance) => <String, dynamic>{
      'width': instance.width,
      'height': instance.height,
    };
