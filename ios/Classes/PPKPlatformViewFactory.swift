/* *****************************************************************************************************
   PPK Flutter - A plugin to provide expanded Interface to PSPDFKit

   Copyright (c) 2021 Imdat Solak (imdat@solak.de)

   For license, checkout LICENSE.txt in the root of this repository
*/

import Flutter
import UIKit
import PSPDFKit

public class PPKPlatformViewFactory : NSObject, FlutterPlatformViewFactory {
    var messenger: FlutterBinaryMessenger
    
    init(withMessenger m: FlutterBinaryMessenger) {
        self.messenger = m
        super.init()
    }
    
    public func create(withFrame frame: CGRect, viewIdentifier viewId: Int64, arguments args: Any?) -> FlutterPlatformView {
        return PPKPlatformView(withFrame: frame, viewIdentifier: viewId, arguments: args, messenger: self.messenger)
    }
}
