//
//  NoteModel.swift
//  Notes WatchKit Extension
//
//  Created by Сергей Лавров on 08.03.2021.
//

import Foundation

struct NoteModel: Identifiable {
    var id = UUID()
    var title: String
    var text: String
}
