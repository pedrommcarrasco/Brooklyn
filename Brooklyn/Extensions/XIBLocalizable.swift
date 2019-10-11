//
//  XIBLocalizable.swift
//  Brooklyn
//
//  Created by Michael Charland on 2019-10-09.
//  Copyright © 2019 Pedro Carrasco. All rights reserved.
//

import Foundation
import Cocoa

protocol XIBLocalizable {
    var xibLocKey: String? { get set }
}

extension NSTextFieldCell: XIBLocalizable {
    @IBInspectable var xibLocKey: String? {
        get { return nil }
        set(key) {
            if let localized = key?.localized, key != localized  {
                self.title = localized
            }
        }
    }
}

extension NSButtonCell: XIBLocalizable {
    @IBInspectable var xibLocKey: String? {
        get { return nil }
        set(key) {
            if let localized = key?.localized, key != localized  {
                self.title = localized
            }
        }
    }
}

extension NSWindow: XIBLocalizable {
    @IBInspectable var xibLocKey: String? {
        get { return nil }
        set(key) {
            if let localized = key?.localized, key != localized  {
                self.title = localized
            }
        }
    }
}

extension NSMenu: XIBLocalizable {
    @IBInspectable var xibLocKey: String? {
        get { return nil }
        set(key) {
            if let localized = key?.localized, key != localized  {
                self.title = localized
            }
        }
    }
}

extension NSMenuItem: XIBLocalizable {
    @IBInspectable var xibLocKey: String? {
        get { return nil }
        set(key) {
            if let localized = key?.localized, key != localized  {
                self.title = localized
            }
        }
    }
}
