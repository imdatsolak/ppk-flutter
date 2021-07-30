/* *****************************************************************************************************
   PPK Flutter - A plugin to provide expanded Interface to PSPDFKit

   Copyright (c) 2021 Imdat Solak (imdat@solak.de)

   For license, checkout LICENSE.txt in the root of this repository
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
            case "frameworkVersion":
                result("iOS \(SDK.versionNumber)")
            case "setLicenseKey":
                if let arguments = arguments, let licenseKey = arguments["licenseKey"] as? String {
                    SDK.setLicenseKey(licenseKey)
                }
            case "present":
                if let arguments = arguments {
                    self.presentGlobal(arguments)
                }
            default:
                PPKHelper.processMethod(call: call, result: result, forViewController: self.pdfViewController)
        }
    }

    private func presentGlobal(_ arguments: [String: Any]) {
        if let documentPath = PPKArgumentsConverter.documentPath(fromArguments: arguments), documentPath.count > 0 {
            let configuration = PPKArgumentsConverter.configuration(fromArguments: arguments)
            if let pdfDocument = PPKHelper.documentFrom(path: documentPath) {
                if let password = configuration.documentPassword {
                    PPKHelper.unlock(document: pdfDocument, usingPassword: password)
                }
                self.pdfViewController = PDFViewController(document: pdfDocument, configuration: configuration.pdfConfiguration)
                self.pdfViewController?.appearanceModeManager.appearanceMode = configuration.appearanceMode
                self.pdfViewController?.pageIndex = configuration.pageIndex
                self.pdfViewController?.delegate = self
                if let documentInfoOptions = PPKArgumentsConverter.documentInfoOptions(fromArguments: arguments) {
                    self.pdfViewController?.documentInfoCoordinator.availableControllerOptions = documentInfoOptions
                }
                /*
                if ((id)configurationDictionary != NSNull.null) {
                    [PspdfkitFlutterHelper setLeftBarButtonItems:configurationDictionary[@"leftBarButtonItems"] forViewController:self.pdfViewController];
                    [PspdfkitFlutterHelper setRightBarButtonItems:configurationDictionary[@"rightBarButtonItems"] forViewController:self.pdfViewController];
                    [PspdfkitFlutterHelper setToolbarTitle:configurationDictionary[@"toolbarTitle"] forViewController:self.pdfViewController];
                }

                PSPDFNavigationController *navigationController = [[PSPDFNavigationController alloc] initWithRootViewController:self.pdfViewController];
                navigationController.modalPresentationStyle = UIModalPresentationFullScreen;
                UIViewController *presentingViewController = [UIApplication sharedApplication].delegate.window.rootViewController;
                [presentingViewController presentViewController:navigationController animated:YES completion:nil];
                result(@(YES));
                 */
            }
        }
        

    }

}

extension SwiftPpkFlutterPlugin: PDFViewControllerDelegate {
    public func pdfViewControllerWillDismiss(_ pdfController: PDFViewController) {
        SwiftPpkFlutterPlugin.channel?.invokeMethod("pdfViewWillDismiss", arguments: nil)
    }
    
    public func pdfViewControllerDidDismiss(_ pdfController: PDFViewController) {
        self.pdfViewController = nil
        SwiftPpkFlutterPlugin.channel?.invokeMethod("pdfViewDidDismiss", arguments: nil)
    }
}
