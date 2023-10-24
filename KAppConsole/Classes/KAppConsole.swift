//
//  KAppConsole.swift
//  KAppConsole
//
//  Created by Khang L on 23/10/2023.
//

import UIKit
import QuartzCore


public class AppConsole: NSObject {
    
    @objc public class func enableTouch() {
        ConsoleWindow.isTouchEable = true
    }
    
    @objc public class func disableTouch() {
        ConsoleWindow.isTouchEable = false
    }

    @objc public class func scrollUp() {
        if let vc = ConsoleBarViewController.statusBarWindow.rootViewController as? ConsoleBarViewController {
            vc.scrollTextViewUp()
        }
    }
    
    @objc public class func scrollDown() {
        if let vc = ConsoleBarViewController.statusBarWindow.rootViewController as? ConsoleBarViewController {
            vc.scrollTextViewDown()
        }
    }
    
    
    @objc public class func showInStatusBar(
        application: UIApplication = .shared,
        runloop: RunLoop = .main,
        mode: RunLoop.Mode = .common
    ) {
        let window = ConsoleBarViewController.statusBarWindow
        let frame = application.statusBarFrame
        
        window.frame = CGRect(origin: frame.origin, size: CGSize(width: frame.size.width, height: 144))
        window.isHidden = false
        
    }
    
    @objc public class func hide() {
        let window = ConsoleBarViewController.statusBarWindow
        
        if let _ = window.rootViewController as? ConsoleBarViewController {
            window.isHidden = true
        }
    }
    
    @objc public class var isVisible: Bool {
        return !ConsoleBarViewController.statusBarWindow.isHidden
    }
    
    @objc public class func printLine(_ str: String) {
        if let vc = ConsoleBarViewController.statusBarWindow.rootViewController as? ConsoleBarViewController {
            vc.appendLog(str)
        }
    }
}
