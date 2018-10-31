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
    
    // MARK: Constant
    private enum Constant {
        
        static let secondPerFrame = 1.0 / 30.0
    }
    
    // MARK: Outlets
    private let videoLayer = AVPlayerLayer()
    
    // MARK: Properties
    private let player = AVPlayer(name: .random, extension: .mp4)
    
    // MARK: Initialization
    required init?(coder decoder: NSCoder) {
        
        super.init(coder: decoder)
        configure()
    }
    
    override init?(frame: NSRect, isPreview: Bool) {
        
        super.init(frame: frame, isPreview: isPreview)
        self.animationTimeInterval = Constant.secondPerFrame
        configure()
    }
}

// MARK: - Lifecycle
extension BrooklynView {
    
    override func startAnimation() {
        super.startAnimation()
        
        player?.play()
    }
    
    override func stopAnimation() {
        super.stopAnimation()
        
        player?.pause()
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
        
        videoLayer.frame = bounds
        videoLayer.autoresizingMask = [.layerWidthSizable, .layerHeightSizable]
        videoLayer.needsDisplayOnBoundsChange = true
        videoLayer.contentsGravity = .resizeAspectFill
        videoLayer.backgroundColor = NSColor.black.cgColor
        
        layer = videoLayer
    }
    
    func setupLayer() {
        
        videoLayer.player = player
    }
}
