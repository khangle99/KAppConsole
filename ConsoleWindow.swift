//
//  ConsoleWindow.swift
//  KAppConsole
//
//  Created by Khang L on 23/10/2023.
//
import UIKit


class ConsoleWindow: UIWindow {

    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        // don't hijack touches from the main window
        return false
    }
}
