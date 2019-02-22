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
    }

    // MARK: Properties
    static var standard: ScreenSaverDefaults {
        guard let bundleIdentifier = Bundle(for: AnimationsManager.self).bundleIdentifier,
            let database = ScreenSaverDefaults(forModuleWithName: bundleIdentifier)
            else { fatalError("Failed to retrieve database") }

        database.register(defaults:
            [Key.selectedAnimations: [Animation.original.rawValue]]
        )

        database.removePersistentDomain(forName: Bundle(for: AnimationsManager.self).bundleIdentifier!)

        return database
    }
}

// MARK: - ScreenSaverDefaults's Functions
extension ScreenSaverDefaults {

    var selectedAnimations: [Animation] {
        guard let rawValues = array(forKey: Database.Key.selectedAnimations) as? [String] else { return [.original] }
        return rawValues.compactMap(Animation.init)
    }

    func set(_ animations: [Animation]) {
        set(animations.map { $0.rawValue }, for: Database.Key.selectedAnimations)
    }
}

// MARK: - ScreenSaverDefaults's Private Functions
private extension ScreenSaverDefaults {
    
    func set(_ object: Any, for key: String) {
        set(object, forKey: key)
        synchronize()
    }
}
