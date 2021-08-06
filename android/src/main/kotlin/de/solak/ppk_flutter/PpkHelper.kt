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

import android.net.Uri

const val fileScheme = "file:///"

object PpkHelper {

  fun checkDocumentPathForFileScheme(documentPath: String): String {
    var path = documentPath
    if (Uri.parse(path).scheme == null) {
      if (path.startsWith("/")) {
        path = path.substring(1)
      }
      return fileScheme + path
    }
    return path
  }
}
