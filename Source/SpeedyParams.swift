//
//  SpeedyParams.swift
//  Networking
//
//  Created by Gabe The Coder on 10/2/17.
//  Copyright © 2017 Gabe The Coder. All rights reserved.
//

import Foundation

class SpeedyParams {
    
    var paramData: Data!
    
    init?(params: Any) {
        do {
            paramData = try JSONSerialization.data(withJSONObject: params)
        } catch {
            return nil
        }
    }
    
    init?<T: Encodable>(model: T) {
        do {
            paramData = try JSONEncoder().encode(model)
        } catch {
            return nil
        }
    }
    
}

extension SpeedyParams {
    
    convenience init?(id: String) {
        self.init(params: ["id": id])
    }
    
}
