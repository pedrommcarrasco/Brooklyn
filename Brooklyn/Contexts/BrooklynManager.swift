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
    
    private enum Constant {
        static let bundleId = "oedrommcarrasco.brooklyn"
        static let versionKey = "CFBundleShortVersionString"
    }
    
    // MARK: Properties
    let availableAnimations: [Animation]
    let player: LoopPlayer
    
    // MARK: Private Set Properties
    private (set) var selectedAnimations: [Animation]
    private (set) var numberOfLoops: Int
    private (set) var hasRandomOrder: Bool
    
    // MARK: Init
    init(mode: DisplayMode) {
        self.availableAnimations = Animation.allCases
        self.selectedAnimations = Database.standard.selectedAnimations
        self.numberOfLoops = Database.standard.numberOfLoops
        self.hasRandomOrder = Database.standard.hasRandomOrder
        
        switch mode {
        case .screensaver:
            self.player = LoopPlayer(items: selectedAnimations,
                                     numberOfLoops: numberOfLoops,
                                     shouldRandomize: hasRandomOrder)
        case .preferences:
            self.player = LoopPlayer(items: [selectedAnimations.first ?? .original],
                                     numberOfLoops: 0,
                                     shouldRandomize: false)
        }
    }
}

// MARK: - Animations
extension BrooklynManager {
    
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
    
    var currentVersion: String {
        //We are running from the Brooklyn screensaver itself
        if let screensaverBundle = Bundle(identifier: Constant.bundleId) {
            return screensaverBundle.infoDictionary?[Constant.versionKey] as? String ?? ""
        } else {
            //we are running from canvas, lets return the version number from there...just to return something
            return Bundle.main.infoDictionary?[Constant.versionKey] as? String ?? ""
        }
    }
}
