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
    case auroraBorealis
    case avatarTissue
    case ballPit
    case binary
    case bits
    case bloomingRoses
    case bluePipes
    case blueSand
    case cases
    case cells
    case cityLife
    case colorfulSunset
    case connectivity
    case crescentMoon
    case cubicMess
    case cuphead
    case cuphead2
    case cursor
    case defragmentation
    case doodle
    case dots
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
    case kaleidoscope
    case layers
    case leaf
    case lines
    case magnify
    case monochrome
    case nature
    case neon
    case noiseStripes
    case oldScreen
    case paintbrush
    case paintRivers
    case pangea
    case penrose
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
    case zoetrope
}

// MARK: - Properties
extension Animation {

    var name: String {
        return Localizations.animation[rawValue] ?? ""
    }
}
