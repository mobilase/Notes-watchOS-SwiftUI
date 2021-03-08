//
//  ListModel.swift
//  Notes WatchKit Extension
//
//  Created by Сергей Лавров on 08.03.2021.
//

import Foundation

struct ListModel {
    
    static var nodes: [NoteModel] = [
        NoteModel(title: "1", text: "1"),
        NoteModel(title: "22", text: "22 22"),
        NoteModel(title: "333", text: "333 333 333"),
        NoteModel(title: "4444", text: "4444 4444 4444 4444")
    ]
    
    static func getData() -> [NoteModel] {
        return self.nodes
    }
    
    static func addData(note: NoteModel) {
        self.nodes.append(note)
    }
}
