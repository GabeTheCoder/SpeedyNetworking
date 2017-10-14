//
//  SpeedyConfiguration.swift
//  Networking
//
//  Created by Gabe The Coder on 10/2/17.
//  Copyright © 2017 Gabe The Coder. All rights reserved.
//

import Foundation

class SpeedyConfiguration {
    
    static let shared = SpeedyConfiguration()
    
    var defaultUrl: URL?
    var defaultAuthorizationHeader: String?
    
}
