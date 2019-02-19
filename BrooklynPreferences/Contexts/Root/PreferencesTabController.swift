//
//  PreferencesTabController.swift
//  BrooklynApplication
//
//  Created by Pedro Carrasco on 19/02/2019.
//  Copyright © 2019 Pedro Carrasco. All rights reserved.
//

import Cocoa

final class PreferencesTabController: NSTabViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        addChild(AnimationsViewController(nibName: "AnimationsViewController", bundle: nil))

        tabViewItems.first?.label = "Animations"
    }
}
