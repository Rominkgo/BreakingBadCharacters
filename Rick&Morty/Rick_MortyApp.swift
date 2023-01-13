//
//  Rick_MortyApp.swift
//  Rick&Morty
//
//  Created by Default on 1/13/23.
//

import SwiftUI

@main
struct Rick_MortyApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
