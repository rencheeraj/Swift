//
//  ToDoListAppApp.swift
//  ToDoListApp
//
//  Created by Rencheeraj Mohan on 17/08/24.
//
import FirebaseCore
import SwiftUI

@main
struct ToDoListAppApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
