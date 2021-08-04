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

import io.flutter.plugin.common.MethodChannel

object PpkFlutterNotifier {
  private var channel: MethodChannel? = null

  fun setChannel(channel: MethodChannel?) {
    this.channel = channel
  }

  fun notifyPpkActivityCreated() {
    sendFlutterMessage("ppkActivityCreated");
  }

  fun notifyPpkAcitivityStarted() {
    sendFlutterMessage("ppkActivityStarted")
  }

  fun notifyPpkActivityPaused() {
    sendFlutterMessage("ppkActivityPaused")
  }

  fun notifyPpkAcitivityResumed() {
    sendFlutterMessage("ppkActivityResumed")
  }

  fun notifyPpkAcitivityStopped() {
    sendFlutterMessage("ppkActivityStopped")
  }

  fun notifyPpkAcitivityRestarted() {
    sendFlutterMessage("ppkActivityRestarted")
  }

  fun notifyPpkAcitivityDestroyed() {
    sendFlutterMessage("ppkActivityDestroyed")
  }

  fun notifyPpkAcitivityDocumentLoaded() {
    sendFlutterMessage("ppkActivityDocumentLoaded")
  }

  fun notifyPpkAcitivityDocumentLoadFailed() {
    sendFlutterMessage("ppkActivityDocumentLoadFailed")
  }

  private fun sendFlutterMessage(message: String) {
    channel?.invokeMethod(message, null, null)
  }
}
