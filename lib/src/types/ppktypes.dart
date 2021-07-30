/* *****************************************************************************************************
   PPK Flutter - A plugin to provide expanded Interface to PSPDFKit

   Copyright (c) 2021 Imdat Solak (imdat@solak.de)

   For license, checkout LICENSE.txt in the root of this repository
*/

import "package:json_annotation/json_annotation.dart";

part "ppktypes.g.dart";

@JsonSerializable()
class PPKEdgeInsets {
  double top = 0.0;
  double bottom = 0.0;
  double left = 0.0;
  double right = 0.0;

  factory PPKEdgeInsets.fromJson(Map<String, dynamic> json) => _$PPKEdgeInsetsFromJson(json);
  Map<String, dynamic> toJson() => _$PPKEdgeInsetsToJson(this);
  PPKEdgeInsets({
    this.top = 0.0,
    this.bottom = 0.0,
    this.left = 0.0,
    this.right = 0.0,
  });
}

@JsonSerializable()
class PPKSize {
  double width = 0.0;
  double height = 0.0;

  factory PPKSize.fromJson(Map<String, dynamic> json) => _$PPKSizeFromJson(json);
  Map<String, dynamic> toJson() => _$PPKSizeToJson(this);

  PPKSize({
    this.width = 0.0,
    this.height = 0.0,
  });
}
