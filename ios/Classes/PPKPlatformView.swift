/* *****************************************************************************************************
   PPK Flutter - A plugin to provide expanded Interface to PSPDFKit

   Copyright (c) 2021 Imdat Solak (imdat@solak.de)

   For license, checkout LICENSE.txt in the root of this repository
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
/*
         if ([@"initializePlatformView" isEqualToString:call.method]) {
             NSArray<PSPDFDocumentInfoOption> *documentInfoOptions;
             NSString *documentPath = call.arguments[@"document"];

             if (documentPath == nil || documentPath.length <= 0) {
                 FlutterError *error = [FlutterError errorWithCode:@"" message:@"Document path may not be nil or empty." details:nil];
                 result(error);
                 return;
             }

             NSDictionary *configurationDictionary = call.arguments[@"configuration"];

             PSPDFDocument *document = [PspdfkitFlutterHelper documentFromPath:documentPath];
             [PspdfkitFlutterHelper unlockWithPasswordIfNeeded:document dictionary:configurationDictionary];

             BOOL isImageDocument = [PspdfkitFlutterHelper isImageDocument:documentPath];
             PSPDFConfiguration *configuration = [PspdfkitFlutterConverter configuration:configurationDictionary isImageDocument:isImageDocument];

             self.pdfViewController = [[PSPDFViewController alloc] initWithDocument:document configuration:configuration];
             self.pdfViewController.appearanceModeManager.appearanceMode = [PspdfkitFlutterConverter appearanceMode:configurationDictionary];
             self.pdfViewController.pageIndex = [PspdfkitFlutterConverter pageIndex:configurationDictionary];
             self.pdfViewController.delegate = self;
             documentInfoOptions = [PspdfkitFlutterConverter documentInfoOptions:configurationDictionary];
             if (documentInfoOptions) {
                 self.pdfViewController.documentInfoCoordinator.availableControllerOptions = documentInfoOptions;
             }

             if ((id)configurationDictionary != NSNull.null) {
                 [PspdfkitFlutterHelper setLeftBarButtonItems:configurationDictionary[@"leftBarButtonItems"] forViewController:self.pdfViewController];
                 [PspdfkitFlutterHelper setRightBarButtonItems:configurationDictionary[@"rightBarButtonItems"] forViewController:self.pdfViewController];
                 [PspdfkitFlutterHelper setToolbarTitle:configurationDictionary[@"toolbarTitle"] forViewController:self.pdfViewController];
             }

             [self.navigationController setViewControllers:@[self.pdfViewController] animated:NO];
             result(@(YES));
         } else {
             [PspdfkitFlutterHelper processMethodCall:call result:result forViewController:self.pdfViewController];
         }

         */
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
