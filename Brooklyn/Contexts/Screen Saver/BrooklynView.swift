//
//  BrooklynView.swift
//  Brooklyn
//
//  Created by Pedro Carrasco on 30/10/2018.
//  Copyright © 2018 Pedro Carrasco. All rights reserved.
//

import Foundation
import ScreenSaver
import AVKit

// MARK: - BrooklynView
final class BrooklynView: ScreenSaverView {

    // MARK: Local Typealias
    typealias Static = BrooklynView
    
    // MARK: Constant
    private enum Constant {
        static let secondPerFrame = 1.0 / 30.0
        static let backgroundColor = NSColor(red: 0.00, green: 0.01, blue: 0.00, alpha:1.0)
    }
    
    // MARK: Outlets
    private let videoLayer = AVPlayerLayer()
    
    // MARK: Properties
    private let manager = BrooklynManager(mode: .screensaver)
    private lazy var preferences = PreferencesWindowController(windowNibName: PreferencesWindowController.identifier)

    // MARK: Initialization
    required init?(coder decoder: NSCoder) {
        super.init(coder: decoder)
        animationTimeInterval = Constant.secondPerFrame
        configure()
    }
    
    override init?(frame: NSRect, isPreview: Bool) {
        super.init(frame: frame, isPreview: isPreview)
        animationTimeInterval = Constant.secondPerFrame
        configure()
    }
}

// MARK: - Lifecycle
extension BrooklynView {
    
    override func startAnimation() {
        super.startAnimation()
        manager.player.play()
    }
    
    override func stopAnimation() {
        super.stopAnimation()
        manager.player.pause()
    }
}

// MARK: - Configuration
private extension BrooklynView {
    
    func configure() {
        defineLayer()
        setupLayer()
    }
    
    func defineLayer() {
        wantsLayer = true
        defineVideoLayer()
        layer = videoLayer
    }
    
    func setupLayer() {
        videoLayer.player = manager.player
    }
}

// MARK: - Define Layers
private extension BrooklynView {

    func defineVideoLayer() {
        videoLayer.frame = bounds
        videoLayer.autoresizingMask = [.layerWidthSizable, .layerHeightSizable]
        videoLayer.needsDisplayOnBoundsChange = true
        videoLayer.contentsGravity = .resizeAspect
        videoLayer.backgroundColor = Constant.backgroundColor.cgColor
    }
}

// MARK: - Preferences
extension BrooklynView {

    override var hasConfigureSheet: Bool {
        return true
    }

    override var configureSheet: NSWindow? {
        return preferences.window
    }
}
