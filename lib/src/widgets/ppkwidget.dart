/*
 * **********************************************************************
 * PPK Flutter - A plugin to provide expanded Interface to PSPDFKit
 *
 * Copyright (c) 2021 Imdat Solak (imdat@solak.de)
 *
 * For license, check out LICENSE.txt in the root of this repository
 * **********************************************************************
 * Based on code from github.com/PSPDFKit/pspdfkit_flutter
 */


import "dart:async";
import "dart:io";

import "package:flutter/cupertino.dart";
import "package:flutter/foundation.dart";
import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:ppk_flutter/ppk_flutter.dart";

typedef PPKWidgetCreatedCallback = void Function(PPKViewProxy view);

class PPKWidget extends StatefulWidget {
  final String documentPath;
  final PPKConfiguration? configuration;
  final PPKWidgetCreatedCallback? onWidgetCreated;

  PPKWidget({
    Key? key,
    required this.documentPath,
    this.configuration,
    this.onWidgetCreated,
  }) : super(key: key);

  @override
  PPKWidgetState createState() => PPKWidgetState();
}

class PPKWidgetState extends State<PPKWidget> {
  late PPKViewProxy viewProxy;

  Future<void> _onPlatformViewCreated(int id) async {
    viewProxy = PPKViewProxy.init(id, widget.documentPath, configuration: widget.configuration);
    if (widget.onWidgetCreated != null) {
      widget.onWidgetCreated!(viewProxy);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return UiKitView(
        viewType: "de.solak.ppk-flutter.widget",
        onPlatformViewCreated: _onPlatformViewCreated,
        creationParamsCodec: const StandardMessageCodec(),
      );
    } else if (Platform.isAndroid) {
      return AndroidView(
        viewType: "de.solak.ppk-flutter.widget",
        onPlatformViewCreated: _onPlatformViewCreated,
        creationParamsCodec: const StandardMessageCodec(),
      );
    } else {
      return Text("$defaultTargetPlatform is not yet supported by pspdfkit.");
    }
  }
}
