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

import java.util.concurrent.atomic.AtomicReference

import io.flutter.plugin.common.MethodChannel.Result

var currentActivity: PpkActivity? = null
var loadedDocumentResult: AtomicReference<Result?> = AtomicReference()

class PpkActivity: PdfActivity() {

  companion object Static {
    fun setLoadedDocumentResult(result: Result) {
      loadedDocumentResult.set(result)
    }
  }

  override fun onCreate(bundle: Bundle?) {
    // dispatch
    super.onCreate(bundle)
    bindActivity()
  }

  override fun onStart() {
    // dispatch
    super.onStart()
  }

  override fun onPause() {
    // dispatch
    super.onPause()
  }
  override fun onResume() {
    // dispatch
    super.onResume()
  }
  override fun onStop() {
    // dispatch
    super.onStop()
  }

  override fun onRestart() {
    // dispatch
    super.onRestart()
  }

  override fun onDestroy() {
    // dispatch
    super.onDestroy()
    releaseActivity()
  }

  override fun onDocumentLoaded(document: PdfDocument) {
    super.onDocumentLoaded(document)
    val result: Result? = loadedDocumentResult.getAndSet(null)
    result?.success(true)

  }
  override fun onDocumentLoadFailed(throwable: Throwable) {
    super.onDocumentLoadFailed(throwable)
    val result: Result? = loadedDocumentResult.getAndSet(null)
    result?.success(false)
  }

  private fun bindActivity() {
    currentActivity = this
  }

  private fun releaseActivity() {
    val result: Result? = loadedDocumentResult.getAndSet(null)

    result?.success(false)
    currentActivity = null
  }
}
