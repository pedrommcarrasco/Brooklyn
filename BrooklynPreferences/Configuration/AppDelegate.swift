//
//  AppDelegate.swift
//  BrooklynPreferences
//
//  Created by Pedro Carrasco on 19/02/2019.
//  Copyright © 2019 Pedro Carrasco. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var window: NSWindow!

    private var controller: PreferencesWindowController?

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        controller = PreferencesWindowController(window: window)
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }


}

