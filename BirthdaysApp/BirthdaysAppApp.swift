//
//  BirthdaysAppApp.swift
//  BirthdaysApp
//
//  Created by India Poetzscher on 4/26/25.
//

import SwiftUI
import SwiftData

@main
struct BirthdaysAppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: Friend.self)
        }
    }
}
