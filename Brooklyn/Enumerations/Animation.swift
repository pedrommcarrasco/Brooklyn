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
    case ballPit
    case blueSand
    case cells
    case cityLife
    case connectivity
    case cubicMess
    case defragmentation
    case eggsy
    case fadingPieces
    case fangs
    case fruitNinja
    case geometricShapes
    case glow
    case goldenBarbs
    case gummyWorms
    case hills
    case layers
    case leaf
    case lines
    case magnify
    case monochrome
    case neon
    case noiseStripes
    case paintbrush
    case picasso
    case playDoh
    case riverNoir
    case runningInGrass
    case shards
    case shelves
    case snakes
    case soundSpectrum
    case splash
    case sulleysFur
    case trapezium
    case unstablePipes
    case virus
    case volumetric
    case watercolors
    case waterDrops
    case wet
    case yolk
    case zebra
}

// MARK: - Properties
extension Animation {

    var name: String {
        switch self {
        case .original: return "Original"
        case .avatarTissue: return "Avatar Tissue"
        case .ballPit: return "Ball Pit"
        case .blueSand: return "Blue Sand"
        case .cells: return "Cells"
        case .cityLife: return "City Life"
        case .connectivity: return "Connectivity"
        case .cubicMess: return "Cubic Mess"
        case .defragmentation: return "Defragmentation"
        case .eggsy: return "Eggsy"
        case .fadingPieces: return "Fading Pieces"
        case .fangs: return "Fangs"
        case .fruitNinja: return "Fruit Ninja"
        case .geometricShapes: return "Geometric Shapes"
        case .glow: return "Glow"
        case .goldenBarbs: return "Golden Barbs"
        case .gummyWorms: return "Gummy Worms"
        case .hills: return "Hills"
        case .layers: return "Layers"
        case .leaf: return "Leaf"
        case .lines: return "Lines"
        case .magnify: return "Magnify"
        case .monochrome: return "Monochrome"
        case .neon: return "Neon"
        case .noiseStripes: return "Noise Stripes"
        case .paintbrush: return "Paintbrush"
        case .picasso: return "Picasso"
        case .playDoh: return "Play-Doh"
        case .riverNoir: return "River Noir"
        case .runningInGrass: return "Running in Grass"
        case .shards: return "Shards"
        case .shelves: return "Shelves"
        case .snakes: return "Snakes"
        case .soundSpectrum: return "Sound Spectrum"
        case .splash: return "Splash"
        case .sulleysFur: return "Sulley's Fur"
        case .trapezium: return "Trapezium"
        case .unstablePipes: return "Unstable Pipes"
        case .virus: return "Virus"
        case .volumetric: return "Volumetric"
        case .watercolors: return "Watercolors"
        case .waterDrops: return "Water Drops"
        case .wet: return "Wet"
        case .yolk: return "Yolk"
        case .zebra: return "Zebra"
        }
    }
}
