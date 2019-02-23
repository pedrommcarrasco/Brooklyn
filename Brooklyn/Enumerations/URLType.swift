//
//  URLType.swift
//  Brooklyn
//
//  Created by Pedro Carrasco on 23/02/2019.
//  Copyright © 2019 Pedro Carrasco. All rights reserved.
//

import Cocoa

// MARK: - URLType
enum URLType: String {
    case help = "https://github.com/pedrommcarrasco/Brooklyn/issues"
    case github = "https://github.com/pedrommcarrasco/Brooklyn"
    case twitter = "https://twitter.com/pedrommcarrasco"
}

// MARK: Functions
extension URLType {
    
    func open() {
        guard let url = URL(string: rawValue) else { return }
        NSWorkspace.shared.open(url)
    }
}
