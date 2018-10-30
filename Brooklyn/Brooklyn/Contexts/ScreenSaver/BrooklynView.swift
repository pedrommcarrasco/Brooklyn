//
//  BrooklynView.swift
//  Brooklyn
//
//  Created by Pedro Carrasco on 30/10/2018.
//  Copyright © 2018 Pedro Carrasco. All rights reserved.
//

import Foundation
import ScreenSaver

// MARK: - BrooklynView
class BrooklynView: ScreenSaverView {

    // MARK: Initialization
    required init?(coder decoder: NSCoder) {

        super.init(coder: decoder)
    }

    override init?(frame: NSRect, isPreview: Bool) {

        super.init(frame: frame, isPreview: isPreview)
    }
}
