//
//  AnimationCellView.swift
//  BrooklynApplication
//
//  Created by Pedro Carrasco on 19/02/2019.
//  Copyright © 2019 Pedro Carrasco. All rights reserved.
//

import Cocoa

// MARK: - AnimationCellView
final class AnimationCellView: NSTableCellView {

    // MARK: Outlets
    @IBOutlet private weak var button: NSButton!

    // MARK: Properties
    var title: String { return textField?.stringValue ?? "" }
    var state: NSControl.StateValue{ return button.state }
    var onToogle: (() -> ())?
}

// MARK: - Configuration
extension AnimationCellView {
    
    func configure(with title: String, state: NSControl.StateValue) {
        textField?.stringValue = title
        button.state = state
    }
}

// MARK: - Actions
private extension AnimationCellView {
    
    @IBAction func buttonAction(_ sender: NSButton) {
        onToogle?()
    }
}
