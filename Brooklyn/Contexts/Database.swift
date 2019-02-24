//
//  Database.swift
//  Brooklyn
//
//  Created by Pedro Carrasco on 21/02/2019.
//  Copyright © 2019 Pedro Carrasco. All rights reserved.
//

import ScreenSaver

// MARK: Database
struct Database {

    // MARK: Key
    fileprivate enum Key {
        static let selectedAnimations = "selectedAnimations"
        static let numberOfLoops = "numberOfLoops"
        static let randomOrder = "randomOrder"
    }

    // MARK: Properties
    static var standard: ScreenSaverDefaults {
        guard let bundleIdentifier = Bundle(for: Database.self).bundleIdentifier,
            let database = ScreenSaverDefaults(forModuleWithName: bundleIdentifier)
            else { fatalError("Failed to retrieve database") }

        database.register(defaults:
            [Key.selectedAnimations: [Animation.original.rawValue],
             Key.numberOfLoops: 0,
             Key.randomOrder: false
             ]
        )

        return database
    }
}

// MARK: - ScreenSaverDefaults's Functions
extension ScreenSaverDefaults {

    var selectedAnimations: [Animation] {
        guard let rawValues = array(forKey: Database.Key.selectedAnimations) as? [String] else { return [.original] }
        return rawValues.compactMap(Animation.init)
    }

    func set(animations: [Animation]) {
        set(animations.map { $0.rawValue }, for: Database.Key.selectedAnimations)
    }
    
    var numberOfLoops: Int {
        return integer(forKey: Database.Key.numberOfLoops)
    }
    
    func set(numberOfLoops: Int) {
        set(numberOfLoops, for: Database.Key.numberOfLoops)
    }
    
    var hasRandomOrder: Bool {
        return bool(forKey: Database.Key.randomOrder)
    }
    
    func set(hasRandomOrder: Bool) {
        set(hasRandomOrder, for: Database.Key.randomOrder)
    }
}

// MARK: - ScreenSaverDefaults's Private Functions
private extension ScreenSaverDefaults {
    
    func set(_ object: Any, for key: String) {
        set(object, forKey: key)
        synchronize()
    }
}
