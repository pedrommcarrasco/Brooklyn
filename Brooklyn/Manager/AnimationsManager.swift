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
    let availableAnimations = Animation.allCases
    private(set) var selectedAnimations: [Animation]
    var player: AVQueuePlayer { return playerManager.player }
    
    // MARK: Private Properties
    private let playerManager: PlayerManager
    
    // MARK: Init
    init() {
        self.selectedAnimations = Database.standard.selectedAnimations
        self.playerManager = PlayerManager(items: selectedAnimations)
    }
}

// MARK: - Functions
extension AnimationsManager {
    
    func preview(_ animation: Animation) {
        playerManager.play(animation)
    }

    func toogle(_ animation: Animation) {
        var animations = selectedAnimations
        if animations.contains(animation) {
            animations.removeAll { $0 == animation }
        } else {
            animations.append(animation)
        }
        
        selectedAnimations = animations
        Database.standard.set(selectedAnimations)
    }
}
