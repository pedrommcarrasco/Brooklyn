//
//  AVPlayerItem+Init.swift
//  Brooklyn
//
//  Created by Pedro Carrasco on 31/10/2018.
//  Copyright © 2018 Pedro Carrasco. All rights reserved.
//

import AVKit

// MARK: Init
extension AVPlayerItem {

    convenience init?(video: Video, extension ext: Extension) {
        guard let url = Bundle.pathAware.url(forResource: video.rawValue, withExtension: ext.rawValue) else { return nil }

        self.init(url: url)
    }
}
