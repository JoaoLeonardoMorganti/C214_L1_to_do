//
//  ToDoAppApp.swift
//  ToDoApp
//
//  Created by João Leonardo Morganti on 07/05/21.
//

import SwiftUI

@main
struct ToDoAppApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
