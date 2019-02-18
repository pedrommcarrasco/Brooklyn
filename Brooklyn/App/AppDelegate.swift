//
//  AppDelegate.swift
//  Brooklyn
//
//  Created by Pedro Carrasco on 05/12/2018.
//  Copyright © 2018 Pedro Carrasco. All rights reserved.
//

import AppKit

// MARK: - AppDelegate
@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    
    // MARK: Properties
    private lazy var window = NSWindow()
    private lazy var preferencesWindowController = PreferencesWindowController(window: window)
}
