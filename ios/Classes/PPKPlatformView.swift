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

public class PPKPlatformView : NSObject, FlutterPlatformView {
    var platformViewId:  Int64
    var channel: FlutterMethodChannel
    weak var flutterViewController: FlutterViewController?
    var pdfViewController: PDFViewController
    var navigationController: PDFNavigationController

    init(withFrame frame: CGRect, viewIdentifier viewId: Int64, arguments args: Any?, messenger: FlutterBinaryMessenger) {
        let channelName = "de.solak.ppk-flutter.widget.\(viewId)"
        self.platformViewId = viewId
        self.channel = FlutterMethodChannel(name: channelName, binaryMessenger: messenger)
        self.navigationController = PDFNavigationController()
        if let fwc = UIApplication.shared.delegate?.window??.rootViewController as? FlutterViewController {
            self.flutterViewController = fwc
        }
        guard self.flutterViewController != nil else {
            NSLog("Error: no FlutterViewController")
            abort()
        }
        self.flutterViewController?.addChild(self.navigationController)
        self.flutterViewController?.view.addSubview(self.navigationController.view)
        self.navigationController.didMove(toParent: self.flutterViewController)
        self.pdfViewController = PDFViewController()
        self.navigationController.setViewControllers([self.pdfViewController], animated: false)
        super.init()
        self.channel.setMethodCallHandler(self.handleMethodCall)
    }

    public func view() -> UIView {
        return self.navigationController.view ?? UIView()
    }

    public func handleMethodCall(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        if (call.method == "initializePlatformView") {
            if let args = call.arguments as? [String:Any], let documentPath = args["document"] as? String, let document = PPKHelper.documentFrom(path: documentPath) {
                let configuration = PPKArgumentConverter.configuration(fromArguments: args)
                if let password = configuration.documentPassword {
                    PPKHelper.unlock(document: document, usingPassword: password)
                }
                self.pdfViewController = PDFViewController(document: document, configuration: configuration.pdfConfiguration)
                self.pdfViewController.appearanceModeManager.appearanceMode = configuration.appearanceMode
                self.pdfViewController.pageIndex = configuration.pageIndex
                self.pdfViewController.delegate = self
                if let documentInfoOptions = configuration.documentInfoOptions {
                    self.pdfViewController.documentInfoCoordinator.availableControllerOptions = documentInfoOptions
                }
                PPKHelper.setLeftBarButtonItems(configuration.leftBarButtonItems, forViewController: self.pdfViewController,
                                                usingConfiguration: configuration)
                PPKHelper.setRightBarButtonItems(configuration.rightBarButtonItems, forViewController: self.pdfViewController,
                                                 usingConfiguration: configuration)
                PPKHelper.setToolbarTitle(configuration.toolbarTitle, forViewController: self.pdfViewController)
                self.navigationController.setViewControllers([self.pdfViewController], animated: false)
                result(true)
            } else {
                let error = FlutterError(code: "", message: "Document path may not be nil or empty", details: nil)
                result(error)
            }
        } else {
            PPKHelper.handleMethodCall(call, withViewController: self.pdfViewController, result: result)
        }
    }

    private func cleanup() {
        self.pdfViewController.document = nil
        self.pdfViewController.view.removeFromSuperview()
        self.pdfViewController.removeFromParent()
        self.navigationController.navigationBar.removeFromSuperview()
        self.navigationController.view.removeFromSuperview()
        self.navigationController.removeFromParent()
    }

    deinit{
        self.cleanup()
    }
}

extension PPKPlatformView: PDFViewControllerDelegate {
    public func pdfViewControllerDidDismiss(_ pdfController: PDFViewController) {
        self.cleanup()
    }
}
