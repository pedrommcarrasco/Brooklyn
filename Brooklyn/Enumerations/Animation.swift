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
    case eggsy
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
    case virus
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
        switch self {
        case .original: return "Original"
        case .avatarTissue: return "Avatar Tissue"
        case .auroraBorealis: return "Aurora Borealis"
        case .ballPit: return "Ball Pit"
        case .bits: return "Bits"
        case .blueSand: return "Blue Sand"
        case .cells: return "Cells"
        case .cityLife: return "City Life"
        case .connectivity: return "Connectivity"
        case .crescentMoon: return "Crescent Moon"
        case .cubicMess: return "Cubic Mess"
        case .cuphead: return "Cuphead"
        case .cursor: return "Cursor"
        case .defragmentation: return "Defragmentation"
        case .doodle: return "Doodle"
        case .eggsy: return "Eggsy"
        case .fadingPieces: return "Fading Pieces"
        case .fangs: return "Fangs"
        case .fruitNinja: return "Fruit Ninja"
        case .fullMoon: return "Full Moon"
        case .geometricShapes: return "Geometric Shapes"
        case .glow: return "Glow"
        case .goldenBarbs: return "Golden Barbs"
        case .gummyWorms: return "Gummy Worms"
        case .hills: return "Hills"
        case .inception: return "Inception"
        case .juicy: return "Juicy"
        case .layers: return "Layers"
        case .leaf: return "Leaf"
        case .lines: return "Lines"
        case .magnify: return "Magnify"
        case .monochrome: return "Monochrome"
        case .nature: return "Nature"
        case .neon: return "Neon"
        case .noiseStripes: return "Noise Stripes"
        case .paintbrush: return "Paintbrush"
        case .pangea: return "Pangea"
        case .picasso: return "Picasso"
        case .playDoh: return "Play-Doh"
        case .polarPeak: return "Polar Peak"
        case .riverNoir: return "River Noir"
        case .runningInGrass: return "Running in Grass"
        case .sapphire: return "Sapphire"
        case .shards: return "Shards"
        case .shelves: return "Shelves"
        case .snakes: return "Snakes"
        case .soundSpectrum: return "Sound Spectrum"
        case .splash: return "Splash"
        case .stripes: return "Stripes"
        case .sulleysFur: return "Sulley's Fur"
        case .sunset: return "Sunset"
        case .theRoom: return "The Room"
        case .tissue: return "Tissue"
        case .trapezium: return "Trapezium"
        case .unstablePipes: return "Unstable Pipes"
        case .virus: return "Virus"
        case .volumetric: return "Volumetric"
        case .warp: return "Warp"
        case .watercolors: return "Watercolors"
        case .waterDrops: return "Water Drops"
        case .wet: return "Wet"
        case .yolk: return "Yolk"
        case .zebra: return "Zebra"
        case .zelda: return "Zelda"
        }
    }
}
