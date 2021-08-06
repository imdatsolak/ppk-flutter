/*
 * **********************************************************************
 * PPK Flutter - A plugin to provide expanded Interface to PSPDFKit
 *
 * Copyright (c) 2021 Imdat Solak (imdat@solak.de)
 *
 * For license, check out LICENSE.txt in the root of this repository
 * **********************************************************************
 */

import Flutter
import UIKit
import PSPDFKit
import PSPDFKitUI

public class SwiftPpkFlutterPlugin: NSObject, FlutterPlugin {
    static var channel: FlutterMethodChannel?

    var pdfViewController: PDFViewController?
    public static func register(with registrar: FlutterPluginRegistrar) {
        let platformViewFactory = PPKPlatformViewFactory(withMessenger: registrar.messenger())
        registrar.register(platformViewFactory, withId: "de.solak.ppk-flutter.widget")

        SwiftPpkFlutterPlugin.channel = FlutterMethodChannel(name: "de.solak.ppk-flutter.global", binaryMessenger: registrar.messenger())
        if let channel = SwiftPpkFlutterPlugin.channel {
            let instance = SwiftPpkFlutterPlugin()
            registrar.addMethodCallDelegate(instance, channel: channel)
        }
    }

    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        var arguments: [String:Any]?

        if let args = call.arguments as? [String: Any] {
            arguments = args
        }
        switch call.method {
            case "pspdfkitVersion":
                result("iOS \(SDK.versionNumber)")
            case "setLicenseKey":
                if let arguments = arguments, let licenseKey = PPKArgumentConverter.licenseKey(fromArguments: arguments) {
                    SDK.setLicenseKey(licenseKey)
                }
            case "present":
                if let arguments = arguments {
                    self.presentGlobal(arguments, result: result)
                }
            case "presentWithWatermark":
                if let arguments = arguments {
                    self.presentGlobal(arguments, result: result)
                }
            default:
                PPKHelper.processMethod(call: call, result: result, forViewController: self.pdfViewController)
        }
    }

    private func presentGlobal(_ arguments: [String: Any], result: @escaping FlutterResult) {
        if let documentPath = PPKArgumentConverter.documentPath(fromArguments: arguments), documentPath.count > 0, let pdfDocument = PPKHelper.documentFrom(path: documentPath) {
            let configuration = PPKArgumentConverter.configuration(fromArguments: arguments)
            if let password = configuration.documentPassword {
                PPKHelper.unlock(document: pdfDocument, usingPassword: password)
            }
            let pdfViewController = PDFViewController(document: pdfDocument, configuration: configuration.pdfConfiguration)
            pdfViewController.appearanceModeManager.appearanceMode = configuration.appearanceMode
            pdfViewController.pageIndex = configuration.pageIndex
            pdfViewController.delegate = self
            if let documentInfoOptions = configuration.documentInfoOptions {
                pdfViewController.documentInfoCoordinator.availableControllerOptions = documentInfoOptions
            }
            PPKHelper.setLeftBarButtonItems(configuration.leftBarButtonItems, forViewController: pdfViewController)
            PPKHelper.setRightBarButtonItems(configuration.rightBarButtonItems, forViewController: pdfViewController)
            PPKHelper.setToolbarTitle(configuration.toolbarTitle, forViewController: pdfViewController)
            self.pdfViewController = pdfViewController
            let navController = PDFNavigationController(rootViewController: pdfViewController)
            navController.modalPresentationStyle = .fullScreen
            let presentingViewController = UIApplication.shared.delegate?.window??.rootViewController;
            presentingViewController?.present(navController, animated: false, completion: nil)
            result(true)
        } else {
            let error = FlutterError(code: "", message: "Document path may not be nil or empty", details: nil)
            result(error)
        }
    }
}

extension SwiftPpkFlutterPlugin: PDFViewControllerDelegate {
    public func pdfViewControllerWillDismiss(_ pdfController: PDFViewController) {
        SwiftPpkFlutterPlugin.channel?.invokeMethod("ppkViewWillDismiss", arguments: nil)
    }

    public func pdfViewControllerDidDismiss(_ pdfController: PDFViewController) {
        self.pdfViewController = nil
        SwiftPpkFlutterPlugin.channel?.invokeMethod("ppkViewDidDismiss", arguments: nil)
    }
}
