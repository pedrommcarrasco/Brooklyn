//
//  Database.swift
//  Brooklyn
//
//  Created by Pedro Carrasco on 21/02/2019.
//  Copyright © 2019 Pedro Carrasco. All rights reserved.
//

import ScreenSaver

struct Database {

    fileprivate enum Key {
        static let selectedAnimations = "selectedAnimations"
    }

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

extension ScreenSaverDefaults {

    var selectedAnimations: [Animation] {
        guard let rawValues = array(forKey: Database.Key.selectedAnimations) as? [String] else {
            return [.original]
        }

        return rawValues.compactMap(Animation.init)
    }

    func set(_ animation: Animation) {

        var animations = selectedAnimations
        if animations.contains(animation) {
            animations.removeAll { $0 == animation }
        } else {
            animations.append(animation)
        }

        set(animations.map { $0.rawValue }, forKey: Database.Key.selectedAnimations)
        synchronize()
    }
}
