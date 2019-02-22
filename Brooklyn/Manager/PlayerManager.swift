//
//  PlayerManager.swift
//  Brooklyn
//
//  Created by Pedro Carrasco on 21/02/2019.
//  Copyright © 2019 Pedro Carrasco. All rights reserved.
//

import AVFoundation

// MARK: - PlayerManager
final class PlayerManager {

    // MARK: Properties
    private(set) var player: AVQueuePlayer

    // MARK: Lifecycle
    init(items: [Animation]) {
        self.player = AVQueuePlayer(items: items.compactMap {
            return AVPlayerItem(video: $0, extension: .mp4, for: PlayerManager.self)
        })
        configure()
    }
    
    init(item: Animation) {
        self.player = AVQueuePlayer(playerItem: AVPlayerItem(video: item, extension: .mp4, for: PlayerManager.self))
        configure()
    }

    deinit {
        unobserve()
    }
}

// MARK: - Functions
extension PlayerManager {

    func play(_ animation: Animation) {
        guard let item = AVPlayerItem(video: animation, extension: .mp4, for: PlayerManager.self) else { return }
        player.insert(item, after: player.items().last)
        player.advanceToNextItem()
    }
}

// MARK: - Configuration
private extension PlayerManager {
    
    func configure() {
        player.actionAtItemEnd = .none
        observe()
    }
}

// MARK: - Observers
private extension PlayerManager {
    
    func observe() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(playerItemDidFinish),
                                               name: NSNotification.Name.AVPlayerItemDidPlayToEndTime,
                                               object: nil)
    }
    
    func unobserve() {
        NotificationCenter.default.removeObserver(self,
                                                  name: NSNotification.Name.AVPlayerItemDidPlayToEndTime,
                                                  object: nil)
    }
    
    @objc
    func playerItemDidFinish() {
        if player.currentItem == player.items().last {
            player.seek(to: .zero)
        }
    }
}
