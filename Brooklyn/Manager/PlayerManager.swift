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
        self.player = AVQueuePlayer(items: PlayerManager.makeItems(with: items))
        observe()
    }

    deinit {
        unobserve()
    }
}

// MARK: - Observers
extension PlayerManager {

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
}

// MARK: - Functions
extension PlayerManager {

    func play(_ animation: Animation) {
        self.player = AVQueuePlayer(items: PlayerManager.makeItems(with: [animation]))
    }

    @objc
    func playerItemDidFinish() {
        guard let finishedItem = player.currentItem?.copy() as? AVPlayerItem else { return }
        self.player.insert(finishedItem, after: player.items().last)
    }
}

// MARK: - Factory
extension PlayerManager {

    static func makeItems(with items: [Animation]) -> [AVPlayerItem] {
        let playerItems = items.compactMap { return AVPlayerItem(video: $0, extension: .mp4, for: PlayerManager.self) }

        if playerItems.count == 1, let itemCopy = playerItems.first?.copy() as? AVPlayerItem {
            return playerItems + [itemCopy]
        }

        return playerItems
    }
}
