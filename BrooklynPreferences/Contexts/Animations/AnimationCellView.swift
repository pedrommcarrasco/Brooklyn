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
    var title: String { return button.title }
    var state: NSControl.StateValue{ return button.state }

    // MARK: Configure
    func configure(with title: String, state: NSControl.StateValue) {
        button.title = title
        button.state = state
    }
}
