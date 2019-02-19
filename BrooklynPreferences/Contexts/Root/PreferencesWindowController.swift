//
//  PreferencesWindowController.swift
//  BrooklynApplication
//
//  Created by Pedro Carrasco on 19/02/2019.
//  Copyright © 2019 Pedro Carrasco. All rights reserved.
//

import Cocoa

// MARK: - PreferencesWindowController
final class PreferencesWindowController: NSWindowController, NSWindowDelegate {

    // MARK: Init
    override init(window: NSWindow?) {
        super.init(window: window)

        window?.makeKeyAndOrderFront(self)
        window?.title = "Preferences"

        contentViewController = PreferencesTabController()
    }

    init() {
        let window = NSWindow()
        super.init(window: window)
        
        window.title = "Preferences"
        window.makeKeyAndOrderFront(self)

        contentViewController = PreferencesTabController()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
