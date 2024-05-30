//
//  AdoptAPawApp.swift
//  AdoptAPaw
//
//  Created by Vincent Senjaya on 27/05/24.
//

import SwiftUI
import SwiftData

@main
struct AdoptAPawApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Pet.self)
    }
}
