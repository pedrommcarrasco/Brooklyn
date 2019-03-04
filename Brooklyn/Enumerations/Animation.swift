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
    case cubicMess
    case defragmentation
    case fangs
    case geometricShapes
    case glow
    case gummyWorms
    case hills
    case iris
    case layers
    case leaf
    case lines
    case magnify
    case moistyColors
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
    case skittles
    case soundSpectrum
    case splash
    case surfaceWater
    case trapezium
    case unstablePipes
    case virus
    case volumetric
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
        case .cubicMess: return "Cubic Mess"
        case .defragmentation: return "Defragmentation"
        case .fangs: return "Fangs"
        case .geometricShapes: return "Geometric Shapes"
        case .glow: return "Glow"
        case .gummyWorms: return "Gummy Worms"
        case .hills: return "Hills"
        case .iris: return "Iris"
        case .layers: return "Layers"
        case .leaf: return "Leaf"
        case .lines: return "Lines"
        case .magnify: return "Magnify"
        case .moistyColors: return "Moisty Colors"
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
        case .skittles: return "Skittles"
        case .soundSpectrum: return "Sound Spectrum"
        case .splash: return "Splash"
        case .surfaceWater: return "Surface Water"
        case .trapezium: return "Trapezium"
        case .unstablePipes: return "Unstable Pipes"
        case .virus: return "Virus"
        case .volumetric: return "Volumetric"
        case .waterDrops: return "Water Drops"
        case .wet: return "Wet"
        case .yolk: return "Yolk"
        case .zebra: return "Zebra"
        }
    }
}
