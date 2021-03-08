//
//  TableRowView.swift
//  NotesSwiftUI WatchKit Extension
//
//  Created by Сергей Лавров on 08.03.2021.
//

import SwiftUI

struct TableRowView: View {
    
    @State var note: Note
    
    var body: some View {
        NavigationLink( destination: DetailView(title: note.title, text: note.text)) {
            Text(note.title)
                .frame(
                    minWidth: 0.0,
                    maxWidth: .infinity,
                    alignment: .topLeading)
                
        }
    }
}

struct TableRowView_Previews: PreviewProvider {
    static var previews: some View {
        TableRowView(note: Note(title: "Title", text: "Text"))
    }
}
