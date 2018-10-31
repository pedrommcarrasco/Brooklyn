//
//  AVPlayer+Init.swift
//  Brooklyn
//
//  Created by Pedro Carrasco on 30/10/2018.
//  Copyright © 2018 Pedro Carrasco. All rights reserved.
//

import AVKit

// MARK: Init
extension AVPlayer {
    
    convenience init?(name: Video, extension ext: Extension) {
        
        guard let url = Bundle.pathAware.url(forResource: name.rawValue, withExtension: ext.rawValue) else { return nil }
        
        self.init(url: url)
    }
}
