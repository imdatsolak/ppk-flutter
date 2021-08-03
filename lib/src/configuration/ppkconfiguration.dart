/*
 * **********************************************************************
 * PPK Flutter - A plugin to provide expanded Interface to PSPDFKit
 *
 * Copyright (c) 2021 Imdat Solak (imdat@solak.de)
 *
 * For license, check out LICENSE.txt in the root of this repository
 * **********************************************************************
 */

import "package:flutter/material.dart";
import "package:json_annotation/json_annotation.dart";
import "package:ppk_flutter/ppk_flutter.dart";

part "ppkconfiguration.g.dart";

// Appearance Properties
enum PPKPageMode { single, double, automatic }
enum PPKPageTransition { scrollPerSpread, scrollContinuous, curl }
enum PPKSpreadFitting { fit, fill, adaptive }
enum PPKAppearanceMode { deflt, sepia, night, all }

// Scroll View Configuration
enum PPKScrollDirection { horizontal, vertical }
enum PPKScrollInsetAdjustment { none, fixedElements, allElements }
enum PPKAdaptiveConditional { no, yes, adaptive }

// Page Broder and Rendering
enum PPKRenderStatusViewPosition { top, centered }

// Page Behavior
enum PPKTapAction { none, zoom, smartZoom }

// Page Actions
enum PPKLinkAction { none, alertView, externalBrowser, inlineBrowser, inlineWebViewController }
enum PPKTextSelectionMenuAction {
  none,
  search,
  define,
  wikipedia,
  speak,
  share,
  copy,
  markup,
  redact,
  createLink,
  annotationCreation,
  all
}

// Features
enum PPKTextSelectionMode { regular, simple, automatic }
enum PPKAnnotationType {
  link,
  highlight,
  strikeOut,
  underline,
  squiggly,
  note,
  freeText,
  ink,
  square,
  circle,
  line,
  polygon,
  polyLine,
  stamp,
  sound,
  redaction,
  widget,
  file,
  richMedia,
  screen,
  caret,
  popup,
  watermark,
  trapNet,
  threeD,
  all
}
enum PPKBookmarkSortOrder { custom, pageBased }
enum PPKBookmarkIndicatorMode { off, alwaysOn, onWhenBookmarked }

// User Interface Settings
enum PPKUserInterfaceViewMode { always, automatic, automaticNoFirstLastPage, never }
enum PPKUserInterfaceViewAnimation { none, fade, slide }
enum PPKPresentationHalfModalStyle { card, system }

// Thumbnail Settings
enum PPKThumbnailBarMode { none, scrubberBar, scrollable, floatingScrubberBar }
enum PPKScrubberBarType { horizontal, verticalLeft, verticalRight }
enum PPKThumbnailGrouping { automatic, never, always }

// Annotation Settings
enum PPKMarkupAnnotationMergeBehavior { never, ifColorMatches }
enum PPKDrawCreateMode { separate, mergeIfPossible, automatic }
enum PPKSoundAnnotationPlayerStyle { inline, bottom }

// Search Mode
enum PPKSearchMode { modal, inline }

// Signatures
enum PPKSignatureSavingStrategy { alwaysSave, neverSave, saveIfSelected }
enum PPKSignatureCertificateSelectionMode { always, never, ifAvailable }
enum PPKSignatureBiometricPropertiesOption { none, pressure, timePoints, touchRadius, inputMethod, all }

// Settings Options
enum PPKSettingsOption { theme, appearance, scrollDirection, pageTransition, brightness, pageMode, spreadFitting, deflt, all }


// BarButtons
enum PPKBarButtonItem { closeButtonItem, outlineButtonItem, searchButtonItem, thumbnailsButtonItem, documentEditorButtonItem, printButtonItem, openInButtonItem, emailButtonItem, messageButtonItem, annotationButtonItem, bookmarkButtonItem, brightnessButtonItem, activityButtonItem, settingsButtonItem, readerViewButtonItem }

@JsonSerializable()
class PPKConfiguration extends PPKMethodChannelObject {
  // Appearance Properties
  PPKPageMode pageMode = PPKPageMode.automatic;
  PPKPageTransition pageTransition = PPKPageTransition.scrollPerSpread;
  bool firstPageAlwaysSingle = true;
  PPKSpreadFitting spreadFitting = PPKSpreadFitting.adaptive;
  bool clipToPageBoundaries = true;
  PPKEdgeInsets? additionalScrollViewFrameInsets = PPKEdgeInsets();
  PPKEdgeInsets? additionalContentInsets = PPKEdgeInsets();
  bool shadowEnabled = false;
  double shadowOpacity = 0.7;

  @JsonKey(fromJson: documentInfoFromJson, toJson: documentInfoToJson)
  PPKDocumentInfoViewConfiguration? documentInfoOptions;

  @JsonKey(fromJson: colorFromJson, toJson: colorToJson)
  Color? backgroundColor;
  PPKAppearanceMode allowedAppearanceModes = PPKAppearanceMode.all;

  // Scroll View Configuration
  PPKScrollDirection scrollDirection = PPKScrollDirection.horizontal;
  PPKScrollInsetAdjustment scrollViewInsetAdjustment = PPKScrollInsetAdjustment.fixedElements;
  double minimumZoomScale = 1.0;
  double maximumZoomScale = 20.0;
  PPKAdaptiveConditional documentViewLayoutDirectionalLock = PPKAdaptiveConditional.adaptive;

  // Page Border and Rendering
  bool renderAnimationEnabled = true;
  PPKRenderStatusViewPosition renderStatusViewPosition = PPKRenderStatusViewPosition.top;

  // Page Behavior
  PPKTapAction doubleTapAction = PPKTapAction.smartZoom;
  bool formElementZoomEnabled = false;
  bool scrollOnEdgeTapEnabled = true;
  bool animateScrollOnEdgeTaps = false;
  double scrollOnEdgeTapMargin = 44;

  // Page Actions
  PPKLinkAction linkAction = PPKLinkAction.externalBrowser;
  List<PPKTextSelectionMenuAction>? allowedMenuActions = [
    PPKTextSelectionMenuAction.search,
    PPKTextSelectionMenuAction.define,
    PPKTextSelectionMenuAction.speak,
    PPKTextSelectionMenuAction.share,
    PPKTextSelectionMenuAction.copy,
    PPKTextSelectionMenuAction.annotationCreation,
  ];

  // Features
  bool textSelectionEnabled = true;
  bool imageSelectionEnabled = true;
  PPKTextSelectionMode textSelectionMode = PPKTextSelectionMode.automatic;
  bool textSelectionShouldSnapToWord = false;
  List<PPKAnnotationType>? editableAnnotationTypes = [];
  PPKAnnotationType typesShowingColorPresets = PPKAnnotationType.all;
  // TODO: UNSUPPORTED Item (for now)
  // propertiesForAnnotations
  bool freeTextAccessoryViewEnabled = true;
  PPKBookmarkSortOrder bookmarkSortOrder = PPKBookmarkSortOrder.pageBased;
  PPKBookmarkIndicatorMode bookmarkIndicatorMode = PPKBookmarkIndicatorMode.off;
  bool bookmarkIndicatorInteractionEnabled = true;
  bool allowMultipleBookmarksPerPage = false;

  // User Interface Settings
  PPKUserInterfaceViewMode userInterfaceViewMode = PPKUserInterfaceViewMode.automaticNoFirstLastPage;
  PPKUserInterfaceViewAnimation userInterfaceViewAnimation = PPKUserInterfaceViewAnimation.fade;
  PPKPresentationHalfModalStyle halfModalStyle = PPKPresentationHalfModalStyle.card;
  PPKAdaptiveConditional documentLabelEnabled = PPKAdaptiveConditional.adaptive;
  bool pageLabelEnabled = false;
  bool shouldHideUserInterfaceOnPageChange = true;
  bool shouldShowUserInterfaceOnViewWillAppear = true;
  bool shouldAdjustDocumentInsetsByIncludingHomeIndicatorSafeAreaInsets = false;
  bool allowToolbarTitleChange = true;
  bool allowWindowTitleChange = false;
  bool shouldHideNavigationBarWithUserInterface = false;
  bool shouldHideStatusBar = false;
  bool shouldHideStatusBarWithUserInterface = true;
  bool shouldShowRedactionInfoButton = true;
  bool redactionUsageHintEnabled = true;

  // Action navigation
  bool showBackActionButton = true;
  bool showForwardActionButton = true;
  bool showBackForwardActionButtonLabels = true;

  // Thumbnail Settings
  PPKThumbnailBarMode thumbnailBarMode = PPKThumbnailBarMode.floatingScrubberBar;
  PPKScrubberBarType scrubberBarType = PPKScrubberBarType.horizontal;
  bool hideThumbnailBarForSinglePageDocuments = true;
  PPKThumbnailGrouping thumbnailGrouping = PPKThumbnailGrouping.automatic;
  PPKSize? thumbnailSize;
  double? thumbnailInteritemSpacing;
  double? thumbnailLineSpacing;
  PPKEdgeInsets? thumbnailMargin;

  // Annotation Settings
  double annotationAnimationDuration = 0.25;
  bool annotationGroupingEnabled = true;
  PPKMarkupAnnotationMergeBehavior markupAnnotationMergeBehavior = PPKMarkupAnnotationMergeBehavior.ifColorMatches;
  bool createAnnotationMenuEnabled = true;
  // TODO: Unsupported Feature for now
  // createAnnotationMenuGroups
  bool naturalDrawingAnnotationEnabled = false;
  int magicInkReplacementThreshold = 70;
  PPKDrawCreateMode drawCreateMode = PPKDrawCreateMode.automatic;
  bool shouldAskForAnnotationUsername = true;
  bool annotationEntersEditModeAfterSecondTapEnabled = true;
  bool shouldScrollToChangedPage = true;
  PPKSoundAnnotationPlayerStyle soundAnnotationPlayerStyle = PPKSoundAnnotationPlayerStyle.bottom;

  // Annotation Saving
  bool autosaveEnabled = true;
  bool allowBackgroundSaving = false;
  int soundAnnotationTimeLimit = 300; // seconds
  // TODO: Unsupported DFeature for now
  // soundAnnotationRecordingOptions

  // Search
  PPKSearchMode searchMode = PPKSearchMode.modal;
  double searchResultZoomScale = 1;

  // Signatures
  PPKSignatureSavingStrategy signatureSavingStrategy = PPKSignatureSavingStrategy.alwaysSave;
  PPKSignatureCertificateSelectionMode signatureCertificateSelectionMode = PPKSignatureCertificateSelectionMode.ifAvailable;
  PPKSignatureBiometricPropertiesOption signatureBiometricPropertiesOptions = PPKSignatureBiometricPropertiesOption.all;
  bool naturalSignatureDrawingEnabled = true;
  // TODO: Unsupported FEatures
  //   signatureCreationConfiguration
  //  signatureStore

  // Sharing
  @JsonKey(fromJson: documentSharingConfigurationFromJson, toJson: documentSharingConfigurationToJson)
  PPKDocumentSharingConfiguration? sharingConfigurations;

  PPKDocumentSharingDestination? selectedSharingDestination;

  /* **** UNSUPPORTED YET *****
  // Advanced Properties
  internalTapGesturesEnabled
  useParentNavigationBar
  shouldCacheThumbnails
  allowAnnotationZIndexMoves
  allowRemovingDigitalSignatures

  // Gallery Configuration
  galleryConfiguration

  // Drag and Drop
  dragAndDropConfiguration
  imageConfiguration
  documentEditorConfiguration
  signatureCreationConfiguration
  */

  String? documentPassword;
  int pageIndex = 0;
  String? toolbarTitle;
  List<PPKBarButtonItem>? rightBarButtonItems;
  List<PPKBarButtonItem>? leftBarButtonItems;
  PPKAppearanceMode appearanceMode = PPKAppearanceMode.deflt;

  List<PPKSettingsOption>? settingsOptions;

  PPKConfiguration({
    this.pageMode = PPKPageMode.automatic,
    this.pageTransition = PPKPageTransition.scrollPerSpread,
    this.firstPageAlwaysSingle = true,
    this.spreadFitting = PPKSpreadFitting.adaptive,
    this.clipToPageBoundaries = true,
    this.additionalScrollViewFrameInsets,
    this.additionalContentInsets,
    this.shadowEnabled = false,
    this.shadowOpacity = 0.7,
    this.backgroundColor,
    this.documentInfoOptions,
    this.allowedAppearanceModes = PPKAppearanceMode.all,
    this.scrollDirection = PPKScrollDirection.horizontal,
    this.scrollViewInsetAdjustment = PPKScrollInsetAdjustment.fixedElements,
    this.minimumZoomScale = 1.0,
    this.maximumZoomScale = 20.0,
    this.documentViewLayoutDirectionalLock = PPKAdaptiveConditional.adaptive,
    this.renderAnimationEnabled = true,
    this.renderStatusViewPosition = PPKRenderStatusViewPosition.top,
    this.doubleTapAction = PPKTapAction.smartZoom,
    this.formElementZoomEnabled = false,
    this.scrollOnEdgeTapEnabled = true,
    this.animateScrollOnEdgeTaps = false,
    this.scrollOnEdgeTapMargin = 44,
    this.linkAction = PPKLinkAction.externalBrowser,
    this.allowedMenuActions,
    this.textSelectionEnabled = true,
    this.imageSelectionEnabled = true,
    this.textSelectionMode = PPKTextSelectionMode.automatic,
    this.textSelectionShouldSnapToWord = false,
    this.editableAnnotationTypes,
    this.typesShowingColorPresets = PPKAnnotationType.all,
    this.freeTextAccessoryViewEnabled = true,
    this.bookmarkSortOrder = PPKBookmarkSortOrder.pageBased,
    this.bookmarkIndicatorMode = PPKBookmarkIndicatorMode.off,
    this.bookmarkIndicatorInteractionEnabled = true,
    this.allowMultipleBookmarksPerPage = false,
    this.userInterfaceViewMode = PPKUserInterfaceViewMode.automaticNoFirstLastPage,
    this.userInterfaceViewAnimation = PPKUserInterfaceViewAnimation.fade,
    this.halfModalStyle = PPKPresentationHalfModalStyle.card,
    this.documentLabelEnabled = PPKAdaptiveConditional.adaptive,
    this.pageLabelEnabled = false,
    this.shouldHideUserInterfaceOnPageChange = true,
    this.shouldShowUserInterfaceOnViewWillAppear = true,
    this.shouldAdjustDocumentInsetsByIncludingHomeIndicatorSafeAreaInsets = false,
    this.allowToolbarTitleChange = true,
    this.allowWindowTitleChange = false,
    this.shouldHideNavigationBarWithUserInterface = false,
    this.shouldHideStatusBar = false,
    this.shouldHideStatusBarWithUserInterface = true,
    this.shouldShowRedactionInfoButton = true,
    this.redactionUsageHintEnabled = true,
    this.showBackActionButton = true,
    this.showForwardActionButton = true,
    this.showBackForwardActionButtonLabels = true,
    this.thumbnailBarMode = PPKThumbnailBarMode.floatingScrubberBar,
    this.scrubberBarType = PPKScrubberBarType.horizontal,
    this.hideThumbnailBarForSinglePageDocuments = true,
    this.thumbnailGrouping = PPKThumbnailGrouping.automatic,
    this.thumbnailSize,
    this.thumbnailInteritemSpacing,
    this.thumbnailLineSpacing,
    this.thumbnailMargin,
    this.annotationAnimationDuration = 0.25,
    this.annotationGroupingEnabled = true,
    this.markupAnnotationMergeBehavior = PPKMarkupAnnotationMergeBehavior.ifColorMatches,
    this.createAnnotationMenuEnabled = true,
    this.naturalDrawingAnnotationEnabled = false,
    this.magicInkReplacementThreshold = 70,
    this.drawCreateMode = PPKDrawCreateMode.automatic,
    this.shouldAskForAnnotationUsername = true,
    this.annotationEntersEditModeAfterSecondTapEnabled = true,
    this.shouldScrollToChangedPage = true,
    this.soundAnnotationPlayerStyle = PPKSoundAnnotationPlayerStyle.bottom,
    this.autosaveEnabled = true,
    this.allowBackgroundSaving = false,
    this.soundAnnotationTimeLimit = 300,
    this.searchMode = PPKSearchMode.modal,
    this.searchResultZoomScale = 1,
    this.signatureSavingStrategy = PPKSignatureSavingStrategy.alwaysSave,
    this.signatureCertificateSelectionMode = PPKSignatureCertificateSelectionMode.ifAvailable,
    this.signatureBiometricPropertiesOptions = PPKSignatureBiometricPropertiesOption.all,
    this.naturalSignatureDrawingEnabled = true,
    this.sharingConfigurations,
    this.selectedSharingDestination,
    this.documentPassword,
    this.pageIndex = 0,
    this.toolbarTitle,
    this.rightBarButtonItems,
    this.leftBarButtonItems,
    this.appearanceMode = PPKAppearanceMode.deflt,
    this.settingsOptions,
  });

  factory PPKConfiguration.fromJson(Map<String, dynamic> json) => _$PPKConfigurationFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$PPKConfigurationToJson(this);

}
