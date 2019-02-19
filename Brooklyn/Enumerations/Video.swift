//
//  Video.swift
//  Brooklyn
//
//  Created by Pedro Carrasco on 31/10/2018.
//  Copyright © 2018 Pedro Carrasco. All rights reserved.
//

import Foundation

// MARK: - Video
enum Video: String, CaseIterable {
    case all
    case cubicMess
    case neon
    case runningInGrass
    case unstablePipes
}

// MARK: - Properties
extension Video {

    var name: String {
        switch self {
        case .all: return "All"
        case .cubicMess: return "Cubic Mess"
        case .neon: return "Neon"
        case .runningInGrass: return "Running in Grass"
        case .unstablePipes: return "Unstable Pipes"
        }
    }
}
