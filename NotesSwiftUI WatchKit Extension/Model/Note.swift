//
//  NoteModel.swift
//  Notes WatchKit Extension
//
//  Created by Сергей Лавров on 08.03.2021.
//

import Foundation

struct Note: Identifiable {
    var id = UUID()
    var title: String
    var text: String
    
    static var notes: [Note] = [
        Note(title: "1", text: "1"),
        Note(title: "22", text: "22 22"),
        Note(title: "333", text: "333 333 333"),
        Note(title: "4444", text: "4444 4444 4444 4444"),
        Note(title: "55555", text: "55555 55555 55555 55555 55555")
    ]
}
