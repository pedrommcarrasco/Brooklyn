//
//  Collection+Index.swift
//  Brooklyn
//
//  Created by Pedro Carrasco on 22/02/2019.
//  Copyright © 2019 Pedro Carrasco. All rights reserved.
//

import Foundation

// MARK: - Index
extension Collection {
    
    public subscript(safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
