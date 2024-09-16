//
//  EcommerceCartApp.swift
//  EcommerceCart
//
//  Created by Rencheeraj Mohan on 15/09/24.
//

import SwiftUI

@main
struct EcommerceCartApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
