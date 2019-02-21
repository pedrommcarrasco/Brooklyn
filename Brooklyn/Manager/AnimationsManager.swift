//
//  AnimationsManager.swift
//  Brooklyn
//
//  Created by Pedro Carrasco on 21/02/2019.
//  Copyright © 2019 Pedro Carrasco. All rights reserved.
//

import Foundation
import ScreenSaver
import AVKit

// MARK: AnimationsManager
final class AnimationsManager {

    // MARK: Properties
    var player: AVQueuePlayer { return playerManager.player }

    var availableAnimations = Animation.allCases
    var selectedAnimations: [Animation] { return Database.standard.selectedAnimations }

    // MARK: Private Properties
    private lazy var playerManager = PlayerManager(items: selectedAnimations)
}

// MARK: - Functions
extension AnimationsManager {

    func toogle(_ animation: Animation) {
        Database.standard.set(animation)
    }
}
