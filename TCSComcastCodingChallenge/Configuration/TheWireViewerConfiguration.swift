//
//  TheWireViewerConfiguration.swift
//  TCSComcastCodingChallenge
//
//  Created by Afnan Mirza on 9/6/19.
//  Copyright © 2019 Afnan Mirza. All rights reserved.
//

import Foundation

struct AppConfiguration {
    static var apiURL: String {
        get {
            return "http://api.duckduckgo.com/?q=the+wire+characters&format=json"
        }
    }
    
    static let appName = "The Wire Character Viewer"
}
