//
//  NSTableView+Dequeue.swift
//  BrooklynApplication
//
//  Created by Pedro Carrasco on 19/02/2019.
//  Copyright © 2019 Pedro Carrasco. All rights reserved.
//

import Cocoa

extension NSTableView {

    public func dequeueCell<T: NSTableCellView>(for owner: Any?, as type: T.Type) -> T {
        let identifier = NSUserInterfaceItemIdentifier(rawValue: String(describing: T.self))
        guard let cell = makeView(withIdentifier: identifier, owner: owner) as? T else { fatalError("Unknown Cell") }
        return cell
    }
}
