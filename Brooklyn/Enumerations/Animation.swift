//
//  Animation.swift
//  Brooklyn
//
//  Created by Pedro Carrasco on 31/10/2018.
//  Copyright © 2018 Pedro Carrasco. All rights reserved.
//

import Foundation

// MARK: - Animation
enum Animation: String, CaseIterable {
    case original
    case avatarTissue
    case auroraBorealis
    case ballPit
    case bits
    case blueSand
    case cells
    case cityLife
    case connectivity
    case crescentMoon
    case cubicMess
    case cuphead
    case cursor
    case defragmentation
    case doodle
    case fadingPieces
    case fangs
    case fruitNinja
    case fullMoon
    case geometricShapes
    case glow
    case goldenBarbs
    case gummyWorms
    case hills
    case inception
    case juicy
    case layers
    case leaf
    case lines
    case magnify
    case monochrome
    case nature
    case neon
    case noiseStripes
    case paintbrush
    case pangea
    case picasso
    case playDoh
    case polarPeak
    case riverNoir
    case runningInGrass
    case sapphire
    case shards
    case shelves
    case snakes
    case soundSpectrum
    case splash
    case stripes
    case sulleysFur
    case sunset
    case theRoom
    case tissue
    case trapezium
    case unstablePipes
    case volumetric
    case warp
    case watercolors
    case waterDrops
    case wet
    case yolk
    case zebra
    case zelda
}

// MARK: - Properties
extension Animation {

    var name: String {
        return self.rawValue.localized
    }
}
