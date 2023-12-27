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

    init() {
        ValueTransformer.setValueTransformer(ColorTransformer(),
                        forName: NSValueTransformerName("ColorTransformer"))
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: Book.self)
        }
    }
}
