//
//  PlayerView.swift
//  Brooklyn
//
//  Created by Pedro Carrasco on 06/03/2019.
//  Copyright © 2019 Pedro Carrasco. All rights reserved.
//

import AVKit

final class PlayerView: AVPlayerView {

    override var acceptsFirstResponder: Bool {
        return false
    }

    override func keyDown(with event: NSEvent) { }

    override func keyUp(with event: NSEvent) { }
}
