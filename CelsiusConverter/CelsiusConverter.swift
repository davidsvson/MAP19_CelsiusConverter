//
//  CelsiusConverter.swift
//  CelsiusConverter
//
//  Created by David Svensson on 2020-01-16.
//  Copyright © 2020 David Svensson. All rights reserved.
//

import Foundation

class CelsiusConverter {
    
    func degreesFahrenheit(degreesCelsius: Int ) -> Int {
        let deegreF = 1.8 * Double(degreesCelsius) + 32.0
        
        return Int(round(deegreF))
    }
}
