// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ppkconfiguration.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PPKConfiguration _$PPKConfigurationFromJson(Map<String, dynamic> json) {
  return PPKConfiguration(
    pageMode: _$enumDecode(_$PPKPageModeEnumMap, json['pageMode']),
    pageTransition:
        _$enumDecode(_$PPKPageTransitionEnumMap, json['pageTransition']),
    firstPageAlwaysSingle: json['firstPageAlwaysSingle'] as bool,
    spreadFitting:
        _$enumDecode(_$PPKSpreadFittingEnumMap, json['spreadFitting']),
    clipToPageBoundaries: json['clipToPageBoundaries'] as bool,
    additionalScrollViewFrameInsets: json['additionalScrollViewFrameInsets'] ==
            null
        ? null
        : PPKEdgeInsets.fromJson(
            json['additionalScrollViewFrameInsets'] as Map<String, dynamic>),
    additionalContentInsets: json['additionalContentInsets'] == null
        ? null
        : PPKEdgeInsets.fromJson(
            json['additionalContentInsets'] as Map<String, dynamic>),
    shadowEnabled: json['shadowEnabled'] as bool,
    shadowOpacity: (json['shadowOpacity'] as num).toDouble(),
    backgroundColor:
        colorFromJson(json['backgroundColor'] as Map<String, dynamic>?),
    documentInfoOptions: (json['documentInfoOptions'] as List<dynamic>?)
        ?.map((e) => _$enumDecode(_$PPKDocumentInfoViewOptionEnumMap, e))
        .toList(),
    allowedAppearanceModes: _$enumDecode(
        _$PPKAppearanceModeEnumMap, json['allowedAppearanceModes']),
    scrollDirection:
        _$enumDecode(_$PPKScrollDirectionEnumMap, json['scrollDirection']),
    scrollViewInsetAdjustment: _$enumDecode(
        _$PPKScrollInsetAdjustmentEnumMap, json['scrollViewInsetAdjustment']),
    minimumZoomScale: (json['minimumZoomScale'] as num).toDouble(),
    maximumZoomScale: (json['maximumZoomScale'] as num).toDouble(),
    documentViewLayoutDirectionalLock: _$enumDecode(
        _$PPKAdaptiveConditionalEnumMap,
        json['documentViewLayoutDirectionalLock']),
    renderAnimationEnabled: json['renderAnimationEnabled'] as bool,
    renderStatusViewPosition: _$enumDecode(
        _$PPKRenderStatusViewPositionEnumMap, json['renderStatusViewPosition']),
    doubleTapAction:
        _$enumDecode(_$PPKTapActionEnumMap, json['doubleTapAction']),
    formElementZoomEnabled: json['formElementZoomEnabled'] as bool,
    scrollOnEdgeTapEnabled: json['scrollOnEdgeTapEnabled'] as bool,
    animateScrollOnEdgeTaps: json['animateScrollOnEdgeTaps'] as bool,
    scrollOnEdgeTapMargin: json['scrollOnEdgeTapMargin'] as int,
    linkAction: _$enumDecode(_$PPKLinkActionEnumMap, json['linkAction']),
    allowedMenuActions: (json['allowedMenuActions'] as List<dynamic>?)
        ?.map((e) => _$enumDecode(_$PPKTextSelectionMenuActionEnumMap, e))
        .toList(),
    textSelectionEnabled: json['textSelectionEnabled'] as bool,
    imageSelectionEnabled: json['imageSelectionEnabled'] as bool,
    textSelectionMode:
        _$enumDecode(_$PPKTextSelectionModeEnumMap, json['textSelectionMode']),
    textSelectionShouldSnapToWord:
        json['textSelectionShouldSnapToWord'] as bool,
    editableAnnotationTypes: (json['editableAnnotationTypes'] as List<dynamic>?)
        ?.map((e) => _$enumDecode(_$PPKAnnotationTypeEnumMap, e))
        .toList(),
    typesShowingColorPresets: _$enumDecode(
        _$PPKAnnotationTypeEnumMap, json['typesShowingColorPresets']),
    freeTextAccessoryViewEnabled: json['freeTextAccessoryViewEnabled'] as bool,
    bookmarkSortOrder:
        _$enumDecode(_$PPKBookmarkSortOrderEnumMap, json['bookmarkSortOrder']),
    bookmarkIndicatorMode: _$enumDecode(
        _$PPKBookmarkIndicatorModeEnumMap, json['bookmarkIndicatorMode']),
    bookmarkIndicatorInteractionEnabled:
        json['bookmarkIndicatorInteractionEnabled'] as bool,
    allowMultipleBookmarksPerPage:
        json['allowMultipleBookmarksPerPage'] as bool,
    userInterfaceViewMode: _$enumDecode(
        _$PPKUserInterfaceViewModeEnumMap, json['userInterfaceViewMode']),
    userInterfaceViewAnimation: _$enumDecode(
        _$PPKUserInterfaceViewAnimationEnumMap,
        json['userInterfaceViewAnimation']),
    halfModalStyle: _$enumDecode(
        _$PPKPresentationHalfModalStyleEnumMap, json['halfModalStyle']),
    documentLabelEnabled: _$enumDecode(
        _$PPKAdaptiveConditionalEnumMap, json['documentLabelEnabled']),
    pageLabelEnabled: json['pageLabelEnabled'] as bool,
    shouldHideUserInterfaceOnPageChange:
        json['shouldHideUserInterfaceOnPageChange'] as bool,
    shouldShowUserInterfaceOnViewWillAppear:
        json['shouldShowUserInterfaceOnViewWillAppear'] as bool,
    shouldAdjustDocumentInsetsByIncludingHomeIndicatorSafeAreaInsets:
        json['shouldAdjustDocumentInsetsByIncludingHomeIndicatorSafeAreaInsets']
            as bool,
    allowToolbarTitleChange: json['allowToolbarTitleChange'] as bool,
    allowWindowTitleChange: json['allowWindowTitleChange'] as bool,
    shouldHideNavigationBarWithUserInterface:
        json['shouldHideNavigationBarWithUserInterface'] as bool,
    shouldHideStatusBar: json['shouldHideStatusBar'] as bool,
    shouldHideStatusBarWithUserInterface:
        json['shouldHideStatusBarWithUserInterface'] as bool,
    shouldShowRedactionInfoButton:
        json['shouldShowRedactionInfoButton'] as bool,
    redactionUsageHintEnabled: json['redactionUsageHintEnabled'] as bool,
    showBackActionButton: json['showBackActionButton'] as bool,
    showForwardActionButton: json['showForwardActionButton'] as bool,
    showBackForwardActionButtonLabels:
        json['showBackForwardActionButtonLabels'] as bool,
    thumbnailBarMode:
        _$enumDecode(_$PPKThumbnailBarModeEnumMap, json['thumbnailBarMode']),
    scrubberBarType:
        _$enumDecode(_$PPKScrubberBarTypeEnumMap, json['scrubberBarType']),
    hideThumbnailBarForSinglePageDocuments:
        json['hideThumbnailBarForSinglePageDocuments'] as bool,
    thumbnailGrouping:
        _$enumDecode(_$PPKThumbnailGroupingEnumMap, json['thumbnailGrouping']),
    thumbnailSize: json['thumbnailSize'] == null
        ? null
        : PPKSize.fromJson(json['thumbnailSize'] as Map<String, dynamic>),
    thumbnailInteritemSpacing: json['thumbnailInteritemSpacing'] as int?,
    thumbnailLineSpacing: json['thumbnailLineSpacing'] as int?,
    thumbnailMargin: json['thumbnailMargin'] == null
        ? null
        : PPKEdgeInsets.fromJson(
            json['thumbnailMargin'] as Map<String, dynamic>),
    annotationAnimationDuration:
        (json['annotationAnimationDuration'] as num).toDouble(),
    annotationGroupingEnabled: json['annotationGroupingEnabled'] as bool,
    markupAnnotationMergeBehavior: _$enumDecode(
        _$PPKMarkupAnnotationMergeBehaviorEnumMap,
        json['markupAnnotationMergeBehavior']),
    createAnnotationMenuEnabled: json['createAnnotationMenuEnabled'] as bool,
    naturalDrawingAnnotationEnabled:
        json['naturalDrawingAnnotationEnabled'] as bool,
    magicInkReplacementThreshold: json['magicInkReplacementThreshold'] as int,
    drawCreateMode:
        _$enumDecode(_$PPKDrawCreateModeEnumMap, json['drawCreateMode']),
    shouldAskForAnnotationUsername:
        json['shouldAskForAnnotationUsername'] as bool,
    annotationEntersEditModeAfterSecondTapEnabled:
        json['annotationEntersEditModeAfterSecondTapEnabled'] as bool,
    shouldScrollToChangedPage: json['shouldScrollToChangedPage'] as bool,
    soundAnnotationPlayerStyle: _$enumDecode(
        _$PPKSoundAnnotationPlayerStyleEnumMap,
        json['soundAnnotationPlayerStyle']),
    autosaveEnabled: json['autosaveEnabled'] as bool,
    allowBackgroundSaving: json['allowBackgroundSaving'] as bool,
    soundAnnotationTimeLimit: json['soundAnnotationTimeLimit'] as int,
    searchMode: _$enumDecode(_$PPKSearchModeEnumMap, json['searchMode']),
    searchResultZoomScale: (json['searchResultZoomScale'] as num).toDouble(),
    signatureSavingStrategy: _$enumDecode(
        _$PPKSignatureSavingStrategyEnumMap, json['signatureSavingStrategy']),
    signatureCertificateSelectionMode: _$enumDecode(
        _$PPKSignatureCertificateSelectionModeEnumMap,
        json['signatureCertificateSelectionMode']),
    signatureBiometricPropertiesOptions: _$enumDecode(
        _$PPKSignatureBiometricPropertiesOptionEnumMap,
        json['signatureBiometricPropertiesOptions']),
    naturalSignatureDrawingEnabled:
        json['naturalSignatureDrawingEnabled'] as bool,
    sharingConfigurations: documentSharingConfigurationFromJson(
        json['sharingConfigurations'] as Map<String, dynamic>?),
    selectedSharingDestination: _$enumDecodeNullable(
        _$PPKDocumentSharingDestinationEnumMap,
        json['selectedSharingDestination']),
    documentPassword: json['documentPassword'] as String?,
    pageIndex: json['pageIndex'] as int,
    toolbarTitle: json['toolbarTitle'] as String?,
    rightBarButtonItems: (json['rightBarButtonItems'] as List<dynamic>?)
        ?.map((e) => _$enumDecode(_$PPKBarButtonItemEnumMap, e))
        .toList(),
    leftBarButtonItems: (json['leftBarButtonItems'] as List<dynamic>?)
        ?.map((e) => _$enumDecode(_$PPKBarButtonItemEnumMap, e))
        .toList(),
    appearanceMode:
        _$enumDecode(_$PPKAppearanceModeEnumMap, json['appearanceMode']),
    settingsOptions: (json['settingsOptions'] as List<dynamic>?)
        ?.map((e) => _$enumDecode(_$PPKSettingsOptionEnumMap, e))
        .toList(),
    formEditingEnabled: json['formEditingEnabled'] as bool,
    navigationButtonsEnabled: json['navigationButtonsEnabled'] as bool,
    pageNumberOverlayEnabled: json['pageNumberOverlayEnabled'] as bool,
    startZoomScale: (json['startZoomScale'] as num?)?.toDouble(),
    copyPasteEnabled: json['copyPasteEnabled'] as bool?,
    bookmarkEditingEnabled: json['bookmarkEditingEnabled'] as bool?,
    documentInfoViewEnabled: json['documentInfoViewEnabled'] as bool?,
    outlineViewEnabled: json['outlineViewEnabled'] as bool?,
    searchEnabled: json['searchEnabled'] as bool?,
    documentEditingEnabled: json['documentEditingEnabled'] as bool?,
    documentTitleOverlayEnabled: json['documentTitleOverlayEnabled'] as bool?,
    settingsEnabled: json['settingsEnabled'] as bool?,
    thumbnailBarEnabled: json['thumbnailBarEnabled'] as bool?,
    printingEnabled: json['printingEnabled'] as bool?,
    sharingEnabled: json['sharingEnabled'] as bool?,
    annotationListEnabled: json['annotationListEnabled'] as bool?,
    barButtonColor:
        colorFromJson(json['barButtonColor'] as Map<String, dynamic>?),
    themeName: json['themeName'] as String?,
    darkThemeName: json['darkThemeName'] as String?,
    theme: _$enumDecodeNullable(_$PPKAppearanceModeEnumMap, json['theme']),
  );
}

Map<String, dynamic> _$PPKConfigurationToJson(PPKConfiguration instance) {
  final val = <String, dynamic>{
    'pageMode': _$PPKPageModeEnumMap[instance.pageMode],
    'pageTransition': _$PPKPageTransitionEnumMap[instance.pageTransition],
    'firstPageAlwaysSingle': instance.firstPageAlwaysSingle,
    'spreadFitting': _$PPKSpreadFittingEnumMap[instance.spreadFitting],
    'clipToPageBoundaries': instance.clipToPageBoundaries,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('additionalScrollViewFrameInsets',
      instance.additionalScrollViewFrameInsets?.toJson());
  writeNotNull(
      'additionalContentInsets', instance.additionalContentInsets?.toJson());
  val['shadowEnabled'] = instance.shadowEnabled;
  val['shadowOpacity'] = instance.shadowOpacity;
  writeNotNull(
      'documentInfoOptions',
      instance.documentInfoOptions
          ?.map((e) => _$PPKDocumentInfoViewOptionEnumMap[e])
          .toList());
  writeNotNull('backgroundColor', colorToJson(instance.backgroundColor));
  val['allowedAppearanceModes'] =
      _$PPKAppearanceModeEnumMap[instance.allowedAppearanceModes];
  val['scrollDirection'] =
      _$PPKScrollDirectionEnumMap[instance.scrollDirection];
  val['scrollViewInsetAdjustment'] =
      _$PPKScrollInsetAdjustmentEnumMap[instance.scrollViewInsetAdjustment];
  val['minimumZoomScale'] = instance.minimumZoomScale;
  val['maximumZoomScale'] = instance.maximumZoomScale;
  val['documentViewLayoutDirectionalLock'] = _$PPKAdaptiveConditionalEnumMap[
      instance.documentViewLayoutDirectionalLock];
  val['renderAnimationEnabled'] = instance.renderAnimationEnabled;
  val['renderStatusViewPosition'] =
      _$PPKRenderStatusViewPositionEnumMap[instance.renderStatusViewPosition];
  val['doubleTapAction'] = _$PPKTapActionEnumMap[instance.doubleTapAction];
  val['formElementZoomEnabled'] = instance.formElementZoomEnabled;
  val['scrollOnEdgeTapEnabled'] = instance.scrollOnEdgeTapEnabled;
  val['animateScrollOnEdgeTaps'] = instance.animateScrollOnEdgeTaps;
  val['scrollOnEdgeTapMargin'] = instance.scrollOnEdgeTapMargin;
  val['linkAction'] = _$PPKLinkActionEnumMap[instance.linkAction];
  writeNotNull(
      'allowedMenuActions',
      instance.allowedMenuActions
          ?.map((e) => _$PPKTextSelectionMenuActionEnumMap[e])
          .toList());
  val['textSelectionEnabled'] = instance.textSelectionEnabled;
  val['imageSelectionEnabled'] = instance.imageSelectionEnabled;
  val['textSelectionMode'] =
      _$PPKTextSelectionModeEnumMap[instance.textSelectionMode];
  val['textSelectionShouldSnapToWord'] = instance.textSelectionShouldSnapToWord;
  writeNotNull(
      'editableAnnotationTypes',
      instance.editableAnnotationTypes
          ?.map((e) => _$PPKAnnotationTypeEnumMap[e])
          .toList());
  val['typesShowingColorPresets'] =
      _$PPKAnnotationTypeEnumMap[instance.typesShowingColorPresets];
  val['freeTextAccessoryViewEnabled'] = instance.freeTextAccessoryViewEnabled;
  val['bookmarkSortOrder'] =
      _$PPKBookmarkSortOrderEnumMap[instance.bookmarkSortOrder];
  val['bookmarkIndicatorMode'] =
      _$PPKBookmarkIndicatorModeEnumMap[instance.bookmarkIndicatorMode];
  val['bookmarkIndicatorInteractionEnabled'] =
      instance.bookmarkIndicatorInteractionEnabled;
  val['allowMultipleBookmarksPerPage'] = instance.allowMultipleBookmarksPerPage;
  val['userInterfaceViewMode'] =
      _$PPKUserInterfaceViewModeEnumMap[instance.userInterfaceViewMode];
  val['userInterfaceViewAnimation'] = _$PPKUserInterfaceViewAnimationEnumMap[
      instance.userInterfaceViewAnimation];
  val['halfModalStyle'] =
      _$PPKPresentationHalfModalStyleEnumMap[instance.halfModalStyle];
  val['documentLabelEnabled'] =
      _$PPKAdaptiveConditionalEnumMap[instance.documentLabelEnabled];
  val['pageLabelEnabled'] = instance.pageLabelEnabled;
  val['shouldHideUserInterfaceOnPageChange'] =
      instance.shouldHideUserInterfaceOnPageChange;
  val['shouldShowUserInterfaceOnViewWillAppear'] =
      instance.shouldShowUserInterfaceOnViewWillAppear;
  val['shouldAdjustDocumentInsetsByIncludingHomeIndicatorSafeAreaInsets'] =
      instance.shouldAdjustDocumentInsetsByIncludingHomeIndicatorSafeAreaInsets;
  val['allowToolbarTitleChange'] = instance.allowToolbarTitleChange;
  val['allowWindowTitleChange'] = instance.allowWindowTitleChange;
  val['shouldHideNavigationBarWithUserInterface'] =
      instance.shouldHideNavigationBarWithUserInterface;
  val['shouldHideStatusBar'] = instance.shouldHideStatusBar;
  val['shouldHideStatusBarWithUserInterface'] =
      instance.shouldHideStatusBarWithUserInterface;
  val['shouldShowRedactionInfoButton'] = instance.shouldShowRedactionInfoButton;
  val['redactionUsageHintEnabled'] = instance.redactionUsageHintEnabled;
  val['showBackActionButton'] = instance.showBackActionButton;
  val['showForwardActionButton'] = instance.showForwardActionButton;
  val['showBackForwardActionButtonLabels'] =
      instance.showBackForwardActionButtonLabels;
  val['thumbnailBarMode'] =
      _$PPKThumbnailBarModeEnumMap[instance.thumbnailBarMode];
  val['scrubberBarType'] =
      _$PPKScrubberBarTypeEnumMap[instance.scrubberBarType];
  val['hideThumbnailBarForSinglePageDocuments'] =
      instance.hideThumbnailBarForSinglePageDocuments;
  val['thumbnailGrouping'] =
      _$PPKThumbnailGroupingEnumMap[instance.thumbnailGrouping];
  writeNotNull('thumbnailSize', instance.thumbnailSize?.toJson());
  writeNotNull('thumbnailInteritemSpacing', instance.thumbnailInteritemSpacing);
  writeNotNull('thumbnailLineSpacing', instance.thumbnailLineSpacing);
  writeNotNull('thumbnailMargin', instance.thumbnailMargin?.toJson());
  val['annotationAnimationDuration'] = instance.annotationAnimationDuration;
  val['annotationGroupingEnabled'] = instance.annotationGroupingEnabled;
  val['markupAnnotationMergeBehavior'] =
      _$PPKMarkupAnnotationMergeBehaviorEnumMap[
          instance.markupAnnotationMergeBehavior];
  val['createAnnotationMenuEnabled'] = instance.createAnnotationMenuEnabled;
  val['naturalDrawingAnnotationEnabled'] =
      instance.naturalDrawingAnnotationEnabled;
  val['magicInkReplacementThreshold'] = instance.magicInkReplacementThreshold;
  val['drawCreateMode'] = _$PPKDrawCreateModeEnumMap[instance.drawCreateMode];
  val['shouldAskForAnnotationUsername'] =
      instance.shouldAskForAnnotationUsername;
  val['annotationEntersEditModeAfterSecondTapEnabled'] =
      instance.annotationEntersEditModeAfterSecondTapEnabled;
  val['shouldScrollToChangedPage'] = instance.shouldScrollToChangedPage;
  val['soundAnnotationPlayerStyle'] = _$PPKSoundAnnotationPlayerStyleEnumMap[
      instance.soundAnnotationPlayerStyle];
  val['autosaveEnabled'] = instance.autosaveEnabled;
  val['allowBackgroundSaving'] = instance.allowBackgroundSaving;
  val['soundAnnotationTimeLimit'] = instance.soundAnnotationTimeLimit;
  val['searchMode'] = _$PPKSearchModeEnumMap[instance.searchMode];
  val['searchResultZoomScale'] = instance.searchResultZoomScale;
  val['signatureSavingStrategy'] =
      _$PPKSignatureSavingStrategyEnumMap[instance.signatureSavingStrategy];
  val['signatureCertificateSelectionMode'] =
      _$PPKSignatureCertificateSelectionModeEnumMap[
          instance.signatureCertificateSelectionMode];
  val['signatureBiometricPropertiesOptions'] =
      _$PPKSignatureBiometricPropertiesOptionEnumMap[
          instance.signatureBiometricPropertiesOptions];
  val['naturalSignatureDrawingEnabled'] =
      instance.naturalSignatureDrawingEnabled;
  writeNotNull('sharingConfigurations',
      documentSharingConfigurationToJson(instance.sharingConfigurations));
  writeNotNull(
      'selectedSharingDestination',
      _$PPKDocumentSharingDestinationEnumMap[
          instance.selectedSharingDestination]);
  writeNotNull('documentPassword', instance.documentPassword);
  val['pageIndex'] = instance.pageIndex;
  writeNotNull('toolbarTitle', instance.toolbarTitle);
  writeNotNull(
      'rightBarButtonItems',
      instance.rightBarButtonItems
          ?.map((e) => _$PPKBarButtonItemEnumMap[e])
          .toList());
  writeNotNull(
      'leftBarButtonItems',
      instance.leftBarButtonItems
          ?.map((e) => _$PPKBarButtonItemEnumMap[e])
          .toList());
  val['appearanceMode'] = _$PPKAppearanceModeEnumMap[instance.appearanceMode];
  writeNotNull(
      'settingsOptions',
      instance.settingsOptions
          ?.map((e) => _$PPKSettingsOptionEnumMap[e])
          .toList());
  val['formEditingEnabled'] = instance.formEditingEnabled;
  val['navigationButtonsEnabled'] = instance.navigationButtonsEnabled;
  val['pageNumberOverlayEnabled'] = instance.pageNumberOverlayEnabled;
  writeNotNull('startZoomScale', instance.startZoomScale);
  writeNotNull('copyPasteEnabled', instance.copyPasteEnabled);
  writeNotNull('bookmarkEditingEnabled', instance.bookmarkEditingEnabled);
  writeNotNull('documentInfoViewEnabled', instance.documentInfoViewEnabled);
  writeNotNull('outlineViewEnabled', instance.outlineViewEnabled);
  writeNotNull('searchEnabled', instance.searchEnabled);
  writeNotNull('documentEditingEnabled', instance.documentEditingEnabled);
  writeNotNull(
      'documentTitleOverlayEnabled', instance.documentTitleOverlayEnabled);
  writeNotNull('settingsEnabled', instance.settingsEnabled);
  writeNotNull('thumbnailBarEnabled', instance.thumbnailBarEnabled);
  writeNotNull('printingEnabled', instance.printingEnabled);
  writeNotNull('sharingEnabled', instance.sharingEnabled);
  writeNotNull('annotationListEnabled', instance.annotationListEnabled);
  writeNotNull('barButtonColor', colorToJson(instance.barButtonColor));
  writeNotNull('themeName', instance.themeName);
  writeNotNull('darkThemeName', instance.darkThemeName);
  val['theme'] = _$PPKAppearanceModeEnumMap[instance.theme];
  return val;
}

K _$enumDecode<K, V>(
  Map<K, V> enumValues,
  Object? source, {
  K? unknownValue,
}) {
  if (source == null) {
    throw ArgumentError(
      'A value must be provided. Supported values: '
      '${enumValues.values.join(', ')}',
    );
  }

  return enumValues.entries.singleWhere(
    (e) => e.value == source,
    orElse: () {
      if (unknownValue == null) {
        throw ArgumentError(
          '`$source` is not one of the supported values: '
          '${enumValues.values.join(', ')}',
        );
      }
      return MapEntry(unknownValue, enumValues.values.first);
    },
  ).key;
}

const _$PPKPageModeEnumMap = {
  PPKPageMode.single: 'single',
  PPKPageMode.double: 'double',
  PPKPageMode.automatic: 'automatic',
};

const _$PPKPageTransitionEnumMap = {
  PPKPageTransition.scrollPerSpread: 'scrollPerSpread',
  PPKPageTransition.scrollContinuous: 'scrollContinuous',
  PPKPageTransition.curl: 'curl',
};

const _$PPKSpreadFittingEnumMap = {
  PPKSpreadFitting.fit: 'fit',
  PPKSpreadFitting.fill: 'fill',
  PPKSpreadFitting.adaptive: 'adaptive',
};

const _$PPKDocumentInfoViewOptionEnumMap = {
  PPKDocumentInfoViewOption.outline: 'outline',
  PPKDocumentInfoViewOption.annotations: 'annotations',
  PPKDocumentInfoViewOption.embeddedFiles: 'embeddedFiles',
  PPKDocumentInfoViewOption.bookmarks: 'bookmarks',
  PPKDocumentInfoViewOption.documentInfo: 'documentInfo',
  PPKDocumentInfoViewOption.security: 'security',
};

const _$PPKAppearanceModeEnumMap = {
  PPKAppearanceMode.deflt: 'deflt',
  PPKAppearanceMode.sepia: 'sepia',
  PPKAppearanceMode.night: 'night',
  PPKAppearanceMode.all: 'all',
};

const _$PPKScrollDirectionEnumMap = {
  PPKScrollDirection.horizontal: 'horizontal',
  PPKScrollDirection.vertical: 'vertical',
};

const _$PPKScrollInsetAdjustmentEnumMap = {
  PPKScrollInsetAdjustment.none: 'none',
  PPKScrollInsetAdjustment.fixedElements: 'fixedElements',
  PPKScrollInsetAdjustment.allElements: 'allElements',
};

const _$PPKAdaptiveConditionalEnumMap = {
  PPKAdaptiveConditional.no: 'no',
  PPKAdaptiveConditional.yes: 'yes',
  PPKAdaptiveConditional.adaptive: 'adaptive',
};

const _$PPKRenderStatusViewPositionEnumMap = {
  PPKRenderStatusViewPosition.top: 'top',
  PPKRenderStatusViewPosition.centered: 'centered',
};

const _$PPKTapActionEnumMap = {
  PPKTapAction.none: 'none',
  PPKTapAction.zoom: 'zoom',
  PPKTapAction.smartZoom: 'smartZoom',
};

const _$PPKLinkActionEnumMap = {
  PPKLinkAction.none: 'none',
  PPKLinkAction.alertView: 'alertView',
  PPKLinkAction.externalBrowser: 'externalBrowser',
  PPKLinkAction.inlineBrowser: 'inlineBrowser',
  PPKLinkAction.inlineWebViewController: 'inlineWebViewController',
};

const _$PPKTextSelectionMenuActionEnumMap = {
  PPKTextSelectionMenuAction.none: 'none',
  PPKTextSelectionMenuAction.search: 'search',
  PPKTextSelectionMenuAction.define: 'define',
  PPKTextSelectionMenuAction.wikipedia: 'wikipedia',
  PPKTextSelectionMenuAction.speak: 'speak',
  PPKTextSelectionMenuAction.share: 'share',
  PPKTextSelectionMenuAction.copy: 'copy',
  PPKTextSelectionMenuAction.markup: 'markup',
  PPKTextSelectionMenuAction.redact: 'redact',
  PPKTextSelectionMenuAction.createLink: 'createLink',
  PPKTextSelectionMenuAction.annotationCreation: 'annotationCreation',
  PPKTextSelectionMenuAction.all: 'all',
};

const _$PPKTextSelectionModeEnumMap = {
  PPKTextSelectionMode.regular: 'regular',
  PPKTextSelectionMode.simple: 'simple',
  PPKTextSelectionMode.automatic: 'automatic',
};

const _$PPKAnnotationTypeEnumMap = {
  PPKAnnotationType.link: 'link',
  PPKAnnotationType.highlight: 'highlight',
  PPKAnnotationType.strikeOut: 'strikeOut',
  PPKAnnotationType.underline: 'underline',
  PPKAnnotationType.squiggly: 'squiggly',
  PPKAnnotationType.note: 'note',
  PPKAnnotationType.freeText: 'freeText',
  PPKAnnotationType.ink: 'ink',
  PPKAnnotationType.square: 'square',
  PPKAnnotationType.circle: 'circle',
  PPKAnnotationType.line: 'line',
  PPKAnnotationType.polygon: 'polygon',
  PPKAnnotationType.polyLine: 'polyLine',
  PPKAnnotationType.stamp: 'stamp',
  PPKAnnotationType.sound: 'sound',
  PPKAnnotationType.redaction: 'redaction',
  PPKAnnotationType.widget: 'widget',
  PPKAnnotationType.file: 'file',
  PPKAnnotationType.richMedia: 'richMedia',
  PPKAnnotationType.screen: 'screen',
  PPKAnnotationType.caret: 'caret',
  PPKAnnotationType.popup: 'popup',
  PPKAnnotationType.watermark: 'watermark',
  PPKAnnotationType.trapNet: 'trapNet',
  PPKAnnotationType.threeD: 'threeD',
  PPKAnnotationType.all: 'all',
};

const _$PPKBookmarkSortOrderEnumMap = {
  PPKBookmarkSortOrder.custom: 'custom',
  PPKBookmarkSortOrder.pageBased: 'pageBased',
};

const _$PPKBookmarkIndicatorModeEnumMap = {
  PPKBookmarkIndicatorMode.off: 'off',
  PPKBookmarkIndicatorMode.alwaysOn: 'alwaysOn',
  PPKBookmarkIndicatorMode.onWhenBookmarked: 'onWhenBookmarked',
};

const _$PPKUserInterfaceViewModeEnumMap = {
  PPKUserInterfaceViewMode.always: 'always',
  PPKUserInterfaceViewMode.automatic: 'automatic',
  PPKUserInterfaceViewMode.automaticNoFirstLastPage: 'automaticNoFirstLastPage',
  PPKUserInterfaceViewMode.never: 'never',
};

const _$PPKUserInterfaceViewAnimationEnumMap = {
  PPKUserInterfaceViewAnimation.none: 'none',
  PPKUserInterfaceViewAnimation.fade: 'fade',
  PPKUserInterfaceViewAnimation.slide: 'slide',
};

const _$PPKPresentationHalfModalStyleEnumMap = {
  PPKPresentationHalfModalStyle.card: 'card',
  PPKPresentationHalfModalStyle.system: 'system',
};

const _$PPKThumbnailBarModeEnumMap = {
  PPKThumbnailBarMode.none: 'none',
  PPKThumbnailBarMode.scrubberBar: 'scrubberBar',
  PPKThumbnailBarMode.scrollable: 'scrollable',
  PPKThumbnailBarMode.floatingScrubberBar: 'floatingScrubberBar',
};

const _$PPKScrubberBarTypeEnumMap = {
  PPKScrubberBarType.horizontal: 'horizontal',
  PPKScrubberBarType.verticalLeft: 'verticalLeft',
  PPKScrubberBarType.verticalRight: 'verticalRight',
};

const _$PPKThumbnailGroupingEnumMap = {
  PPKThumbnailGrouping.automatic: 'automatic',
  PPKThumbnailGrouping.never: 'never',
  PPKThumbnailGrouping.always: 'always',
};

const _$PPKMarkupAnnotationMergeBehaviorEnumMap = {
  PPKMarkupAnnotationMergeBehavior.never: 'never',
  PPKMarkupAnnotationMergeBehavior.ifColorMatches: 'ifColorMatches',
};

const _$PPKDrawCreateModeEnumMap = {
  PPKDrawCreateMode.separate: 'separate',
  PPKDrawCreateMode.mergeIfPossible: 'mergeIfPossible',
  PPKDrawCreateMode.automatic: 'automatic',
};

const _$PPKSoundAnnotationPlayerStyleEnumMap = {
  PPKSoundAnnotationPlayerStyle.inline: 'inline',
  PPKSoundAnnotationPlayerStyle.bottom: 'bottom',
};

const _$PPKSearchModeEnumMap = {
  PPKSearchMode.modal: 'modal',
  PPKSearchMode.inline: 'inline',
};

const _$PPKSignatureSavingStrategyEnumMap = {
  PPKSignatureSavingStrategy.alwaysSave: 'alwaysSave',
  PPKSignatureSavingStrategy.neverSave: 'neverSave',
  PPKSignatureSavingStrategy.saveIfSelected: 'saveIfSelected',
};

const _$PPKSignatureCertificateSelectionModeEnumMap = {
  PPKSignatureCertificateSelectionMode.always: 'always',
  PPKSignatureCertificateSelectionMode.never: 'never',
  PPKSignatureCertificateSelectionMode.ifAvailable: 'ifAvailable',
};

const _$PPKSignatureBiometricPropertiesOptionEnumMap = {
  PPKSignatureBiometricPropertiesOption.none: 'none',
  PPKSignatureBiometricPropertiesOption.pressure: 'pressure',
  PPKSignatureBiometricPropertiesOption.timePoints: 'timePoints',
  PPKSignatureBiometricPropertiesOption.touchRadius: 'touchRadius',
  PPKSignatureBiometricPropertiesOption.inputMethod: 'inputMethod',
  PPKSignatureBiometricPropertiesOption.all: 'all',
};

K? _$enumDecodeNullable<K, V>(
  Map<K, V> enumValues,
  dynamic source, {
  K? unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<K, V>(enumValues, source, unknownValue: unknownValue);
}

const _$PPKDocumentSharingDestinationEnumMap = {
  PPKDocumentSharingDestination.print: 'print',
  PPKDocumentSharingDestination.export: 'export',
  PPKDocumentSharingDestination.activity: 'activity',
  PPKDocumentSharingDestination.messages: 'messages',
  PPKDocumentSharingDestination.email: 'email',
  PPKDocumentSharingDestination.otherApplicaiton: 'otherApplicaiton',
};

const _$PPKBarButtonItemEnumMap = {
  PPKBarButtonItem.closeButtonItem: 'closeButtonItem',
  PPKBarButtonItem.outlineButtonItem: 'outlineButtonItem',
  PPKBarButtonItem.searchButtonItem: 'searchButtonItem',
  PPKBarButtonItem.thumbnailsButtonItem: 'thumbnailsButtonItem',
  PPKBarButtonItem.documentEditorButtonItem: 'documentEditorButtonItem',
  PPKBarButtonItem.printButtonItem: 'printButtonItem',
  PPKBarButtonItem.openInButtonItem: 'openInButtonItem',
  PPKBarButtonItem.emailButtonItem: 'emailButtonItem',
  PPKBarButtonItem.messageButtonItem: 'messageButtonItem',
  PPKBarButtonItem.annotationButtonItem: 'annotationButtonItem',
  PPKBarButtonItem.bookmarkButtonItem: 'bookmarkButtonItem',
  PPKBarButtonItem.brightnessButtonItem: 'brightnessButtonItem',
  PPKBarButtonItem.activityButtonItem: 'activityButtonItem',
  PPKBarButtonItem.settingsButtonItem: 'settingsButtonItem',
  PPKBarButtonItem.readerViewButtonItem: 'readerViewButtonItem',
};

const _$PPKSettingsOptionEnumMap = {
  PPKSettingsOption.theme: 'theme',
  PPKSettingsOption.appearance: 'appearance',
  PPKSettingsOption.scrollDirection: 'scrollDirection',
  PPKSettingsOption.pageTransition: 'pageTransition',
  PPKSettingsOption.brightness: 'brightness',
  PPKSettingsOption.pageMode: 'pageMode',
  PPKSettingsOption.spreadFitting: 'spreadFitting',
  PPKSettingsOption.deflt: 'deflt',
  PPKSettingsOption.screenAwake: 'screenAwake',
  PPKSettingsOption.all: 'all',
};
