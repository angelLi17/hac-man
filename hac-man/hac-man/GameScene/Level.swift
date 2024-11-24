//
//  Level.swift
//  hac-man
//
//  Created by Angel on 11/23/24.
//

import SwiftUI

struct Level {
    //PROPERTIES
    var level: Int
    var bonus: String
    var bonusPoints: Int
    private let baseSpeed: CGFloat = 384
    
    var pacNormalSpeed: CGFloat
    var pacFrightSpeed: CGFloat
    var ghostNormalSpeed: CGFloat
    var ghostFrightSpeed: CGFloat
    
    var frightTime: CFTimeInterval
    
}

