//
//  String+Localized.swift
//  Brooklyn
//
//  Created by Michael Charland on 2019-10-07.
//  Copyright © 2019 Pedro Carrasco. All rights reserved.
//

import Foundation

protocol Localizable {
    var localized: String { get }
}

extension String: Localizable {

    var localized: String {
        return NSLocalizedString(self, comment: "")
    }

}
