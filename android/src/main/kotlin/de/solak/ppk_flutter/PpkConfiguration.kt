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
import java.util.*
import kotlin.collections.ArrayList

val pageModeMap: Map<String, PageLayoutMode> = mapOf(
  "automatic" to PageLayoutMode.AUTO,
  "single" to PageLayoutMode.SINGLE,
  "double" to PageLayoutMode.DOUBLE
)

val pageTransitionMap: Map<String, PageScrollMode> = mapOf(
  "scrollContinuous" to PageScrollMode.CONTINUOUS,
  "scrollPerSpread" to PageScrollMode.PER_PAGE,
  "curl" to PageScrollMode.PER_PAGE
)

val spreadFittingMap: Map<String, PageFitMode> = mapOf(
  "fit" to PageFitMode.FIT_TO_SCREEN,
  "fill" to PageFitMode.FIT_TO_WIDTH,
  "adaptive" to PageFitMode.FIT_TO_WIDTH
)

val allowedAppearanceModesMap: Map<String, ThemeMode> = mapOf(
//        "deflt" to PDFAppearanceMode.night,
//        "sepia" to PDFAppearanceMode.night,
//        "night" to PDFAppearanceMode.night,
//        "all" to PDFAppearanceMode.all,
  "deflt" to ThemeMode.DEFAULT,
  "sepia" to ThemeMode.DEFAULT,
  "night" to ThemeMode.NIGHT,
  "all" to ThemeMode.DEFAULT
)

val scrollDirectionMap: Map<String, PageScrollDirection> = mapOf(
  "horizontal" to PageScrollDirection.HORIZONTAL,
  "vertical" to PageScrollDirection.VERTICAL
)

val scrollViewInsetAdjustmentMap: Map<String, String> = mapOf(
  "none" to "ScrollInsetAdjustment.none",
  "fixedElements" to "ScrollInsetAdjustment.fixedElements",
  "allElements" to "ScrollInsetAdjustment.allElements"
)

val documentViewLayoutDirectionalLockMap: Map<String, Boolean> = mapOf(
  "yes" to true,
  "no" to false,
  "adaptive" to true
)

val renderStatusViewPositionMap: Map<String, String> = mapOf(
  "top" to "RenderStatusViewPosition.top",
  "centered" to "RenderStatusViewPosition.centered"
)

val doubleTapActionMap: Map<String, String> = mapOf(
  "none" to "TapAction.none",
  "zoom" to "TapAction.zoom",
  "smartZoom" to "TapAction.smartZoom"
)

val linkActionMap: Map<String, String> = mapOf(
  "none" to "LinkAction.none",
  "alertView" to "LinkAction.alertView",
  "externalBrowser" to "LinkAction.openSafari",
  "inlineBrowser" to "LinkAction.inlineBrowser",
  "inlineWebViewController" to "LinkAction.inlineWebViewController"
)

val textSelectionModeMap: Map<String, String> = mapOf(
  "regular" to "TextSelectionMode.regular",
  "simple" to "TextSelectionMode.simple",
  "automatic" to "TextSelectionMode.automatic"
)

val bookmarkSortOrderMap: Map<String, String> = mapOf(
  "custom" to "BookmarkManager.SortOrder.custom",
  "pageBased" to "BookmarkManager.SortOrder.pageBased"
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
  "all" to "TextSelectionMenuAction.all"
)

val bookmarkIndicatorModeMap: Map<String, Boolean> = mapOf(
  "off" to false,
  "alwaysOn" to true,
  "onWhenBookmarked" to true
)

val userInterfaceViewModeMap: Map<String, UserInterfaceViewMode> = mapOf(
  "always" to UserInterfaceViewMode.USER_INTERFACE_VIEW_MODE_VISIBLE,
  "automatic" to UserInterfaceViewMode.USER_INTERFACE_VIEW_MODE_AUTOMATIC,
  "automaticNoFirstLastPage" to UserInterfaceViewMode.USER_INTERFACE_VIEW_MODE_AUTOMATIC_BORDER_PAGES,
  "never" to UserInterfaceViewMode.USER_INTERFACE_VIEW_MODE_HIDDEN
)

val userInterfaceViewAnimationMap: Map<String, String> = mapOf(
  "none" to "UserInterfaceViewAnimation.none",
  "fade" to "UserInterfaceViewAnimation.fade",
  "slide" to "UserInterfaceViewAnimation.slide"
)

val halfModalStyleMap: Map<String, String> = mapOf(
  "card" to "PresentationHalfModalStyle.card",
  "system" to "PresentationHalfModalStyle.system"
)

val documentLabelEnabledMap: Map<String, Boolean> = mapOf(
  "yes" to true,
  "no" to false,
  "adaptive" to true
)

val thumbnailBarModeMap: Map<String, ThumbnailBarMode> = mapOf(
  "none" to ThumbnailBarMode.THUMBNAIL_BAR_MODE_NONE,
  "scrubberBar" to ThumbnailBarMode.THUMBNAIL_BAR_MODE_PINNED,
  "scrollable" to ThumbnailBarMode.THUMBNAIL_BAR_MODE_SCROLLABLE,
  "floatingScrubberBar" to ThumbnailBarMode.THUMBNAIL_BAR_MODE_FLOATING
)

val scrubberBarTypeMap: Map<String, String> = mapOf(
  "horizontal" to "ScrubberBarType.horizontal",
  "verticalLeft" to "ScrubberBarType.verticalLeft",
  "verticalRight" to "ScrubberBarType.verticalRight"
)

val thumbnailGroupingMap: Map<String, String> = mapOf(
  "automatic" to "ThumbnailGrouping.automatic",
  "never" to "ThumbnailGrouping.never",
  "always" to "ThumbnailGrouping.always"
)

val markupAnnotationMergeBehaviorMap: Map<String, String> = mapOf(
  "never" to "MarkupAnnotationMergeBehavior.never",
  "ifColorMatches" to "MarkupAnnotationMergeBehavior.ifColorMatches"
)

val drawCreateModeMap: Map<String, String> = mapOf(
  "separate" to "DrawCreateMode.separate",
  "mergeIfPossible" to "DrawCreateMode.mergeIfPossible",
  "automatic" to "DrawCreateMode.automatic"
)

val soundAnnotationPlayerStyleMap: Map<String, String> = mapOf(
  "inline" to "SoundAnnotationPlayerStyle.inline",
  "bottom" to "SoundAnnotationPlayerStyle.bottom"
)

val searchModeMap: Map<String, Int> = mapOf(
  "modal" to SEARCH_MODULAR,
  "inline" to PdfActivityConfiguration.SEARCH_INLINE
)

val signatureSavingStrategyMap: Map<String, String> = mapOf(
  "alwaysSave" to "SignatureSavingStrategy.alwaysSave",
  "neverSave" to "SignatureSavingStrategy.neverSave",
  "saveIfSelected" to "SignatureSavingStrategy.saveIfSelected"
)

val signatureCertificateSelectionModeMap: Map<String, String> = mapOf(
  "always" to "SignatureCertificateSelectionMode.always",
  "never" to "SignatureCertificateSelectionMode.never",
  "ifAvailable" to "SignatureCertificateSelectionMode.ifAvailable"
)

class PpkConfiguration(arguments: Map<String, Any>, context: Context) {
  var configuration: PdfActivityConfiguration? = null
  var documentPassword: String? = null
  var toolbarTitle: String? = null

  init {
    val builder = PdfActivityConfiguration.Builder(context)

    if (arguments["configuration"] != null) {
      val configurationDictionary: Map<String, Any> = arguments["configuration"] as Map<String, Any>

      for (key in configurationDictionary.keys) {
        val value: Any? = configurationDictionary[key]
        if (value != null) {
          parse(key, value, builder)
        }
      }
    }
    configuration = builder.build()
  }

  private fun parse(key: String, value: Any, builder: PdfActivityConfiguration.Builder) {
    when (key) {
      "appearanceMode", "theme" -> parseThemeMode(value, builder)
      "documentPassword" -> documentPassword = parseAsString(value)
      "toolbarTitle" -> toolbarTitle = parseAsString(value)
      "pageIndex" -> builder.page(parseAsInt(value, 0))
      "pageMode" -> parseLayoutMode(value, builder)
      "pageTransition" -> parsePageScrollMode(value, builder)
      "firstPageAlwaysSingle" -> builder.firstPageAlwaysSingle(parseAsBoolean(value, true))
      "spreadFitting" -> parsePageFitMode(value, builder)
      "backgroundColor" -> builder.backgroundColor(parseAsColor(value, Color.WHITE))
      "scrollDirection" -> parseScrollDirection(value, builder)
      "maximumZoomScale" -> builder.maxZoomScale(parseAsFloat(value, PdfFragment.MAX_ZOOM))
      "scrollOnEdgeTapEnabled" -> builder.scrollOnEdgeTapEnabled(parseAsBoolean(value, true))
      "animateScrollOnEdgeTaps" -> builder.animateScrollOnEdgeTaps(parseAsBoolean(value, false))
      "scrollOnEdgeTapMargin" -> builder.scrollOnEdgeTapMargin(parseAsInt(value, 24))
      "textSelectionEnabled" -> builder.textSelectionEnabled(parseAsBoolean(value,true))
      "editableAnnotationTypes" -> parseEditableAnnotationTypes(value, builder)
      "bookmarkIndicatorMode" -> parseBookmarkIndicatorMode(value, builder)
      "allowMultipleBookmarksPerPage" -> builder.allowMultipleBookmarksPerPage(parseAsBoolean(value, false))
      "userInterfaceViewMode" -> parseUserInterfaceViewMode(value, builder)
      "thumbnailBarMode" -> parseThumbnailBarMode(value, builder)
      "autosaveEnabled" -> builder.autosaveEnabled(parseAsBoolean(value, true))
      "searchMode" -> parseSearchMode(value, builder)
      "settingsOptions" -> parseSettingsOptions(value, builder)
      "copyPasteEnabled" -> when (parseAsBoolean(value, true)) {
          true -> builder.enableCopyPaste()
          false -> builder.disableCopyPaste()
      }
      "bookmarkIndicatorInteractionEnabled", "bookmarkEditingEnabled" -> when (parseAsBoolean(value, true)) {
          true -> builder.enableBookmarkEditing()
          false -> builder.disableBookmarkEditing()
      }
      "documentTitleOverlayEnabled" -> when (parseAsBoolean(value, true)) {
          true -> builder.showDocumentTitleOverlay()
          false -> builder.hideDocumentTitleOverlay()
      }
      "documentInfoViewEnabled" -> when (parseAsBoolean(value, true)) {
        true -> builder.enableDocumentInfoView()
        false -> builder.disableDocumentInfoView()
      }
      "outlineViewEnabled" -> when (parseAsBoolean(value, true)) {
        true -> builder.enableOutline()
        false -> builder.disableOutline()
      }
      "printEnabled" -> when (parseAsBoolean(value, true)) {
        true -> builder.enablePrinting()
        false -> builder.disablePrinting()
      }
      "searchEnabled" -> when (parseAsBoolean(value, true)) {
        true -> builder.enableSearch()
        false -> builder.disableSearch()
      }
      "documentEditingEnabled" -> when (parseAsBoolean(value, false)) {
        true -> builder.enableDocumentEditor()
        false -> builder.disableDocumentEditor()
      }
      "formEditingEnabled" -> when (parseAsBoolean(value, false)) {
        true -> builder.enableFormEditing()
        false -> builder.disableFormEditing()
      }
      "navigationButtonsEnabled" -> when (parseAsBoolean(value, true)) {
        true -> builder.showNavigationButtons()
        false -> builder.hideNavigationButtons()
      }
      "pageLabelEnabled" -> when (parseAsBoolean(value, true)) {
        true -> builder.showPageLabels()
        false -> builder.hidePageLabels()
      }
      "pageNumberOverlayEnabled" -> when (parseAsBoolean(value, true)) {
        true -> builder.showPageNumberOverlay()
        false -> builder.hidePageNumberOverlay()
      }
      "settingsEnabled" -> when (parseAsBoolean(value, true)) {
        true -> builder.showSettingsMenu()
        false -> builder.hideSettingsMenu()
      }
      "thumbnailBarEnabled" -> when (parseAsBoolean(value, true)) {
        true -> builder.showThumbnailGrid()
        false -> builder.hideThumbnailGrid()
      }
      "createAnnotationMenuEnabled", "annotationEditingEnabled" -> when (parseAsBoolean(value, true)) {
        true -> builder.enableAnnotationEditing()
        false -> builder.disableAnnotationEditing()
      }
      "imageSelectionEnabled" -> {			}
      "textSelectionMode" -> {			}
      "textSelectionShouldSnapToWord" -> {			}
      "typesShowingColorPresets" -> {			}
      "freeTextAccessoryViewEnabled" -> {			}
      "bookmarkSortOrder" -> {	}
      "userInterfaceViewAnimation" ->  { }
      "halfModalStyle" ->  { }
      "linkAction" -> {			}
      "allowedMenuActions" -> {			}
      "documentViewLayoutDirectionalLock" -> {			}
      "renderAnimationEnabled" -> {			}
      "renderStatusViewPosition" -> {			}
      "doubleTapAction" -> {			}
      "formElementZoomEnabled" -> {			}
      "scrollViewInsetAdjustment" -> {			}
      "minimumZoomScale" -> {			}
      "allowedAppearanceModes" -> {			}
      "clipToPageBoundaries" -> {		}
      "additionalScrollViewFrameInsets" -> {			}
      "additionalContentInsets" -> {			}
      "shadowEnabled" -> {			}
      "shadowOpacity" -> {			}
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
      "naturalDrawingAnnotationEnabled" -> {			}
      "magicInkReplacementThreshold" -> {			}
      "drawCreateMode" -> {			}
      "shouldAskForAnnotationUsername" -> {			}
      "annotationEntersEditModeAfterSecondTapEnabled" -> {			}
      "shouldScrollToChangedPage" -> {			}
      "soundAnnotationPlayerStyle" -> {			}
      "allowBackgroundSaving" -> {			}
      "soundAnnotationTimeLimit" -> {			}
      "searchResultZoomScale" -> {			}
      "signatureSavingStrategy" -> {			}
      "signatureCertificateSelectionMode" -> {			}
      "signatureBiometricPropertiesOptions" -> {			}
      "naturalSignatureDrawingEnabled" -> {			}
      "sharingConfigurations" -> {			}
      "selectedSharingDestination" -> {			}
      "documentInfoOptions" -> {      }
      else -> { }
    }
  }

  private fun parseThemeMode(value: Any, builder: PdfActivityConfiguration.Builder) {
    if (value is String) {
      val v: ThemeMode? = allowedAppearanceModesMap[value]

      if (v != null) {
        builder.themeMode(v)
      }
    }
  }

  private fun parseLayoutMode(value: Any, builder: PdfActivityConfiguration.Builder) {
    if (value is String) {
      val v: PageLayoutMode? = pageModeMap[value]
      if (v != null) {
        builder.layoutMode(v)
      }
    }
  }

  private fun parsePageScrollMode(value: Any, builder: PdfActivityConfiguration.Builder) {
    if (value is String) {
      val v: PageScrollMode? = pageTransitionMap[value]
      if (v != null) {
        builder.scrollMode(v)
      }
    }
  }

  private fun parsePageFitMode(value: Any, builder: PdfActivityConfiguration.Builder) {
    if (value is String) {
      val v: PageFitMode? = spreadFittingMap[value]
      if (v != null) {
        builder.fitMode(v)
      }
    }
  }

  private fun parseScrollDirection(value: Any, builder: PdfActivityConfiguration.Builder) {
    if (value is String) {
      val v: PageScrollDirection? = scrollDirectionMap[value]
      if (v != null) {
        builder.scrollDirection(v)
      }
    }
  }

  private fun parseEditableAnnotationTypes(value: Any, builder: PdfActivityConfiguration.Builder) {
    if (value is ArrayList<*>) {
      val editableAnnotationTypes: MutableList<AnnotationType> = mutableListOf()
      var v: AnnotationType?

      for (k in value) {
        v = annotationTypesMap[k]
        if (v != null) {
          editableAnnotationTypes.add(v)
        }
      }
      builder.editableAnnotationTypes(editableAnnotationTypes)
      if (editableAnnotationTypes.size == 0) {
        builder.disableAnnotationEditing()
      } else {
        builder.enableAnnotationEditing()
      }
    }
  }

  private fun parseBookmarkIndicatorMode(value: Any, builder: PdfActivityConfiguration.Builder) {
    if (value is String) {
      val v: Boolean? = bookmarkIndicatorModeMap[value]
      if (v != null) {
        if (v) {
          builder.enableBookmarkList()
        } else {
          builder.disableBookmarkList()
        }
      }
    }
  }

  private fun parseUserInterfaceViewMode(value: Any, builder: PdfActivityConfiguration.Builder) {
    if (value is String) {
      val v: UserInterfaceViewMode? = userInterfaceViewModeMap[value]
      if (v != null) {
        builder.setUserInterfaceViewMode(v)
      }
    }
  }

  private fun parseSearchMode(value: Any, builder: PdfActivityConfiguration.Builder) {
    if (value is String) {
      val v: Int? = searchModeMap[value]
      if (v != null) {
        builder.setSearchType(v)
      }
    }
  }

  private fun parseSettingsOptions(value: Any, builder: PdfActivityConfiguration.Builder) {
    if (value is ArrayList<*>) {
    val settingsOptions: MutableCollection<SettingsMenuItemType> = mutableListOf()

      for (option in value) {
        when (option) {
          "appearance", "theme" -> settingsOptions.add(SettingsMenuItemType.THEME)
          "pageTransition" -> settingsOptions.add(SettingsMenuItemType.PAGE_TRANSITION)
          "pageMode" -> settingsOptions.add(SettingsMenuItemType.PAGE_LAYOUT)
          "scrollDirection" -> settingsOptions.add(SettingsMenuItemType.SCROLL_DIRECTION)
          "screenAwake" -> settingsOptions.add(SettingsMenuItemType.SCREEN_AWAKE)
        }
      }
      builder.setSettingsMenuItems(EnumSet.copyOf(settingsOptions))
    }
  }

  private fun parseThumbnailBarMode(value: Any, builder: PdfActivityConfiguration.Builder) {
    if (value is String) {
      val v: ThumbnailBarMode? = thumbnailBarModeMap[value]
      if (v != null) {
        builder.setThumbnailBarMode(v)
      }
    }
  }

  // MARK: Auxiliary Functions

  private fun parseAsString(value: Any): String? {
    return value as String?
  }

  private fun parseAsDouble(value: Any, default: Double): Double {
    val d: Double? = value as Double?

    if (d != null) {
      return d
    }
    return default
  }

  private fun parseAsInt(value: Any, default: Int): Int {
    if (value is Int) {
      return value
    } else if (value is Double) {
      return parseAsDouble(value, default.toDouble()).toInt()
    }
    return default
  }

  private fun parseAsFloat(value: Any, default: Float): Float {
    if (value is Float) {
      return value
    } else if (value is Double) {
      return parseAsDouble(value, default.toDouble()).toFloat()
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
    @Suppress("UNCHECKED_CAST")
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
