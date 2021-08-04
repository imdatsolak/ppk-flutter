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

class PPKArgumentConverter {
    static func documentPath(fromArguments arguments: [String: Any]) -> String? {
        if let documentPath = arguments["document"] as? String {
            return documentPath
        }
        return nil
    }

    static func configuration(fromArguments arguments: [String: Any]) -> PPKConfiguration {
        var isImageDocument = false
        if let path = PPKArgumentConverter.documentPath(fromArguments: arguments) {
            isImageDocument = PPKArgumentConverter.isImageDocument(path)
        }
        return PPKConfiguration(fromArguments: arguments, isImageDocument: isImageDocument)
    }

    static public func isImageDocument(_ documentPath: String) -> Bool {
        let url: URL?
        if (documentPath.starts(with: "/")) {
            url = URL(fileURLWithPath: documentPath)
        } else {
            url = Bundle.main.url(forResource: documentPath, withExtension: nil);
        }
        if let url = url {
            return PPKHelper.isImageDocument(url)
        }
        return false
    }

    static public func licenseKey(fromArguments arguments: [String: Any]) -> String? {
        if let licenseKey = arguments["licenseKey"] as? String {
            return licenseKey
        }
        return nil
    }
}
