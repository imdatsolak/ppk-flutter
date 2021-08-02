/* *****************************************************************************************************
   PPK Flutter - A plugin to provide expanded Interface to PSPDFKit

   Copyright (c) 2021 Imdat Solak (imdat@solak.de)

   For license, checkout LICENSE.txt in the root of this repository
*/

import Foundation
import PSPDFKit
import PSPDFKitUI

class PPKConfiguration {
    
    private let _configurationDictionary: [String: Any]
    private let _isImageDocument: Bool
    
    init(fromArguments arguments: [String: Any], isImageDocument: Bool = false) {
        if let cDict = arguments["configuration"] as? [String: Any] {
            _configurationDictionary = cDict
        } else {
            _configurationDictionary = [:]
        }
        _isImageDocument = isImageDocument
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
            return nil
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
