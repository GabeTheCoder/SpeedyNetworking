//
//  Speedy.swift
//  Echoo V2
//
//  Created by Gabe The Coder on 6/16/17.
//  Copyright © 2017 Gabe The Coder. All rights reserved.
//

// Speedy helps make the UI smoother on older phones

import Foundation

class Speedy {
    
    static let main = Speedy()
    
    func execute(action: @escaping () -> Void) {
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.1) {
            action()
        }
    }
    
    func executeAfter(delay: Double, action: @escaping () -> Void) {
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + delay) {
            action()
        }
    }
    
    func executeAfterUIUpdate(action: @escaping () -> Void) {
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1.0) {
            action()
        }
    }
    
}

