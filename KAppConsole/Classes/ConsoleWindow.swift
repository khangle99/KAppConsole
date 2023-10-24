//
//  ConsoleWindow.swift
//  KAppConsole
//
//  Created by Khang L on 23/10/2023.
//
import UIKit


class ConsoleWindow: UIWindow {
    
    public static var isTouchEable = false {
        didSet {
            if let vc = ConsoleBarViewController.statusBarWindow.rootViewController as? ConsoleBarViewController {
                vc.updateScrollableIndicator(isScrollable: isTouchEable)
            }
        }
    }
    
    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        return ConsoleWindow.isTouchEable
    }
}
