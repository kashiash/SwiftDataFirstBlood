//
//  SwiftDataFirstBloodApp.swift
//  SwiftDataFirstBlood
//
//  Created by Jacek Kosinski U on 17/12/2023.
//

import SwiftUI
import SwiftData

@main
struct SwiftDataFirstBloodApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: Book.self)
        }
    }
}
