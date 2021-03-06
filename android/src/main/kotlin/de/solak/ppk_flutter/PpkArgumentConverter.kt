/*
 * **********************************************************************
 * PPK Flutter - A plugin to provide expanded Interface to PSPDFKit
 *
 * Copyright (c) 2021 Imdat Solak (imdat@solak.de)
 *
 * For license, check out LICENSE.txt in the root of this repository
 * **********************************************************************
 */

package de.solak.ppk_flutter

object PpkArgumentConverter {
  fun documentPathFromArguments(arguments: Map<String, Any>): String? {
    return arguments["document"] as String?
  }

  fun isImageDocument(path: String): Boolean {
    return path.endsWith(".png") || path.endsWith(".jpeg") || path.endsWith((".jpg"))
  }

  fun licenseKeyFromArguments(arguments: Map<String, Any>): String? {
    return arguments["licenseKey"] as String?
  }

  fun watermarkFromArguments(arguments: Map<String, Any>): String? {
    return arguments["watermark"] as String?
  }
}
