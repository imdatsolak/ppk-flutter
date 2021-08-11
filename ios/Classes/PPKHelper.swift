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
import Flutter
import PSPDFKit
import PSPDFKitUI

class PPKHelper {
    static public func processMethod(call: FlutterMethodCall, result: @escaping FlutterResult, forViewController: PDFViewController?) {

    }

    static public func documentFrom(path: String) -> Document? {
        let url: URL?
        if (path.starts(with: "/")) {
            url = URL(fileURLWithPath: path)
        } else {
            url = Bundle.main.url(forResource: path, withExtension: nil);
        }
        if let url = url {
            if PPKHelper.isImageDocument(url) {
                return ImageDocument(imageURL: url)
            } else {
                return Document(url: url)
            }
        }
        return nil
    }

    static public func isImageDocument(_ url: URL) -> Bool {
        let ext = url.pathExtension.lowercased()
        return ext == "png" || ext == "jpeg" || ext == "jpg";
    }

    static public func unlock(document: Document, usingPassword password: String) {
        if password.count > 0 {
            document.unlock(withPassword: password)
        }
    }

    static public func setToolbarTitle(_ title: String?, forViewController pdfViewController: PDFViewController) {
        if let title = title {
            pdfViewController.title = title
        }
    }

    static public func setLeftBarButtonItems(_ items: [String]?, forViewController pdfViewController: PDFViewController,
                                             usingConfiguration configuration: PPKConfiguration) {
        if let items = items {
            pdfViewController.navigationItem.setLeftBarButtonItems(PPKHelper.getBarButtonItems(items, forViewController: pdfViewController), animated: false)
        }
    }

    static public func setRightBarButtonItems(_ items: [String]?, forViewController pdfViewController: PDFViewController,
                                              usingConfiguration configuration: PPKConfiguration) {
        if let items = items {
            pdfViewController.navigationItem.setRightBarButtonItems(PPKHelper.getBarButtonItems(items, forViewController: pdfViewController), animated: false)
        }
    }

    static private func getBarButtonItems(_ items: [String], forViewController pdfViewController: PDFViewController,
                                          usingConfiguration configuration: PPKConfiguration) -> [UIBarButtonItem] {
        var barButtonItems: [UIBarButtonItem] = []
        for itemName in items {
            if let bbItem = barButtonItem(fromString: itemName, forViewController: pdfViewController) {
                if (configuration.tintColor != null) {
                    bbItem.tintColor = configuration.tintColor
                }
                barButtonItems.append(bbItem)
            }
        }
        return barButtonItems
    }

    static public func barButtonItem(fromString barButtonItemString: String, forViewController pdfViewController: PDFViewController) -> UIBarButtonItem? {
        switch (barButtonItemString) {
            case "closeButtonItem":
                return pdfViewController.closeButtonItem
            case "outlineButtonItem":
                return pdfViewController.outlineButtonItem;
            case "searchButtonItem":
                return pdfViewController.searchButtonItem;
            case "thumbnailsButtonItem":
                return pdfViewController.thumbnailsButtonItem;
            case "documentEditorButtonItem":
                return pdfViewController.documentEditorButtonItem;
            case "printButtonItem":
                return pdfViewController.printButtonItem;
            case "openInButtonItem":
                return pdfViewController.openInButtonItem;
            case "emailButtonItem":
                return pdfViewController.emailButtonItem;
            case "messageButtonItem":
                return pdfViewController.messageButtonItem;
            case "annotationButtonItem":
                return pdfViewController.annotationButtonItem;
            case "bookmarkButtonItem":
                return pdfViewController.bookmarkButtonItem;
            case "brightnessButtonItem":
                return pdfViewController.brightnessButtonItem;
            case "activityButtonItem":
                return pdfViewController.activityButtonItem;
            case "settingsButtonItem":
                return pdfViewController.settingsButtonItem;
            case "readerViewButtonItem":
                return pdfViewController.readerViewButtonItem;
            default:
                return nil
        }
    }

    static public func handleMethodCall(_ call: FlutterMethodCall, withViewController: PDFViewController, result: @escaping FlutterResult) {
        switch (call.method) {
            case "save":
                NSLog("Save")
            case "applyInstantJson":
                NSLog("applyInstantJson")
            case "exportInstantJson":
                NSLog("exportInstantJson")
            case "addAnnotation":
                NSLog("addAnnotation")
            case "removeAnnotation":
                NSLog("removeAnnotation")
            case "getAnnotations":
                NSLog("getAnnotations")
            case "exportXfdf":
                NSLog("exportXdfdf")
            case "processAnnotations":
                NSLog("processAnnotations")
            default:
                result(FlutterMethodNotImplemented)
        }
    }
}
