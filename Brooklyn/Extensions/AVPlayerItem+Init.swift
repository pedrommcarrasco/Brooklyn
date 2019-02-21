//
//  AVPlayerItem+Init.swift
//  Brooklyn
//
//  Created by Pedro Carrasco on 19/02/2019.
//  Copyright © 2019 Pedro Carrasco. All rights reserved.
//

import AVKit

// MARK: Init
extension AVPlayerItem {

    convenience init?(video: Animation, extension ext: Extension, for caller: AnyClass) {
        guard let url = Bundle(for: caller).url(forResource: video.rawValue, withExtension: ext.rawValue) else { return nil }
        self.init(url: url)
    }
}
