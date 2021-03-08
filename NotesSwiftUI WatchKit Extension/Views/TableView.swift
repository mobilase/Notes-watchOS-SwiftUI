//
//  NoteList.swift
//  Notes WatchKit Extension
//
//  Created by Сергей Лавров on 08.03.2021.
//

import SwiftUI

struct TableView: View {
    
    @State var notes: [Note]
    @State var index = 0.0
    
    var body: some View {
        VStack{
            NavigationLink(destination:AddNoteView(), label: {
                Text("Добавить")
            }).background(Color.green).cornerRadius(5.0)
            List {
                ForEach(notes) {note in
                    TableRowView(note: note)
                }
                .onDelete { (indexSet) in
                    notes.remove(atOffsets: indexSet)
                }
            }
            .listStyle(CarouselListStyle.init());

        }
    }
}

struct TableView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TableView(notes: Note.notes)
        }
    }
}
