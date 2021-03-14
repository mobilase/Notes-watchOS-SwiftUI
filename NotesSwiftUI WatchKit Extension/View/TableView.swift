//
//  NoteList.swift
//  Notes WatchKit Extension
//
//  Created by Сергей Лавров on 08.03.2021.
//

import SwiftUI
import CoreData

struct TableView: View {
    
    @State var index = 0.0
    
    @FetchRequest(entity: Note.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Note.added, ascending: false)], animation: .easeIn) var results : FetchedResults<Note>
    
    var body: some View {
        VStack{
            List {
                ForEach(results, id: \.self) {
                    TableRowView(note: $0)
                }
                .onDelete {(indexSet) in
                    //notes.remove(atOffsets: indexSet)
                }
            }
            .listStyle(CarouselListStyle())
            .overlay(
                Text(results.isEmpty ? "Нет заметок" : "")
            )
        }
        .navigationTitle("Список")
    }
}

struct TableView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TableView()
        }
    }
}
