//
//  ConsoleBarViewController.swift
//  KAppConsole
//
//  Created by Khang L on 23/10/2023.
//

import UIKit

class ConsoleBarViewController: UIViewController {
    
    private lazy var textView: UITextView = {
        let tv = UITextView()
        tv.showsVerticalScrollIndicator = true
        tv.showsHorizontalScrollIndicator = true
        tv.text = ""
        tv.textColor = .white
        tv.isScrollEnabled = true
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
    }()
    
    
    // MARK: - Initialization
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        self.commonInit()
    }
    
    required init?(coder decoder: NSCoder) {
        super.init(coder: decoder)
        
        self.commonInit()
    }
    
    private func commonInit() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(ConsoleBarViewController.updateStatusBarFrame(_:)),
                                               name: UIApplication.didChangeStatusBarOrientationNotification,
                                               object: nil
        )
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    
    // MARK: - View Lifecycle and Events
    
    override func loadView() {
        self.view = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 100.0, height: 144.0))
        self.view.backgroundColor = .white.withAlphaComponent(0.1)
        let font = UIFont.boldSystemFont(ofSize: 10.0)
        let rect = self.view.bounds.insetBy(dx: 10.0, dy: 0.0)
        
        self.textView.frame = CGRect(x: rect.origin.x, y: 44, width: rect.width, height: 100)
        self.textView.font = font
        self.textView.backgroundColor = .black.withAlphaComponent(0.5)
        self.textView.layer.cornerRadius = 8
        self.view.addSubview(self.textView)
        
        NSLayoutConstraint.activate([
            self.textView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16),
            self.textView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -16),
            self.textView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 0),
            self.textView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0),
        ])
        
    }
    
    func scrollTextViewUp() {
        // Scroll up in your UITextView
        let currentContentOffset = textView.contentOffset.y
        if currentContentOffset - 20 >= 0 {
            textView.setContentOffset(CGPoint(x: 0, y: textView.contentOffset.y - 20), animated: true)
        }
        
    }
    
    func scrollTextViewDown() {
        // Scroll down in your UITextView
        let currentContentOffset = textView.contentOffset.y + textView.bounds.height
        if currentContentOffset + 20 <= textView.contentSize.height {
            textView.setContentOffset(CGPoint(x: 0, y: textView.contentOffset.y + 20), animated: true)
        }
        
    }
    
    @objc func updateStatusBarFrame(_ notification: Notification) {
        let application = notification.object as? UIApplication
        let frame = CGRect(x: 0.0, y: 0.0, width: application?.keyWindow?.bounds.width ?? 0.0, height: 100)
        
        ConsoleBarViewController.statusBarWindow.frame = frame
    }
    
    
    // MARK: - Getting the shared status bar window
    
    @objc static var statusBarWindow: UIWindow = {
        let window = ConsoleWindow()
        window.backgroundColor = .clear
        window.windowLevel = .statusBar
        window.rootViewController = ConsoleBarViewController()
        return window
    }()
    
}


// MARK: - FPSCounterDelegate

extension ConsoleBarViewController {
    
    var bottomContentOffsetY: CGFloat {
        max(textView.contentSize.height - textView.bounds.height + textView.adjustedContentInset.bottom, -textView.adjustedContentInset.top)
       }
    
    func appendLog(_ str: String) {
        var text = textView.text
        text?.append("\n")
        text?.append(str)
        textView.text = text
        let sizeThatFits = textView.sizeThatFits(CGSize(width: textView.frame.size.width, height: CGFloat.greatestFiniteMagnitude))
        
        var offset = textView.contentOffset
        offset.y = sizeThatFits.height - textView.bounds.height
        textView.setContentOffset(CGPoint(x: textView.contentOffset.x, y: bottomContentOffsetY), animated: true)
    }
}

