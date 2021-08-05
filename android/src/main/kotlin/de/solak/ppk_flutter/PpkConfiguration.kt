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
import android.graphics.Color
import com.pspdfkit.annotations.AnnotationType
import com.pspdfkit.configuration.activity.PdfActivityConfiguration
import com.pspdfkit.configuration.activity.PdfActivityConfiguration.SEARCH_MODULAR
import com.pspdfkit.configuration.page.PageLayoutMode
import com.pspdfkit.configuration.page.PageScrollMode
import com.pspdfkit.configuration.page.PageFitMode
import com.pspdfkit.configuration.theming.ThemeMode
import com.pspdfkit.configuration.page.PageScrollDirection
import com.pspdfkit.configuration.activity.ThumbnailBarMode
import com.pspdfkit.configuration.activity.UserInterfaceViewMode
import com.pspdfkit.ui.PdfFragment

import com.pspdfkit.configuration.settings.SettingsMenuItemType
import com.pspdfkit.configuration.sharing.ShareFeatures
import com.pspdfkit.configuration.activity.PdfActivityConfiguration.SearchType
import com.pspdfkit.document.editor.PdfDocumentEditorFactory

val pageModeMap: Map<String, PageLayoutMode> = mapOf(
  "automatic" to PageLayoutMode.AUTO,
  "single" to PageLayoutMode.SINGLE,
  "double" to PageLayoutMode.DOUBLE,
)

val pageTransitionMap: Map<String, PageScrollMode> = mapOf(
  "scrollContinuous" to PageScrollMode.CONTINUOUS,
  "scrollPerSpread" to PageScrollMode.PER_PAGE,
  "curl" to PageScrollMode.PER_PAGE,
)

val spreadFittingMap: Map<String, PageFitMode> = mapOf(
  "fit" to PageFitMode.FIT_TO_SCREEN,
  "fill" to PageFitMode.FIT_TO_WIDTH,
  "adaptive" to PageFitMode.FIT_TO_WIDTH,
)

val allowedAppearanceModesMap: Map<String, ThemeMode> = mapOf(
//        "deflt" to PDFAppearanceMode.night,
//        "sepia" to PDFAppearanceMode.night,
//        "night" to PDFAppearanceMode.night,
//        "all" to PDFAppearanceMode.all,
  "deflt" to ThemeMode.DEFAULT,
  "sepia" to ThemeMode.DEFAULT,
  "night" to ThemeMode.NIGHT,
  "all" to ThemeMode.DEFAULT,
)

val scrollDirectionMap: Map<String, PageScrollDirection> = mapOf(
  "horizontal" to PageScrollDirection.HORIZONTAL,
  "vertical" to PageScrollDirection.VERTICAL,
)

val scrollViewInsetAdjustmentMap: Map<String, String> = mapOf(
  "none" to "ScrollInsetAdjustment.none",
  "fixedElements" to "ScrollInsetAdjustment.fixedElements",
  "allElements" to "ScrollInsetAdjustment.allElements",
)

val documentViewLayoutDirectionalLockMap: Map<String, Boolean> = mapOf(
  "yes" to true,
  "no" to false,
  "adaptive" to true
)

val renderStatusViewPositionMap: Map<String, String> = mapOf(
  "top" to "RenderStatusViewPosition.top",
  "centered" to "RenderStatusViewPosition.centered",
)

val doubleTapActionMap: Map<String, String> = mapOf(
  "none" to "TapAction.none",
  "zoom" to "TapAction.zoom",
  "smartZoom" to "TapAction.smartZoom",
)

val linkActionMap: Map<String, String> = mapOf(
  "none" to "LinkAction.none",
  "alertView" to "LinkAction.alertView",
  "externalBrowser" to "LinkAction.openSafari",
  "inlineBrowser" to "LinkAction.inlineBrowser",
  "inlineWebViewController" to "LinkAction.inlineWebViewController",
)

val textSelectionModeMap: Map<String, String> = mapOf(
  "regular" to "TextSelectionMode.regular",
  "simple" to "TextSelectionMode.simple",
  "automatic" to "TextSelectionMode.automatic",
)

val bookmarkSortOrderMap: Map<String, String> = mapOf(
  "custom" to "BookmarkManager.SortOrder.custom",
  "pageBased" to "BookmarkManager.SortOrder.pageBased",
)

val annotationTypesMap: Map<String, AnnotationType> = mapOf(
  // "all" to AnnotationType.,
  "caret" to AnnotationType.CARET,
  "circle" to AnnotationType.CIRCLE,
  "file" to AnnotationType.FILE,
  "freeText" to AnnotationType.FREETEXT,
  "highlight" to AnnotationType.HIGHLIGHT,
  "ink" to AnnotationType.INK,
  "line" to AnnotationType.LINE,
  "link" to AnnotationType.LINK,
  "note" to AnnotationType.NOTE,
  "polyLine" to AnnotationType.POLYLINE,
  "polygon" to AnnotationType.POLYGON,
  "popup" to AnnotationType.POPUP,
  "redaction" to AnnotationType.REDACT,
  "richMedia" to AnnotationType.RICHMEDIA,
  "screen" to AnnotationType.SCREEN,
  "sound" to AnnotationType.SOUND,
  "square" to AnnotationType.SQUARE,
  "squiggly" to AnnotationType.SQUIGGLY,
  "stamp" to AnnotationType.STAMP,
  "strikeOut" to AnnotationType.STRIKEOUT,
  "threeD" to AnnotationType.TYPE3D,
  "trapNet" to AnnotationType.TRAPNET,
  "underline" to AnnotationType.UNDERLINE,
  "watermark" to AnnotationType.WATERMARK,
  "widget" to AnnotationType.WIDGET
)

val annotationToolsMap: Map<String, AnnotationType> = annotationTypesMap

val textSelectionMenuActionsMap: Map<String, String> = mapOf(
  "none" to "Map<>",
  "search" to "TextSelectionMenuAction.search",
  "define" to "TextSelectionMenuAction.define",
  "wikipedia" to "TextSelectionMenuAction.wikipedia",
  "speak" to "TextSelectionMenuAction.speak",
  "share" to "TextSelectionMenuAction.share",
  "copy" to "TextSelectionMenuAction.copy",
  "markup" to "TextSelectionMenuAction.markup",
  "redact" to "TextSelectionMenuAction.redact",
  "createLink" to "TextSelectionMenuAction.createLink",
  "annotationCreation" to "TextSelectionMenuAction.annotationCreation",
  "all" to "TextSelectionMenuAction.all",
)

val bookmarkIndicatorModeMap: Map<String, Boolean> = mapOf(
  "off" to false,
  "alwaysOn" to true,
  "onWhenBookmarked" to true,
)

val userInterfaceViewModeMap: Map<String, UserInterfaceViewMode> = mapOf(
  "always" to UserInterfaceViewMode.USER_INTERFACE_VIEW_MODE_VISIBLE,
  "automatic" to UserInterfaceViewMode.USER_INTERFACE_VIEW_MODE_AUTOMATIC,
  "automaticNoFirstLastPage" to UserInterfaceViewMode.USER_INTERFACE_VIEW_MODE_AUTOMATIC_BORDER_PAGES,
  "never" to UserInterfaceViewMode.USER_INTERFACE_VIEW_MODE_HIDDEN,
)

val userInterfaceViewAnimationMap: Map<String, String> = mapOf(
  "none" to "UserInterfaceViewAnimation.none",
  "fade" to "UserInterfaceViewAnimation.fade",
  "slide" to "UserInterfaceViewAnimation.slide",
)

val halfModalStyleMap: Map<String, String> = mapOf(
  "card" to "PresentationHalfModalStyle.card",
  "system" to "PresentationHalfModalStyle.system",
)

val documentLabelEnabledMap: Map<String, Boolean> = mapOf(
  "yes" to true,
  "no" to false,
  "adaptive" to true,
)

val thumbnailBarModeMap: Map<String, ThumbnailBarMode> = mapOf(
  "none" to ThumbnailBarMode.THUMBNAIL_BAR_MODE_NONE,
  "scrubberBar" to ThumbnailBarMode.THUMBNAIL_BAR_MODE_PINNED,
  "scrollable" to ThumbnailBarMode.THUMBNAIL_BAR_MODE_SCROLLABLE,
  "floatingScrubberBar" to ThumbnailBarMode.THUMBNAIL_BAR_MODE_FLOATING,
)

val scrubberBarTypeMap: Map<String, String> = mapOf(
  "horizontal" to "ScrubberBarType.horizontal",
  "verticalLeft" to "ScrubberBarType.verticalLeft",
  "verticalRight" to "ScrubberBarType.verticalRight",
)

val thumbnailGroupingMap: Map<String, String> = mapOf(
  "automatic" to "ThumbnailGrouping.automatic",
  "never" to "ThumbnailGrouping.never",
  "always" to "ThumbnailGrouping.always",
)

val markupAnnotationMergeBehaviorMap: Map<String, String> = mapOf(
  "never" to "MarkupAnnotationMergeBehavior.never",
  "ifColorMatches" to "MarkupAnnotationMergeBehavior.ifColorMatches",
)

val drawCreateModeMap: Map<String, String> = mapOf(
  "separate" to "DrawCreateMode.separate",
  "mergeIfPossible" to "DrawCreateMode.mergeIfPossible",
  "automatic" to "DrawCreateMode.automatic",
)

val soundAnnotationPlayerStyleMap: Map<String, String> = mapOf(
  "inline" to "SoundAnnotationPlayerStyle.inline",
  "bottom" to "SoundAnnotationPlayerStyle.bottom",
)

val searchModeMap: Map<String, Int> = mapOf(
  "modal" to SEARCH_MODULAR,
  "inline" to PdfActivityConfiguration.SEARCH_INLINE
)

val signatureSavingStrategyMap: Map<String, String> = mapOf(
  "alwaysSave" to "SignatureSavingStrategy.alwaysSave",
  "neverSave" to "SignatureSavingStrategy.neverSave",
  "saveIfSelected" to "SignatureSavingStrategy.saveIfSelected",
)

val signatureCertificateSelectionModeMap: Map<String, String> = mapOf(
  "always" to "SignatureCertificateSelectionMode.always",
  "never" to "SignatureCertificateSelectionMode.never",
  "ifAvailable" to "SignatureCertificateSelectionMode.ifAvailable",
)

class PpkConfiguration(arguments: Map<String, Any>, context: Context) {
  private var configurationDictionary: Map<String, Any>
  private var configuration: PdfActivityConfiguration? = null
  var documentPassword: String? = null
  var toolbarTitle: String? = null
  var pageIndex: Int = 0
  var editableAnnotationTypes: MutableList<AnnotationType> =  mutableListOf()
  // .Builder = PdfActivityConfiguration.Builder(context)

  init {
    editableAnnotationTypes.addAll(annotationTypesMap.values)
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

  private fun parseLayoutMode(value: Any, builder: PdfActivityConfiguration.Builder) {
    val m: String? = value as String?
    val v: PageLayoutMode?
    if (m != null) {
      v = pageModeMap[m]
      if (v != null) {
        builder.layoutMode(v)
      }
    }
  }

  private fun parsePageScrollMode(value: Any, builder: PdfActivityConfiguration.Builder) {
    val m: String? = value as String?
    val v: PageScrollMode?
    if (m != null) {
      v = pageTransitionMap[m]
      if (v != null) {
        builder.scrollMode(v)
      }
    }
  }

  private fun parsePageFitMode(value: Any, builder: PdfActivityConfiguration.Builder) {
    val m: String? = value as String?
    val v: PageFitMode?
    if (m != null) {
      v = spreadFittingMap[m]
      if (v != null) {
        builder.fitMode(v)
      }
    }
  }

  private fun parseScrollDirection(value: Any, builder: PdfActivityConfiguration.Builder) {
    val m: String? = value as String?
    val v: PageScrollDirection?
    if (m != null) {
      v = scrollDirectionMap[m]
      if (v != null) {
        builder.scrollDirection(v)
      }
    }
  }

  private fun parseEditableAnnotationTypes(value: Any, builder: PdfActivityConfiguration.Builder) {
    editableAnnotationTypes.clear()
    val m: Array<String>? = value as Array<String>?
    if (m != null) {
      var v: AnnotationType?
      for (k in m) {
        v = annotationTypesMap[k]
        if (v != null) {
          editableAnnotationTypes.add(v)
        }
      }
    }
    builder.editableAnnotationTypes(editableAnnotationTypes)
    if (editableAnnotationTypes.size == 0) {
      builder.disableAnnotationEditing()
    } else {
      builder.enableAnnotationEditing()
    }
  }

  private fun parseBookmarkIndicatorMode(value: Any, builder: PdfActivityConfiguration.Builder) {
    val m: String? = value as String?
    val v: Boolean?
    if (m != null) {
      v = bookmarkIndicatorModeMap[m]
      if (v != null) {
        if (v) {
          builder.enableBookmarkList()
        } else {
          builder.disableBookmarkList()
        }
      }
    }
  }

  private fun parseBookmarkIndicatorInteraction(value: Any, builder: PdfActivityConfiguration.Builder) {
    val v: Boolean = parseAsBoolean(value, true)
    if (v) {
      builder.enableBookmarkEditing()
    } else {
      builder.disableBookmarkEditing()
    }
  }

  private fun parseUserInterfaceViewMode(value: Any, builder: PdfActivityConfiguration.Builder) {
    val m: String? = value as String?
    if (m != null) {
      val v: UserInterfaceViewMode? = userInterfaceViewModeMap[m]
      if (v != null) {
        builder.setUserInterfaceViewMode(v)
      }
    }
  }

  private fun parseDocumentLabelOverlay(value: Any, builder: PdfActivityConfiguration.Builder) {
    val v: Boolean = parseAsBoolean(value, true)
    if (v) {
      builder.showDocumentTitleOverlay()
    } else {
      builder.hideDocumentTitleOverlay()
    }
  }

  private fun parse(key: String, value: Any, builder: PdfActivityConfiguration.Builder) {
    when (key) {
      "appearanceMode", "theme" -> parseThemeMode(value, builder)
      "documentPassword" -> documentPassword = parseAsString(value)
      "toolbarTitle" -> toolbarTitle = parseAsString(value)
      "pageIndex" -> pageIndex = parseAsInt(value, 0)
      "pageMode" -> parseLayoutMode(value, builder)
      "pageTransition" -> parsePageScrollMode(value, builder)
      "firstPageAlwaysSingle" -> builder.firstPageAlwaysSingle(parseAsBoolean(value, true))
      "spreadFitting" -> parsePageFitMode(value, builder)
      "clipToPageBoundaries" -> {			}
      "additionalScrollViewFrameInsets" -> {			}
      "additionalContentInsets" -> {			}
      "shadowEnabled" -> {			}
      "shadowOpacity" -> {			}
      "backgroundColor" -> builder.backgroundColor(parseAsColor(value, Color.WHITE))
      "allowedAppearanceModes" -> {			}
      "scrollDirection" -> parseScrollDirection(value, builder)
      "scrollViewInsetAdjustment" -> {			}
      "minimumZoomScale" -> {			}
      "maximumZoomScale" -> builder.maxZoomScale(parseAsFloat(value, PdfFragment.MAX_ZOOM))
      "documentViewLayoutDirectionalLock" -> {			}
      "renderAnimationEnabled" -> {			}
      "renderStatusViewPosition" -> {			}
      "doubleTapAction" -> {			}
      "formElementZoomEnabled" -> {			}
      "scrollOnEdgeTapEnabled" -> builder.scrollOnEdgeTapEnabled(parseAsBoolean(value, true))
      "animateScrollOnEdgeTaps" -> builder.animateScrollOnEdgeTaps(parseAsBoolean(value, false))
      "scrollOnEdgeTapMargin" -> builder.scrollOnEdgeTapMargin(parseAsInt(value, 24))
      "linkAction" -> {			}
      "allowedMenuActions" -> {			}
      "textSelectionEnabled" -> builder.textSelectionEnabled(parseAsBoolean(value,true))
      "imageSelectionEnabled" -> {			}
      "textSelectionMode" -> {			}
      "textSelectionShouldSnapToWord" -> {			}
      "editableAnnotationTypes" -> parseEditableAnnotationTypes(value, builder)
      "typesShowingColorPresets" -> {			}
      "freeTextAccessoryViewEnabled" -> {			}
      "bookmarkSortOrder" -> {	}
      "bookmarkIndicatorMode" -> parseBookmarkIndicatorMode(value, builder)
      "bookmarkIndicatorInteractionEnabled" -> parseBookmarkIndicatorInteraction(value, builder)
      "allowMultipleBookmarksPerPage" -> builder.allowMultipleBookmarksPerPage(parseAsBoolean(value, false))
      "userInterfaceViewMode" -> parseUserInterfaceViewMode(value, builder)
      "userInterfaceViewAnimation" ->  { }
      "halfModalStyle" ->  { }
      "documentLabelEnabled" -> parseDocumentLabelOverlay(value, builder)
      "shouldHideUserInterfaceOnPageChange" -> {	}
      "shouldShowUserInterfaceOnViewWillAppear" -> {	}
      "shouldAdjustDocumentInsetsByIncludingHomeIndicatorSafeAreaInsets" -> {	}
      "allowToolbarTitleChange" -> {	}
      "allowWindowTitleChange" -> { }
      "shouldHideNavigationBarWithUserInterface" -> {	}
      "shouldHideStatusBar" -> {	}
      "shouldHideStatusBarWithUserInterface" -> {	}
      "shouldShowRedactionInfoButton" -> {	}
      "redactionUsageHintEnabled" -> {	}
      "showBackActionButton" -> {	}
      "showForwardActionButton" -> {	}
      "showBackForwardActionButtonLabels" -> {	}
      "thumbnailBarMode" -> {			}
      "scrubberBarType" -> {			}
      "hideThumbnailBarForSinglePageDocuments" -> {			}
      "thumbnailGrouping" -> {			}
      "thumbnailSize" -> {			}
      "thumbnailInteritemSpacing" -> {			}
      "thumbnailLineSpacing" -> {			}
      "thumbnailMargin" -> {			}
      "annotationAnimationDuration" -> {			}
      "annotationGroupingEnabled" -> {			}
      "markupAnnotationMergeBehavior" -> {			}
      "createAnnotationMenuEnabled" -> {			}
      "naturalDrawingAnnotationEnabled" -> {			}
      "magicInkReplacementThreshold" -> {			}
      "drawCreateMode" -> {			}
      "shouldAskForAnnotationUsername" -> {			}
      "annotationEntersEditModeAfterSecondTapEnabled" -> {			}
      "shouldScrollToChangedPage" -> {			}
      "soundAnnotationPlayerStyle" -> {			}
      "autosaveEnabled" -> builder.autosaveEnabled(parseAsBoolean(value, true)),
      "allowBackgroundSaving" -> {			}
      "soundAnnotationTimeLimit" -> {			}
      "searchMode" -> {			}
      "searchResultZoomScale" -> {			}
      "signatureSavingStrategy" -> {			}
      "signatureCertificateSelectionMode" -> {			}
      "signatureBiometricPropertiesOptions" -> {			}
      "naturalSignatureDrawingEnabled" -> {			}
      "sharingConfigurations" -> {			}
      "selectedSharingDestination" -> {			}
      "settingsOptions" -> {			}
      "documentInfoOptions" -> {      }
      else -> {
			}
    }
  }

  private fun parseThemeMode(value: Any, builder: PdfActivityConfiguration.Builder) {
    val key: String?
    var v: ThemeMode? = null
    try {
      key = value as String?
      v = allowedAppearanceModesMap[key]
    } catch (e: Error) {

    }
    if (v != null) {
      builder.themeMode(v)
    }
  }


  private fun parseAsString(value: Any): String? {
    return value as String?
  }

  private fun parseAsInt(value: Any, default: Int): Int {
    val i: Int? = value as Int?
    if (i != null) {
      return i
    }
    return default
  }

  private fun parseAsFloat(value: Any, default: Float): Float {
    val f: Float? = value as Float?
    if (f != null) {
      return f
    }
    return default
  }

  private fun parseAsBoolean(value: Any, default: Boolean): Boolean {
      val b: Boolean? = value as Boolean?
      if (b != null) {
        return b
      }
      return default
    }

  private fun parseAsColor(value: Any, default: Int): Int {
    val v: Map<String, Int>? = value as Map<String, Int>?
    if (v != null) {
      val r: Int? = v["red"]
      val g: Int? = v["green"]
      val b: Int? = v["blue"]
      val a: Int? = v["alpha"]
      if (r != null && b != null && g != null && a != null) {
        return Color.argb(a, r, g, b)
      }
    }
    return default
  }
}
