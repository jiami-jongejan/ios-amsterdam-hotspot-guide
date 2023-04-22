//
//  LocalguideApp.swift
//  Localguide
//
//  Created by Jiami Jongejan on 22/4/2023.
//

import SwiftUI

@main
struct LocalguideApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
