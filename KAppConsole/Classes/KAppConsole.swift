//
//  KAppConsole.swift
//  KAppConsole
//
//  Created by Khang L on 23/10/2023.
//

import UIKit
import QuartzCore


public class AppConsole: NSObject {

    @objc class func scrollUp() {
        if let vc = ConsoleBarViewController.statusBarWindow.rootViewController as? ConsoleBarViewController {
            vc.scrollTextViewUp()
        }
    }
    
    @objc class func scrollDown() {
        if let vc = ConsoleBarViewController.statusBarWindow.rootViewController as? ConsoleBarViewController {
            vc.scrollTextViewDown()
        }
    }
    
    
    @objc class func showInStatusBar(
        application: UIApplication = .shared,
        runloop: RunLoop = .main,
        mode: RunLoop.Mode = .common
    ) {
        let window = ConsoleBarViewController.statusBarWindow
        var frame = application.statusBarFrame
        
        window.frame = CGRect(origin: frame.origin, size: CGSize(width: frame.size.width, height: 144))
        window.isHidden = false
        
    }
    
    @objc class func hide() {
        let window = ConsoleBarViewController.statusBarWindow
        
        if let controller = window.rootViewController as? ConsoleBarViewController {
            window.isHidden = true
        }
    }
    
    @objc class var isVisible: Bool {
        return !ConsoleBarViewController.statusBarWindow.isHidden
    }
    
    @objc class func printLine(_ str: String) {
        if let vc = ConsoleBarViewController.statusBarWindow.rootViewController as? ConsoleBarViewController {
            vc.appendLog(str)
        }
    }
}
