/* *****************************************************************************************************
   PPK Flutter - A plugin to provide expanded Interface to PSPDFKit

   Copyright (c) 2021 Imdat Solak (imdat@solak.de)

   For license, checkout LICENSE.txt in the root of this repository
*/

import Foundation
import PSPDFKit
import PSPDFKitUI

class PPKArgumentsConverter {
    static func documentPath(fromArguments arguments: [String: Any]) -> String? {
        if let documentPath = arguments["document"] as? String {
            return documentPath
        }
        return nil
    }

    static func configuration(fromArguments arguments: [String: Any]) -> PPKConfiguration {
        var isImageDocument = false
        if let path = PPKArgumentsConverter.documentPath(fromArguments: arguments) {
            isImageDocument = PPKArgumentsConverter.isImageDocument(path)
        }
        return PPKConfiguration(fromArguments: arguments, isImageDocument: isImageDocument)
    }

    static func documentInfoOptions(fromArguments arguments: [String: Any]) -> [DocumentInfoOption]? {
        return nil
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

}
