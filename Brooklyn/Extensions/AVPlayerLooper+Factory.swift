//
//  AVPlayerLooper+Factory.swift
//  Brooklyn
//
//  Created by Pedro Carrasco on 19/02/2019.
//  Copyright © 2019 Pedro Carrasco. All rights reserved.
//

import AVKit

extension AVPlayerLooper {

    static func make(for player: AVQueuePlayer,
                     with video: Video,
                     extension ext: Extension = .mp4,
                     for caller: AnyClass) -> AVPlayerLooper? {

        guard let item = AVPlayerItem.init(video: video, extension: ext, for: caller) else { return nil }
        return AVPlayerLooper(player: player, templateItem: item)
    }
}
