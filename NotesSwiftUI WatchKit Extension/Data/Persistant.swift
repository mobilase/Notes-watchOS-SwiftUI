//
//  Persistant.swift
//  NotesSwiftUI WatchKit Extension
//
//  Created by Сергей Лавров on 13.03.2021.
//

import CoreData

struct PersistenceController {
    static let shared = PersistenceController()
    
    let container: NSPersistentContainer
    
    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "Data")
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        container.loadPersistentStores(completionHandler: {
            (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unrsolved error \(error),\(error.userInfo)")
            }
        })
    }
}
