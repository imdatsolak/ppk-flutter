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

import android.content.Context
import com.pspdfkit.configuration.activity.PdfActivityConfiguration

class PpkConfiguration(arguments: Map<String, Any>, context: Context) {
  private var configurationDictionary: Map<String, Any>
  private var configuration: PdfActivityConfiguration? = null
  // .Builder = PdfActivityConfiguration.Builder(context)

  init {
    if (arguments["configuration"] != null) {
      configurationDictionary = arguments["configuration"] as Map<String, Any>
      val builder = PdfActivityConfiguration.Builder(context)
      for (key in configurationDictionary.keys) {
        val value: Any? = configurationDictionary[key]
        if (value != null) {
          parse(key, value, builder)
        }
      }
    } else {
      configurationDictionary = []
      configuration = PdfActivityConfiguration.Builder(context).build()
    }
  }

  private fun parse(key: String, value: Any, builder: PdfActivityConfiguration.Builder) {
    when (key) {
      "appearanceMode" -> {
			}
      "password" -> {
			}
      "toolbarTitle" -> {
			}
      "pageIndex" -> {
			}
      "pageMode" -> {
			}
      "pageTransition" -> {
			}
      "firstPageAlwaysSignle" -> {
			}
      "spreadFitting" -> {
			}
      "clipToPageBoundaries" -> {
			}
      "additionalScrollViewFrameInsets" -> {
			}
      "additionalContentInsets" -> {
			}
      "shadowEnabled" -> {
			}
      "shadowOpacity" -> {
			}
      "backgroundColor" -> {
			}
      "allowedAppearanceModes" -> {
			}
      "scrollDirection" -> {
			}
      "scrollViewInsetAdjustment" -> {
			}
      "minimumZoomScale" -> {
			}
      "maximumZoomScale" -> {
			}
      "documentViewLayoutDirectionalLock" -> {
			}
      "renderAnimationEnabled" -> {
			}
      "renderStatusViewPosition" -> {
			}
      "doubleTapAction" -> {
			}
      "formElementZoomEnabled" -> {
			}
      "scrollOnEdgeTapEnabled" -> {
			}
      "animateScrollOnEdgeTaps" -> {
			}
      "scrollOnEdgeTapMargin" -> {
			}
      "linkAction" -> {
			}
      "allowedMenuActions" -> {
			}
      "textSelectionEnabled" -> {
			}
      "imageSelectionEnabled" -> {
			}
      "textSelectionMode" -> {
			}
      "textSelectionShouldSnapToWord" -> {
			}
      "editableAnnotationTypes" -> {
			}
      "typesShowingColorPresets" -> {
			}
      "freeTextAccessoryViewEnabled" -> {
			}
      "bookmarkSortOrder" -> {
			}
      "bookmarkIndicatorMode" -> {
			}
      "bookmarkIndicatorInteractionEnabled" -> {
			}
      "allowMultipleBookmarksPerPage" -> {
			}
      "userInterfaceViewMode" -> {
			}
      "userInterfaceViewAnimation" -> {
			}
      "halfModalStyle" -> {
			}
      "documentLabelEnabled" -> {
			}
      "shouldHideUserInterfaceOnPageChange" -> {
			}
      "shouldShowUserInterfaceOnViewWillAppear" -> {
			}
      "shouldAdjustDocumentInsetsByIncludingHomeIndicatorSafeAreaInsets" -> {
			}
      "allowToolbarTitleChange" -> {
			}
      "allowWindowTitleChange" -> {
			}
      "shouldHideNavigationBarWithUserInterface" -> {
			}
      "shouldHideStatusBar" -> {
			}
      "shouldHideStatusBarWithUserInterface" -> {
			}
      "shouldShowRedactionInfoButton" -> {
			}
      "redactionUsageHintEnabled" -> {
			}
      "showBackActionButton" -> {
			}
      "showForwardActionButton" -> {
			}
      "showBackForwardActionButtonLabels" -> {
			}
      "thumbnailBarMode" -> {
			}
      "scrubberBarType" -> {
			}
      "hideThumbnailBarForSinglePageDocuments" -> {
			}
      "thumbnailGrouping" -> {
			}
      "thumbnailSize" -> {
			}
      "thumbnailInteritemSpacing" -> {
			}
      "thumbnailLineSpacing" -> {
			}
      "thumbnailMargin" -> {
			}
      "annotationAnimationDuration" -> {
			}
      "annotationGroupingEnabled" -> {
			}
      "markupAnnotationMergeBehavior" -> {
			}
      "createAnnotationMenuEnabled" -> {
			}
      "naturalDrawingAnnotationEnabled" -> {
			}
      "magicInkReplacementThreshold" -> {
			}
      "drawCreateMode" -> {
			}
      "shouldAskForAnnotationUsername" -> {
			}
      "annotationEntersEditModeAfterSecondTapEnabled" -> {
			}
      "shouldScrollToChangedPage" -> {
			}
      "soundAnnotationPlayerStyle" -> {
			}
      "autosaveEnabled" -> {
			}
      "allowBackgroundSaving" -> {
			}
      "soundAnnotationTimeLimit" -> {
			}
      "searchMode" -> {
			}
      "searchResultZoomScale" -> {
			}
      "signatureSavingStrategy" -> {
			}
      "signatureCertificateSelectionMode" -> {
			}
      "signatureBiometricPropertiesOptions" -> {
			}
      "naturalSignatureDrawingEnabled" -> {
			}
      "sharingConfigurations" -> {
			}
      "selectedSharingDestination" -> {
			}
      "settingsOptions" -> {
			}
      "documentInfoOptions" -> {

      }
      else -> {
			}
    }
  }
}
