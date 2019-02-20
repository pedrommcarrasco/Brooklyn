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
        contentViewController = PreferencesTabController()
        configure()
    }

    init() {
        let window = NSWindow(contentViewController: PreferencesTabController())
        super.init(window: window)
        configure()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension PreferencesWindowController {

    func configure() {
        window?.title = "Preferences"
        window?.makeKeyAndOrderFront(self)
    }
}
