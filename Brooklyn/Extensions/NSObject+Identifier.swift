//
//  NSObject+Identifier.swift
//  Brooklyn
//
//  Created by Pedro Carrasco on 20/02/2019.
//  Copyright © 2019 Pedro Carrasco. All rights reserved.
//

import Foundation

// MARK: - Identifier
extension NSObject {

    static var identifier: String { return String(describing: self) }
}
