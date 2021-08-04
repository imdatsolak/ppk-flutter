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

import android.os.Bundle

import com.pspdfkit.document.PdfDocument
import com.pspdfkit.ui.PdfActivity

import io.flutter.plugin.common.MethodChannel.Result

var currentActivity: GlobalActivity? = null

class GlobalActivity: PdfActivity() {

  override fun onCreate(bundle: Bundle?) {

  }

  override fun onStart() {}
  override fun onPause() {}
  override fun onResume() {}
  override fun onStop() {}
  override fun onRestart() {}
  override fun onDestroy() {}
  override fun onDocumentLoaded(pdfDocument: PdfDocument) {}
  override fun onDocumentLoadFailed(throwable: Throwable) {}

  private fun bindActivity() {}
  private fun releaseActivity() {}
}
