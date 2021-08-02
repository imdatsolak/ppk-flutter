/* *****************************************************************************************************
   PPK Flutter - A plugin to provide expanded Interface to PSPDFKit

   Copyright (c) 2021 Imdat Solak (imdat@solak.de)

   For license, checkout LICENSE.txt in the root of this repository
*/

import Foundation
import PSPDFKit
import PSPDFKitUI

let configDict: [String: Any] = [
    "pageMode": [
        "automatic": PageMode.automatic,
        "single": PageMode.single,
        "double": PageMode.double,
    ],
    "pageTransition": [
        "scrollPerspread": PageTransition.scrollContinuous,
        "scrollContinuous": PageTransition.scrollPerSpread,
        "curl": PageTransition.curl,
    ],
    "spreadFitting": [
        "fit": PDFConfiguration.SpreadFitting.fit,
        "fill": PDFConfiguration.SpreadFitting.fill,
        "adaptive": PDFConfiguration.SpreadFitting.adaptive,
    ],
    "allowedAppearanceModes": [
//        "deflt": PDFAppearanceMode.night,
//        "sepia": PDFAppearanceMode.night,
//        "night": PDFAppearanceMode.night,
//        "all": PDFAppearanceMode.all,
        "deflt": PDFAppearanceMode.all,
        "sepia": PDFAppearanceMode.all,
        "night": PDFAppearanceMode.all,
        "all": PDFAppearanceMode.all,
    ],
    "scrollDirection": [
        "horizontal": ScrollDirection.horizontal,
        "vertical": ScrollDirection.vertical,
    ],
    "scrollViewInsetAdjustment": [
        "none": ScrollInsetAdjustment.none,
        "fixedElements": ScrollInsetAdjustment.fixedElements,
        "allElements": ScrollInsetAdjustment.allElements,
    ],
    "documentViewLayoutDirectionalLock": [
        "yes": AdaptiveConditional.YES,
        "no": AdaptiveConditional.NO,
        "adaptive": AdaptiveConditional.adaptive,
    ],
    "renderStatusViewPosition": [
        "top": RenderStatusViewPosition.top,
        "centered": RenderStatusViewPosition.centered,
    ],
    "doubleTapAction": [
        "none": TapAction.none,
        "zoom": TapAction.zoom,
        "smartZoom": TapAction.smartZoom,
    ],
    "linkAction": [
        "none": LinkAction.none,
        "alertView": LinkAction.alertView,
        "externalBrowser": LinkAction.openSafari,
        "inlineBrowser": LinkAction.inlineBrowser,
        "inlineWebViewController": LinkAction.inlineWebViewController,
    ],
    "textSelectionMode": [
        "regular": TextSelectionMode.regular,
        "simple": TextSelectionMode.simple,
        "automatic": TextSelectionMode.automatic,
    ],
    "typesShowingColorPresets": [
        "link": Annotation.Kind.link,
        "highlight": Annotation.Kind.highlight,
        "strikeOut": Annotation.Kind.strikeOut,
        "underline": Annotation.Kind.underline,
        "squiggly": Annotation.Kind.squiggly,
        "note": Annotation.Kind.note,
        "freeText": Annotation.Kind.freeText,
        "ink": Annotation.Kind.ink,
        "square": Annotation.Kind.square,
        "circle": Annotation.Kind.circle,
        "line": Annotation.Kind.line,
        "polygon": Annotation.Kind.polygon,
        "polyLine": Annotation.Kind.polyLine,
        "stamp": Annotation.Kind.stamp,
        "ink": Annotation.Kind.ink,
        "sound": Annotation.Kind.sound,
        "redaction": Annotation.Kind.redaction,
        "widget": Annotation.Kind.widget,
        "file": Annotation.Kind.file,
        "richMedia": Annotation.Kind.richMedia,
        "screen": Annotation.Kind.screen,
        "caret": Annotation.Kind.caret,
        "popup": Annotation.Kind.popup,
        "watermark": Annotation.Kind.watermark,
        "trapNet": Annotation.Kind.trapNet,
        "threeD": Annotation.Kind.threeDimensional,
        "all": Annotation.Kind.all,
    ],
    "bookmarkSortOrder": [
        "custom": BookmarkManager.SortOrder.custom,
        "pageBased": BookmarkManager.SortOrder.pageBased,
    ],
    "bookmarkIndicatorMode": [
        "off": PageBookmarkIndicatorMode.off,
        "alwaysOn": PageBookmarkIndicatorMode.alwaysOn,
        "onWhenBookmarked": PageBookmarkIndicatorMode.onWhenBookmarked,
    ],
    "userInterfaceViewMode": [
        "always": UserInterfaceViewMode.always,
        "automatic": UserInterfaceViewMode.automatic,
        "automaticNoFirstLastPage": UserInterfaceViewMode.automaticNoFirstLastPage,
        "never": UserInterfaceViewMode.never,
    ],
    "userInterfaceViewAnimation": [
        "none": UserInterfaceViewAnimation.none,
        "fade": UserInterfaceViewAnimation.fade,
        "slide": UserInterfaceViewAnimation.slide,
    ],
    "halfModalStyle": [
        "card": PresentationHalfModalStyle.card,
        "system": PresentationHalfModalStyle.system,
    ],
    "documentLabelEnabled": [
        "yes": AdaptiveConditional.YES,
        "no": AdaptiveConditional.NO,
        "adaptive": AdaptiveConditional.adaptive,
    ],
    "thumbnailBarMode": [
        "none": ThumbnailBarMode.none,
        "scrubberBar": ThumbnailBarMode.scrubberBar,
        "scrollable": ThumbnailBarMode.scrollable,
        "floatingScrubberBar": ThumbnailBarMode.floatingScrubberBar,
    ],
    "scrubberBarType": [
        "horizontal": ScrubberBarType.horizontal,
        "verticalLeft": ScrubberBarType.verticalLeft,
        "verticalRight": ScrubberBarType.verticalRight,
    ],
    "thumbnailGrouping": [
        "automatic": ThumbnailGrouping.automatic,
        "never": ThumbnailGrouping.never,
        "always": ThumbnailGrouping.always,
    ],
    "markupAnnotationMergeBehavior": [
        "never": MarkupAnnotationMergeBehavior.never,
        "ifColorMatches": MarkupAnnotationMergeBehavior.ifColorMatches,
    ],
    "drawCreateMode": [
        "separate": DrawCreateMode.separate,
        "mergeIfPossible": DrawCreateMode.mergeIfPossible,
        "automatic": DrawCreateMode.automatic,
    ],
    "soundAnnotationPlayerStyle": [
        "inline": SoundAnnotationPlayerStyle.inline,
        "bottom": SoundAnnotationPlayerStyle.bottom,
    ],
    "searchMode": [
        "modal": SearchMode.modal,
        "inline": SearchMode.inline,
    ],
    "signatureSavingStrategy": [
        "alwaysSave": SignatureSavingStrategy.alwaysSave,
        "neverSave": SignatureSavingStrategy.neverSave,
        "saveIfSelected": SignatureSavingStrategy.saveIfSelected,
    ],
    "signatureCertificateSelectionMode": [
        "always": SignatureCertificateSelectionMode.always,
        "never": SignatureCertificateSelectionMode.never,
        "ifAvailable": SignatureCertificateSelectionMode.ifAvailable,
    ],
]

let textSelectionMenuActions: [String: Any] = [
    "none": [],
    "search": TextSelectionMenuAction.search,
    "define": TextSelectionMenuAction.define,
    "wikipedia": TextSelectionMenuAction.wikipedia,
    "speak": TextSelectionMenuAction.speak,
    "share": TextSelectionMenuAction.share,
    "copy": TextSelectionMenuAction.copy,
    "markup": TextSelectionMenuAction.markup,
    "redact": TextSelectionMenuAction.redact,
    "createLink": TextSelectionMenuAction.createLink,
    "annotationCreation": TextSelectionMenuAction.annotationCreation,
    "all": TextSelectionMenuAction.all,
]

let boolKeys = [
    "firstPageAlwaysSingle", "clipToPageBoundaries", "shadowEnabled",
    "renderAnimationEnabled", "formElementZoomEnabled", "scrollOnEdgeTapEnabled", "animateScrollOnEdgeTaps", "textSelectionEnabled",
    "imageSelectionEnabled",
    "textSelectionShouldSnapToWord",
    "freeTextAccessoryViewEnabled",
    "bookmarkIndicatorInteractionEnabled",
    "allowMultipleBookmarksPerPage",
    "shouldHideUserInterfaceOnPageChange",
    "shouldShowUserInterfaceOnViewWillAppear",
    "shouldAdjustDocumentInsetsByIncludingHomeIndicatorSafeAreaInsets",
    "allowToolbarTitleChange",
    "allowWindowTitleChange",
    "shouldHideNavigationBarWithUserInterface",
    "shouldHideStatusBar",
    "shouldHideStatusBarWithUserInterface",
    "shouldShowRedactionInfoButton",
    "redactionUsageHintEnabled",
    "showBackActionButton",
    "showForwardActionButton",
    "showBackForwardActionButtonLabels",
    "hideThumbnailBarForSinglePageDocuments",
    "annotationGroupingEnabled",
    "createAnnotationMenuEnabled",
    "naturalDrawingAnnotationEnabled",
    "shouldAskForAnnotationUsername",
    "annotationEntersEditModeAfterSecondTapEnabled",
    "shouldScrollToChangedPage",
    "autosaveEnabled",
    "allowBackgroundSaving",
    "naturalSignatureDrawingEnabled",
]

let cgrectKeys = [
    "additionalScrollViewFrameInsets",
    "additionalContentInsets",
    "thumbnailMargin",
]

let cgsizeKeys = [
    "thumbnailSize",
]

let numberKeys = [
    "shadowOpacity",
    "minimumZoomScale",
    "maximumZoomScale",
    "scrollOnEdgeTapMargin",
    "thumbnailInteritemSpacing",
    "thumbnailLineSpacing",
    "annotationAnimationDuration",
    "magicInkReplacementThreshold",
    "soundAnnotationTimeLimit",
    "searchResultZoomScale",
]

let colorKeys = [
    "backgroundColor",
]
/*
 PPKDocumentInfoViewConfiguration? documentInfoViewConfiguration;
 List<PPKTextSelectionMenuAction>? allowedMenuActions = [
   PPKTextSelectionMenuAction.search,
   PPKTextSelectionMenuAction.define,
   PPKTextSelectionMenuAction.speak,
   PPKTextSelectionMenuAction.share,
   PPKTextSelectionMenuAction.copy,
   PPKTextSelectionMenuAction.annotationCreation,
 ];

 List<PPKAnnotationType>? editableAnnotationTypes = [];

 PPKMarkupAnnotationMergeBehavior markupAnnotationMergeBehavior = PPKMarkupAnnotationMergeBehavior.mergeIfColorMatches;
 PPKDocumentSharingConfiguration? sharingConfigurations;
 PPKDocumentSharingDestination? selectedSharingDestination;
 List<PPKSettingsOption>? settingsOptions = [PPKSettingsOption.deflt];

 */
class PPKConfiguration {
    
    private let _configurationDictionary: [String: Any]
    private let _isImageDocument: Bool
    private let _pdfConfiguration: PDFConfiguration
    
    init(fromArguments arguments: [String: Any], isImageDocument: Bool = false) {
        if let cDict = arguments["configuration"] as? [String: Any] {
            _configurationDictionary = cDict
            if isImageDocument {
                _pdfConfiguration = PDFConfiguration.image
            } else {
                _pdfConfiguration = PDFConfiguration()
            }
        } else {
            _configurationDictionary = [:]
            if isImageDocument {
                _pdfConfiguration = PDFConfiguration.image
            } else {
                _pdfConfiguration = PDFConfiguration()
            }
        }
        _isImageDocument = isImageDocument
        parseConfiguration()
    }

    private func parseConfiguration() {
        _pdfConfiguration.configurationUpdated { builder in
            if let v = _configurationDictionary["pageMode"] as? String {
                builder.pageMode = pageMode(v)
            }
            
        }
    }
    
    private func pageMode(_ v: String ) -> PageMode {
        var mode = PDFConfiguration().pageMode
        switch (v) {
            case "automatic":
                mode = .automatic
            case "single":
                mode = .single
            case "double":
                mode = .double
            default:
                break
        }
        return mode
    }
    
    public var appearanceMode: PDFAppearanceMode {
        get {
            return PDFAppearanceMode.night
        }
    }
    
    public var documentPassword: String? {
        get {
            if let pass = _configurationDictionary["password"] as? String {
                return pass
            }
            return nil
        }
    }
    
    public var pdfConfiguration: PDFConfiguration? {
        get {
            return _pdfConfiguration
        }
    }
    
    public var pageIndex: UInt {
        get {
            return 0
        }
    }
    
    public var rightBarButtonItems: [String]? {
        get {
            if let barButtonItems = _configurationDictionary["rightBarButtonItems"] as? [String] {
                return barButtonItems
            }
            return nil
        }
    }
    
    public var leftBarButtonItems: [String]? {
        get {
            if let barButtonItems = _configurationDictionary["leftBarButtonItems"] as? [String] {
                return barButtonItems
            }
            return nil
        }
    }
    
    public var toolbarTitle: String? {
        get {
            if let title = _configurationDictionary["toolbarTitle"] as? String {
                return title
            }
            return nil
        }
    }
    
    public var documentInfoOptions: [DocumentInfoOption]? {
        get {
            return nil
        }
    }
}
