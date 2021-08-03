/*
 * **********************************************************************
 * PPK Flutter - A plugin to provide expanded Interface to PSPDFKit
 *
 * Copyright (c) 2021 Imdat Solak (imdat@solak.de)
 *
 * For license, check out LICENSE.txt in the root of this repository
 * **********************************************************************
 */

import Foundation
import PSPDFKit
import PSPDFKitUI

let pageModeMap: [String: PageMode] = [
    "automatic": PageMode.automatic,
    "single": PageMode.single,
    "double": PageMode.double,
]

let pageTransitionMap: [String: PageTransition] = [
    "scrollContinuous": PageTransition.scrollContinuous,
    "scrollPerspread": PageTransition.scrollPerSpread,
    "curl": PageTransition.curl,
]

let spreadFittingMap: [String: PDFConfiguration.SpreadFitting] = [
    "fit": PDFConfiguration.SpreadFitting.fit,
    "fill": PDFConfiguration.SpreadFitting.fill,
    "adaptive": PDFConfiguration.SpreadFitting.adaptive,
]

let allowedAppearanceModesMap: [String: PDFAppearanceMode] = [
//        "deflt": PDFAppearanceMode.night,
//        "sepia": PDFAppearanceMode.night,
//        "night": PDFAppearanceMode.night,
//        "all": PDFAppearanceMode.all,
    "deflt": [],
    "sepia": PDFAppearanceMode.sepia,
    "night": PDFAppearanceMode.night,
    "all": PDFAppearanceMode.all,
]

let scrollDirectionMap: [String: ScrollDirection] = [
    "horizontal": ScrollDirection.horizontal,
    "vertical": ScrollDirection.vertical,
]

let scrollViewInsetAdjustmentMap: [String: ScrollInsetAdjustment] = [
    "none": ScrollInsetAdjustment.none,
    "fixedElements": ScrollInsetAdjustment.fixedElements,
    "allElements": ScrollInsetAdjustment.allElements,
]

let documentViewLayoutDirectionalLockMap: [String: AdaptiveConditional] = [
    "yes": AdaptiveConditional.YES,
    "no": AdaptiveConditional.NO,
    "adaptive": AdaptiveConditional.adaptive,
]

let renderStatusViewPositionMap: [String: RenderStatusViewPosition] = [
    "top": RenderStatusViewPosition.top,
    "centered": RenderStatusViewPosition.centered,
]

let doubleTapActionMap: [String: TapAction] = [
    "none": TapAction.none,
    "zoom": TapAction.zoom,
    "smartZoom": TapAction.smartZoom,
]

let linkActionMap: [String: LinkAction] = [
    "none": LinkAction.none,
    "alertView": LinkAction.alertView,
    "externalBrowser": LinkAction.openSafari,
    "inlineBrowser": LinkAction.inlineBrowser,
    "inlineWebViewController": LinkAction.inlineWebViewController,
]

let textSelectionModeMap: [String: TextSelectionMode] = [
    "regular": TextSelectionMode.regular,
    "simple": TextSelectionMode.simple,
    "automatic": TextSelectionMode.automatic,
]

let bookmarkSortOrderMap: [String: BookmarkManager.SortOrder] = [
    "custom": BookmarkManager.SortOrder.custom,
    "pageBased": BookmarkManager.SortOrder.pageBased,
]

let annotationTypesMap: [String: Annotation.Kind] = [
    "all": Annotation.Kind.all,
    "caret": Annotation.Kind.caret,
    "circle": Annotation.Kind.circle,
    "file": Annotation.Kind.file,
    "freeText": Annotation.Kind.freeText,
    "highlight": Annotation.Kind.highlight,
    "ink": Annotation.Kind.ink,
    "line": Annotation.Kind.line,
    "link": Annotation.Kind.link,
    "note": Annotation.Kind.note,
    "polyLine": Annotation.Kind.polyLine,
    "polygon": Annotation.Kind.polygon,
    "popup": Annotation.Kind.popup,
    "redaction": Annotation.Kind.redaction,
    "richMedia": Annotation.Kind.richMedia,
    "screen": Annotation.Kind.screen,
    "sound": Annotation.Kind.sound,
    "square": Annotation.Kind.square,
    "squiggly": Annotation.Kind.squiggly,
    "stamp": Annotation.Kind.stamp,
    "strikeOut": Annotation.Kind.strikeOut,
    "threeD": Annotation.Kind.threeDimensional,
    "trapNet": Annotation.Kind.trapNet,
    "underline": Annotation.Kind.underline,
    "watermark": Annotation.Kind.watermark,
    "widget": Annotation.Kind.widget
]

let annotationToolsMap: [String: Annotation.Tool] = [
    "caret": Annotation.Tool.caret,
    "circle": Annotation.Tool.circle,
    "file": Annotation.Tool.file,
    "freeText": Annotation.Tool.freeText,
    "highlight": Annotation.Tool.highlight,
    "ink": Annotation.Tool.ink,
    "line": Annotation.Tool.line,
    "link": Annotation.Tool.link,
    "note": Annotation.Tool.note,
    "polyLine": Annotation.Tool.polyLine,
    "polygon": Annotation.Tool.polygon,
    "popup": Annotation.Tool.popup,
    "redaction": Annotation.Tool.redaction,
    "richMedia": Annotation.Tool.richMedia,
    "screen": Annotation.Tool.screen,
    "sound": Annotation.Tool.sound,
    "square": Annotation.Tool.square,
    "squiggly": Annotation.Tool.squiggly,
    "stamp": Annotation.Tool.stamp,
    "strikeOut": Annotation.Tool.strikeOut,
    "trapNet": Annotation.Tool.trapNet,
    "underline": Annotation.Tool.underline,
    "watermark": Annotation.Tool.watermark,
    "widget": Annotation.Tool.widget
]

let textSelectionMenuActionsMap: [String: TextSelectionMenuAction] = [
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

let bookmarkIndicatorModeMap: [String: PageBookmarkIndicatorMode] = [
    "off": PageBookmarkIndicatorMode.off,
    "alwaysOn": PageBookmarkIndicatorMode.alwaysOn,
    "onWhenBookmarked": PageBookmarkIndicatorMode.onWhenBookmarked,
]

let userInterfaceViewModeMap: [String: UserInterfaceViewMode] = [
    "always": UserInterfaceViewMode.always,
    "automatic": UserInterfaceViewMode.automatic,
    "automaticNoFirstLastPage": UserInterfaceViewMode.automaticNoFirstLastPage,
    "never": UserInterfaceViewMode.never,
]

let userInterfaceViewAnimationMap: [String: UserInterfaceViewAnimation] = [
    "none": UserInterfaceViewAnimation.none,
    "fade": UserInterfaceViewAnimation.fade,
    "slide": UserInterfaceViewAnimation.slide,
]

let halfModalStyleMap: [String: PresentationHalfModalStyle] = [
    "card": PresentationHalfModalStyle.card,
    "system": PresentationHalfModalStyle.system,
]

let documentLabelEnabledMap: [String: AdaptiveConditional] = [
    "yes": AdaptiveConditional.YES,
    "no": AdaptiveConditional.NO,
    "adaptive": AdaptiveConditional.adaptive,
]

let thumbnailBarModeMap: [String: ThumbnailBarMode] = [
    "none": ThumbnailBarMode.none,
    "scrubberBar": ThumbnailBarMode.scrubberBar,
    "scrollable": ThumbnailBarMode.scrollable,
    "floatingScrubberBar": ThumbnailBarMode.floatingScrubberBar,
]

let scrubberBarTypeMap: [String: ScrubberBarType] = [
    "horizontal": ScrubberBarType.horizontal,
    "verticalLeft": ScrubberBarType.verticalLeft,
    "verticalRight": ScrubberBarType.verticalRight,
]

let thumbnailGroupingMap: [String: ThumbnailGrouping] = [
    "automatic": ThumbnailGrouping.automatic,
    "never": ThumbnailGrouping.never,
    "always": ThumbnailGrouping.always,
]

let markupAnnotationMergeBehaviorMap: [String: MarkupAnnotationMergeBehavior] = [
    "never": MarkupAnnotationMergeBehavior.never,
    "ifColorMatches": MarkupAnnotationMergeBehavior.ifColorMatches,
]

let drawCreateModeMap: [String: DrawCreateMode] = [
    "separate": DrawCreateMode.separate,
    "mergeIfPossible": DrawCreateMode.mergeIfPossible,
    "automatic": DrawCreateMode.automatic,
]

let soundAnnotationPlayerStyleMap: [String: SoundAnnotationPlayerStyle] = [
    "inline": SoundAnnotationPlayerStyle.inline,
    "bottom": SoundAnnotationPlayerStyle.bottom,
]

let searchModeMap: [String: SearchMode] = [
    "modal": SearchMode.modal,
    "inline": SearchMode.inline,
]

let signatureSavingStrategyMap: [String: SignatureSavingStrategy] = [
    "alwaysSave": SignatureSavingStrategy.alwaysSave,
    "neverSave": SignatureSavingStrategy.neverSave,
    "saveIfSelected": SignatureSavingStrategy.saveIfSelected,
]

let signatureCertificateSelectionModeMap: [String: SignatureCertificateSelectionMode] = [
    "always": SignatureCertificateSelectionMode.always,
    "never": SignatureCertificateSelectionMode.never,
    "ifAvailable": SignatureCertificateSelectionMode.ifAvailable,
]

class PPKConfiguration {

    private let _configurationDictionary: [String: Any]
    private let _isImageDocument: Bool
    public let pdfConfiguration: PDFConfiguration
    public var documentInfoOptions: [DocumentInfoOption]?
    public var allowedMenuActions: [TextSelectionMenuAction] = [ TextSelectionMenuAction.search, TextSelectionMenuAction.define, TextSelectionMenuAction.speak, TextSelectionMenuAction.share, TextSelectionMenuAction.copy, TextSelectionMenuAction.annotationCreation ]
    public var editableAnnotationTypes: [Annotation.Kind] = [ Annotation.Kind.all ]
    public var documentPassword: String?
    public var toolbarTitle: String?
    public var pageIndex: UInt = 0
    public var appearanceMode: PDFAppearanceMode = []

    init(fromArguments arguments: [String: Any], isImageDocument: Bool = false) {
        _isImageDocument = isImageDocument
        if let cDict = arguments["configuration"] as? [String: Any] {
            _configurationDictionary = cDict
            if isImageDocument {
                pdfConfiguration = PDFConfiguration.image
            } else {
                pdfConfiguration = PDFConfiguration()
            }
            pdfConfiguration.configurationUpdated { builder in
                for dictKey in _configurationDictionary.keys {
                    if let dictValue = _configurationDictionary[dictKey] {
                        _parse(key: dictKey, value: dictValue, builder: builder)
                    }
                }
            }
            _parseDocumentInfoOptions()
        } else {
            _configurationDictionary = [:]
            if isImageDocument {
                pdfConfiguration = PDFConfiguration.image
            } else {
                pdfConfiguration = PDFConfiguration()
            }
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

    // MARK: Initial Parsing
    private func _parse(key: String, value: Any, builder: PDFConfigurationBuilder) {
        switch (key) {
            case "appearanceMode":
                if let v = value as? String, let ppkValue = allowedAppearanceModesMap[v] {
                    appearanceMode = ppkValue
                }
            case "password":
                if let v = value as? String {
                    documentPassword = v
                }
            case "toolbarTitle":
                if let v = value as? String {
                    toolbarTitle = v
                }
            case "pageIndex":
                if let v = value as? UInt {
                    pageIndex = v
                }
            case "pageMode":
                if let v = value as? String, let ppkValue = pageModeMap[v] {
                    builder.pageMode = ppkValue
                }
            case "pageTransition":
                if let v = value as? String, let ppkValue = pageTransitionMap[v] {
                    builder.pageTransition = ppkValue
                }
            case "firstPageAlwaysSignle":
                if let v = value as? Bool {
                    builder.isFirstPageAlwaysSingle = v
                }
            case "spreadFitting":
                if let v = value as? String, let ppkValue = spreadFittingMap[v] {
                    builder.spreadFitting = ppkValue
                }
            case "clipToPageBoundaries":
                if let v = value as? Bool {
                    builder.clipToPageBoundaries = v
                }
            case "additionalScrollViewFrameInsets":
                if let v = value as? [String: Any], let ppkValue = _uiedgeinsets(fromDict: v) {
                    builder.additionalScrollViewFrameInsets = ppkValue
                }
            case "additionalContentInsets":
                if let v = value as? [String: Any], let ppkValue = _uiedgeinsets(fromDict: v) {
                    builder.additionalContentInsets = ppkValue
                }
            case "shadowEnabled":
                if let v = value as? Bool {
                    builder.isShadowEnabled = v
                }
            case "shadowOpacity":
                if let v = value as? CGFloat {
                    builder.shadowOpacity = v
                }
            case "backgroundColor":
                if let v = value as? [String: Any], let ppkValue = _uicolor(fromDict: v) {
                    builder.backgroundColor = ppkValue
                }
            case "allowedAppearanceModes":
                if let v = value as? String, let ppkValue = allowedAppearanceModesMap[v] {
                    builder.allowedAppearanceModes = ppkValue
                }
            case "scrollDirection":
                if let v = value as? String, let ppkValue = scrollDirectionMap[v] {
                    builder.scrollDirection = ppkValue
                }
            case "scrollViewInsetAdjustment":
                if let v = value as? String, let ppkValue = scrollViewInsetAdjustmentMap[v] {
                    builder.scrollViewInsetAdjustment = ppkValue
                }
            case "minimumZoomScale":
                if let v = value as? Float {
                    builder.minimumZoomScale = v
                }
            case "maximumZoomScale":
                if let v = value as? Float {
                    builder.maximumZoomScale = v
                }
            case "documentViewLayoutDirectionalLock":
                if let v = value as? String, let ppkValue = documentViewLayoutDirectionalLockMap[v] {
                    builder.documentViewLayoutDirectionalLock = ppkValue
                }
            case "renderAnimationEnabled":
                if let v = value as? Bool {
                    builder.isRenderAnimationEnabled = v
                }
            case "renderStatusViewPosition":
                if let v = value as? String, let ppkValue = renderStatusViewPositionMap[v] {
                    builder.renderStatusViewPosition = ppkValue
                }
            case "doubleTapAction":
                if let v = value as? String, let ppkValue = doubleTapActionMap[v] {
                    builder.doubleTapAction = ppkValue
                }
            case "formElementZoomEnabled":
                if let v = value as? Bool {
                    builder.isFormElementZoomEnabled = v
                }
            case "scrollOnEdgeTapEnabled":
                if let v = value as? Bool {
                    builder.isScrollOnEdgeTapEnabled = v
                }
            case "animateScrollOnEdgeTaps":
                if let v = value as? Bool {
                    builder.animateScrollOnEdgeTaps = v
                }
            case "scrollOnEdgeTapMargin":
                if let v = value as? CGFloat {
                    builder.scrollOnEdgeTapMargin = v
                }
            case "linkAction":
                if let v = value as? String, let ppkValue = linkActionMap[v] {
                    builder.linkAction = ppkValue
                }
            case "allowedMenuActions":
                if let v = value as? [String] {
                    _parseAllowedMenuActions(v)
                }
            case "textSelectionEnabled":
                if let v = value as? Bool {
                    builder.isTextSelectionEnabled = v
                }
            case "imageSelectionEnabled":
                if let v = value as? Bool {
                    builder.isImageSelectionEnabled = v
                }
            case "textSelectionMode":
                if let v = value as? String, let ppkValue = textSelectionModeMap[v] {
                    builder.textSelectionMode = ppkValue
                }
            case "textSelectionShouldSnapToWord":
                if let v = value as? Bool {
                    builder.textSelectionShouldSnapToWord = v
                }
            case "editableAnnotationTypes":
                if let v = value as? [String] {
                    _parseEditableAnnotationTypes(v)
                }
            case "typesShowingColorPresets":
                if let v = value as? String, let ppkValue = annotationToolsMap[v] {
                    builder.editableAnnotationTypes = [ppkValue]
                }
            case "freeTextAccessoryViewEnabled":
                if let v = value as? Bool {
                    builder.freeTextAccessoryViewEnabled = v
                }
            case "bookmarkSortOrder":
                if let v = value as? String, let ppkValue = bookmarkSortOrderMap[v] {
                    builder.bookmarkSortOrder = ppkValue
                }
            case "bookmarkIndicatorMode":
                if let v = value as? String, let ppkValue = bookmarkIndicatorModeMap[v] {
                    builder.bookmarkIndicatorMode = ppkValue
                }
            case "bookmarkIndicatorInteractionEnabled":
                if let v = value as? Bool {
                    builder.bookmarkIndicatorInteractionEnabled = v
                }
            case "allowMultipleBookmarksPerPage":
                if let v = value as? Bool {
                    builder.allowMultipleBookmarksPerPage = v
                }
            case "userInterfaceViewMode":
                if let v = value as? String, let ppkValue = userInterfaceViewModeMap[v] {
                    builder.userInterfaceViewMode = ppkValue
                }
            case "userInterfaceViewAnimation":
                if let v = value as? String, let ppkValue = userInterfaceViewAnimationMap[v] {
                    builder.userInterfaceViewAnimation = ppkValue
                }
            case "halfModalStyle":
                if let v = value as? String, let ppkValue = halfModalStyleMap[v] {
                    builder.halfModalStyle = ppkValue
                }
            case "documentLabelEnabled":
                if let v = value as? String, let ppkValue = documentLabelEnabledMap[v] {
                    builder.documentLabelEnabled = ppkValue
                }
            case "shouldHideUserInterfaceOnPageChange":
                if let v = value as? Bool {
                    builder.shouldHideUserInterfaceOnPageChange = v
                }
            case "shouldShowUserInterfaceOnViewWillAppear":
                if let v = value as? Bool {
                    builder.shouldShowUserInterfaceOnViewWillAppear = v
                }
            case "shouldAdjustDocumentInsetsByIncludingHomeIndicatorSafeAreaInsets":
                if let v = value as? Bool {
                    builder.shouldAdjustDocumentInsetsByIncludingHomeIndicatorSafeAreaInsets = v
                }
            case "allowToolbarTitleChange":
                if let v = value as? Bool {
                    builder.allowToolbarTitleChange = v
                }
            case "allowWindowTitleChange":
                if let v = value as? Bool {
                    builder.allowWindowTitleChange = v
                }
            case "shouldHideNavigationBarWithUserInterface":
                if let v = value as? Bool {
                    builder.shouldHideNavigationBarWithUserInterface = v
                }
            case "shouldHideStatusBar":
                if let v = value as? Bool {
                    builder.shouldHideStatusBar = v
                }
            case "shouldHideStatusBarWithUserInterface":
                if let v = value as? Bool {
                    builder.shouldHideStatusBarWithUserInterface = v
                }
            case "shouldShowRedactionInfoButton":
                if let v = value as? Bool {
                    builder.shouldShowRedactionInfoButton = v
                }
            case "redactionUsageHintEnabled":
                if let v = value as? Bool {
                    builder.redactionUsageHintEnabled = v
                }
            case "showBackActionButton":
                if let v = value as? Bool {
                    builder.showBackActionButton = v
                }
            case "showForwardActionButton":
                if let v = value as? Bool {
                    builder.showForwardActionButton = v
                }
            case "showBackForwardActionButtonLabels":
                if let v = value as? Bool {
                    builder.showBackForwardActionButtonLabels = v
                }
            case "thumbnailBarMode":
                if let v = value as? String, let ppkValue = thumbnailBarModeMap[v] {
                    builder.thumbnailBarMode = ppkValue
                }
            case "scrubberBarType":
                if let v = value as? String, let ppkValue = scrubberBarTypeMap[v] {
                    builder.scrubberBarType = ppkValue
                }
            case "hideThumbnailBarForSinglePageDocuments":
                if let v = value as? Bool {
                    builder.showBackForwardActionButtonLabels = v
                }
            case "thumbnailGrouping":
                if let v = value as? String, let ppkValue = thumbnailGroupingMap[v] {
                    builder.thumbnailGrouping = ppkValue
                }
            case "thumbnailSize":
                if let v = value as? [String: Any], let ppkValue = _cgsize(fromDict: v) {
                    builder.thumbnailSize = ppkValue
                }
            case "thumbnailInteritemSpacing":
                if let v = value as? CGFloat {
                    builder.thumbnailInteritemSpacing = v
                }
            case "thumbnailLineSpacing":
                if let v = value as? CGFloat {
                    builder.thumbnailLineSpacing = v
                }
            case "thumbnailMargin":
                if let v = value as? [String:Any], let ppkValue = _uiedgeinsets(fromDict: v) {
                    builder.thumbnailMargin = ppkValue
                }
            case "annotationAnimationDuration":
                if let v = value as? CGFloat {
                    builder.annotationAnimationDuration = v
                }
            case "annotationGroupingEnabled":
                if let v = value as? Bool {
                    builder.annotationGroupingEnabled = v
                }
            case "markupAnnotationMergeBehavior":
                if let v = value as? String, let ppkValue = markupAnnotationMergeBehaviorMap[v] {
                    builder.markupAnnotationMergeBehavior = ppkValue
                }
            case "createAnnotationMenuEnabled":
                if let v = value as? Bool {
                    builder.isCreateAnnotationMenuEnabled = v
                }
            case "naturalDrawingAnnotationEnabled":
                if let v = value as? Bool {
                    builder.naturalDrawingAnnotationEnabled = v
                }
            case "magicInkReplacementThreshold":
                if let v = value as? UInt {
                    builder.magicInkReplacementThreshold = v
                }
            case "drawCreateMode":
                if let v = value as? String, let ppkValue = drawCreateModeMap[v] {
                    builder.drawCreateMode = ppkValue
                }
            case "shouldAskForAnnotationUsername":
                if let v = value as? Bool {
                    builder.shouldAskForAnnotationUsername = v
                }
            case "annotationEntersEditModeAfterSecondTapEnabled":
                if let v = value as? Bool {
                    builder.annotationEntersEditModeAfterSecondTapEnabled = v
                }
            case "shouldScrollToChangedPage":
                if let v = value as? Bool {
                    builder.shouldScrollToChangedPage = v
                }
            case "soundAnnotationPlayerStyle":
                if let v = value as? String, let ppkValue = soundAnnotationPlayerStyleMap[v] {
                    builder.soundAnnotationPlayerStyle = ppkValue
                }
            case "autosaveEnabled":
                if let v = value as? Bool {
                    builder.isAutosaveEnabled = v
                }
            case "allowBackgroundSaving":
                if let v = value as? Bool {
                    builder.allowBackgroundSaving = v
                }
            case "soundAnnotationTimeLimit":
                if let v = value as? Double {
                    builder.soundAnnotationTimeLimit = v
                }
            case "searchMode":
                if let v = value as? String, let ppkValue = searchModeMap[v] {
                    builder.searchMode = ppkValue
                }
            case "searchResultZoomScale":
                if let v = value as? CGFloat {
                    builder.searchResultZoomScale = v
                }
            case "signatureSavingStrategy":
                if let v = value as? String, let ppkValue = signatureSavingStrategyMap[v] {
                    builder.signatureSavingStrategy = ppkValue
                }
            case "signatureCertificateSelectionMode":
                if let v = value as? String, let ppkValue = signatureCertificateSelectionModeMap[v] {
                    builder.signatureCertificateSelectionMode = ppkValue
                }
            case "signatureBiometricPropertiesOptions":
                break
            case "naturalSignatureDrawingEnabled":
                break
            case "sharingConfigurations":
                break
            case "selectedSharingDestination":
                break
            case "settingsOptions":
                if let v = value as? [String] {
                    _parseSettingsOptions(v, withBuilder: builder)
                }
            default:
                break
        }
    }

    private func _parseSharingConfiguration() {}

    private func _parseSettingsOptions(_ optionsStringList: [String], withBuilder builder: PDFConfigurationBuilder) {
        var options: PDFSettingsViewController.Options = []
        for option in optionsStringList {
            switch (option) {
                case "appearance", "theme":
                    options.update(with: PDFSettingsViewController.Options.appearance)
                case "pageTransition":
                    options.update(with: PDFSettingsViewController.Options.pageTransition)
                case "scrollDirection":
                    options.update(with: PDFSettingsViewController.Options.scrollDirection)
                case "brightness":
                    options.update(with: PDFSettingsViewController.Options.brightness)
                case "pageMode":
                    options.update(with: PDFSettingsViewController.Options.pageMode)
                case "spreadFitting":
                    options.update(with: PDFSettingsViewController.Options.spreadFitting)
                case "deflt":
                    options = PDFSettingsViewController.Options.default
                case "all":
                    options = PDFSettingsViewController.Options.all
                default:
                    break
            }
        }
        builder.settingsOptions = options
    }

    private func _parseEditableAnnotationTypes(_ editableAnnotationTypesStringList: [String] ) {
        editableAnnotationTypes.removeAll()
        for key in editableAnnotationTypesStringList {
            if let value = annotationTypesMap[key] {
                editableAnnotationTypes.append(value)
            }
        }
    }

    private func _parseAllowedMenuActions(_ allowedMenuActionsStringList: [String]) {
        allowedMenuActions.removeAll()
        for key in allowedMenuActionsStringList {
            if let value = textSelectionMenuActionsMap[key] {
                allowedMenuActions.append(value)
            }
        }
    }

    private func _parseDocumentInfoOptions() {
        if let documentInfoOptionDict = _configurationDictionary["documentInfoOptions"] as? [String: Any] {
            documentInfoOptions = []
            if let option = documentInfoOptionDict["outline"] as? Bool, option == true {
                documentInfoOptions?.append(DocumentInfoOption.outline)
            }
            if let option = documentInfoOptionDict["annotations"] as? Bool, option == true {
                documentInfoOptions?.append(DocumentInfoOption.annotations)
            }
            if let option = documentInfoOptionDict["embeddedFiles"] as? Bool, option == true {
                documentInfoOptions?.append(DocumentInfoOption.embeddedFiles)
            }
            if let option = documentInfoOptionDict["bookmarks"] as? Bool, option == true {
                documentInfoOptions?.append(DocumentInfoOption.bookmarks)
            }
            if let option = documentInfoOptionDict["documentInfo"] as? Bool, option == true {
                documentInfoOptions?.append(DocumentInfoOption.documentInfo)
            }
            if let option = documentInfoOptionDict["security"] as? Bool, option == true {
                documentInfoOptions?.append(DocumentInfoOption.security)
            }
            if documentInfoOptions?.count == 0 {
                documentInfoOptions = nil
            }
        } else {
            documentInfoOptions = nil
        }
    }

    // MARK: Aux Functions
    private func _uiedgeinsets(fromDict dict: [String: Any]) -> UIEdgeInsets? {
        if let top = dict["top"] as? CGFloat, let bottom = dict["bottom"] as? CGFloat, let right = dict["right"] as? CGFloat, let left = dict["left"] as? CGFloat {
            return UIEdgeInsets(top: top, left: left, bottom: bottom, right: right)
        }
        return nil
    }

    private func _cgsize(fromDict dict: [String: Any]) -> CGSize? {
        if let width = dict["width"] as? Double, let height = dict["height"] as? Double {
            return CGSize(width: width, height: height)
        }
        return nil
    }

    private func _uicolor(fromDict dict: [String: Any]) -> UIColor? {
        if let red = dict["red"] as? CGFloat, let green = dict["green"] as? CGFloat, let blue = dict["blue"] as? CGFloat, let alpha = dict["alpha"] as? CGFloat {
            return UIColor(cgColor: CGColor(red: red, green: green, blue: blue, alpha: alpha))
        }
        return nil
    }


}
