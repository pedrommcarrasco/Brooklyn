//
//  BrooklynManager.swift
//  Brooklyn
//
//  Created by Pedro Carrasco on 21/02/2019.
//  Copyright © 2019 Pedro Carrasco. All rights reserved.
//

import Foundation
import ScreenSaver
import AVKit

// MARK: BrooklynManager
final class BrooklynManager {

    // MARK: Properties
    let availableAnimations: [Animation]
    var player: AVQueuePlayer { return playerManager.player }
    
    private (set) var selectedAnimations: [Animation]
    private (set) var numberOfLoops: Int
    private (set) var hasRandomOrder: Bool
    
    // MARK: Private Properties
    private let playerManager: PlayerManager
    
    // MARK: Init
    init(mode: DisplayMode = .screensaver) {
        self.availableAnimations = Animation.allCases.sorted { $0.name < $1.name  && $1 != .original}
        self.selectedAnimations = Database.standard.selectedAnimations
        self.numberOfLoops = Database.standard.numberOfLoops
        self.hasRandomOrder = Database.standard.hasRandomOrder
        
        switch mode {
        case .screensaver:
            self.playerManager = PlayerManager(items: selectedAnimations)
        case .preferences:
            self.playerManager = PlayerManager(item: selectedAnimations.first ?? .original)
        }
    }
}

// MARK: - Animations
extension BrooklynManager {
    
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
        Database.standard.set(animations: selectedAnimations)
    }
}

// MARK: - Preferences
extension BrooklynManager {
    
    func setNumberOfLoops(to numberOfLoops: Int) {
        self.numberOfLoops = numberOfLoops
        Database.standard.set(numberOfLoops: numberOfLoops)
    }
    
    func toogleHasRandomOrder() {
        hasRandomOrder.toggle()
        Database.standard.set(hasRandomOrder: hasRandomOrder)
    }
}
