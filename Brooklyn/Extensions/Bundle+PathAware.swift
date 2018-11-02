//
//  Bundle+PathAware.swift
//  Brooklyn
//
//  Created by Pedro Carrasco on 31/10/2018.
//  Copyright © 2018 Pedro Carrasco. All rights reserved.
//

import Foundation

// MARK: Path Aware
extension Bundle {
    
    static var pathAware: Bundle {
        
        return Bundle(for: BrooklynView.self)
    }
}
