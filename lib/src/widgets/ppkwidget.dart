///
///  Copyright © 2018-2021 PSPDFKit GmbH. All rights reserved.
///
///  THIS SOURCE CODE AND ANY ACCOMPANYING DOCUMENTATION ARE PROTECTED BY INTERNATIONAL COPYRIGHT LAW
///  AND MAY NOT BE RESOLD OR REDISTRIBUTED. USAGE IS BOUND TO THE PSPDFKIT LICENSE AGREEMENT.
///  UNAUTHORIZED REPRODUCTION OR DISTRIBUTION IS SUBJECT TO CIVIL AND CRIMINAL PENALTIES.
///  This notice may not be removed from this file.
///

import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ppk_flutter/src/views/ppkview.dart';

typedef PPKWidgetCreatedCallback = void Function(PPKView view);

/// This widget is currently only supported for iOS.
/// Support for Android is coming soon.
class PPKWidget extends StatefulWidget {
  final String documentPath;
  final dynamic configuration;
  final PPKWidgetCreatedCallback? onPPKWidgetCreated;

  PPKWidget({
    Key? key,
    required this.documentPath,
    this.configuration,
    this.onPPKWidgetCreated,
  }) : super(key: key);

  @override
  PPKWidgetState createState() => PPKWidgetState();
}

class PPKWidgetState extends State<PPKWidget> {
  late PPKView view;

  @override
  Widget build(BuildContext context) {
    if (defaultTargetPlatform == TargetPlatform.iOS) {
      return UiKitView(
        viewType: 'com.pspdfkit.widget',
        onPlatformViewCreated: onPlatformViewCreated,
        creationParamsCodec: const StandardMessageCodec(),
      );
    } else if (defaultTargetPlatform == TargetPlatform.android) {
      return AndroidView(
        viewType: 'com.pspdfkit.widget',
        onPlatformViewCreated: onPlatformViewCreated,
        creationParamsCodec: const StandardMessageCodec(),
      );
    } else {
      return Text('$defaultTargetPlatform is not yet supported by pspdfkit.');
    }
  }

  Future<void> onPlatformViewCreated(int id) async {
    view = PPKView.init(id, widget.documentPath, widget.configuration);
    if (widget.onPPKWidgetCreated != null) {
      widget.onPPKWidgetCreated!(view);
    }
  }
}
