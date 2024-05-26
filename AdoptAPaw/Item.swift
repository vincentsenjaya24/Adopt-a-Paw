//
//  Item.swift
//  AdoptAPaw
//
//  Created by Vincent Senjaya on 27/05/24.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
