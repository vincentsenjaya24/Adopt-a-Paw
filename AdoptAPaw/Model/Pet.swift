//
//  Item.swift
//  SwiftDataLearn
//
//  Created by Vincent Senjaya on 23/05/24.
//

import Foundation
import SwiftData
import RealityKit
import SwiftUI

@Model
class Pet {
    var name: String
    var emailAddress: String
    var details: String
    var modelName: String
    
    init(name: String, emailAddress: String, details: String, modelName: String) {
        self.name = name
        self.emailAddress = emailAddress
        self.details = details
        self.modelName = modelName
    }
}

extension Color {
    init(hex: UInt, alpha: Double = 1) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xff) / 255,
            green: Double((hex >> 08) & 0xff) / 255,
            blue: Double((hex >> 00) & 0xff) / 255,
            opacity: alpha
        )
    }
}
