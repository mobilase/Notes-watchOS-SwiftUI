//
//  NoteList.swift
//  Notes WatchKit Extension
//
//  Created by Сергей Лавров on 08.03.2021.
//

import SwiftUI

struct NoteList: View {
    
    @State var notes: [NoteModel]
    @State var index = 0.0
    
    var body: some View {
        VStack{
            List {
                ForEach(notes) {note in
                    NavigationLink( destination:NoteItem(title: note.title, text: note.text)) {
                        Text(note.title)
                    }
                    .listRowPlatterColor(Color.gray)
                }
                .onDelete { (indexSet) in
                    notes.remove(atOffsets: indexSet)
                }
            }
            .listStyle(CarouselListStyle.init());
            NavigationLink(destination:AddNote(), label: {
                Text("Добавить")
            }).background(Color.green).cornerRadius(5.0)
        }
    }
}

struct NoteList_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            NoteList(notes: ListModel.getData())
        }
    }
}
