//
//  NotesApp.swift
//  Notes WatchKit Extension
//
//  Created by Сергей Лавров on 08.03.2021.
//

import SwiftUI

@main
struct NotesApp: App {
    let container = PersistenceController.shared.container
    var body: some Scene {
        WindowGroup {
            NavigationView {
                HomeView()
            }
            .environment(\.managedObjectContext, container.viewContext)
        }
    }
}
