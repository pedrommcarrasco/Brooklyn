//
//  PreferencesWindowController.swift
//  Brooklyn
//
//  Created by Pedro Carrasco on 05/12/2018.
//  Copyright © 2018 Pedro Carrasco. All rights reserved.
//

import AppKit

// MARK: - PreferencesWindowController
final class PreferencesWindowController: NSWindowController {
    
    // MARK: Outlets
    private let animationsTableView = NSTableView()
    
    override init(window: NSWindow?) {
        super.init(window: window)
        window?.makeKeyAndOrderFront(self)
        window?.styleMask = [.closable, .miniaturizable]
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Lifecycle
extension PreferencesWindowController {
    
    override func windowDidLoad() {
        super.windowDidLoad()
    }
}

// MARK: - Configuration
private extension PreferencesWindowController {
    
    func configure() {
        addSubviews()
        defineConstraints()
        setupSubviews()
    }
    
    func addSubviews() {
        window?.contentView?.addSubview(animationsTableView)
    }
    
    func defineConstraints() {
        
    }
    
    func setupSubviews() {
        
    }
}
