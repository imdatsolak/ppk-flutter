/*
 * **********************************************************************
 * PPK Flutter - A plugin to provide expanded Interface to PSPDFKit
 *
 * Copyright (c) 2021 Imdat Solak (imdat@solak.de)
 *
 * For license, check out LICENSE.txt in the root of this repository
 * **********************************************************************
 */

import "package:flutter/material.dart";

Map<String, dynamic>? colorToJson(Color? color) {
  if (color != null) {
    return {
      "red": color.red.toDouble() / 256.0,
      "green": color.green.toDouble() / 256.0,
      "blue": color.blue.toDouble() / 256.0,
      "alpha": color.alpha.toDouble() / 256.0,
    };
  } else {
    return null;
  }
}

Color? colorFromJson(Map<String, dynamic>? json) {
  if (json != null) {
    try {
      return Color.fromARGB(
        json["alpha"],
        json["red"],
        json["green"],
        json["blue"],
      );
    } catch (e) {}
  }
  return null;
}
