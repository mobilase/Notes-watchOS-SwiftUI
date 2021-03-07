//
//  NoteList.swift
//  Notes WatchKit Extension
//
//  Created by Сергей Лавров on 08.03.2021.
//

import SwiftUI

struct NoteList: View {
    
    var notes: [NoteModel]
    
    var body: some View {
        List {
            ForEach(notes) {note in
                NavigationLink( destination:NoteItem(title: note.title, text: note.text)) {
                    Text(note.title)
                }
            }.listRowPlatterColor(Color.gray)
        }
    }
}

struct NoteList_Previews: PreviewProvider {
    static var previews: some View {
        NoteList(notes: NoteModel.getData())
    }
}
