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
    @State private var isDelete = false
    @State private var deleteNote: Note? = nil
    
    @FetchRequest(entity: Note.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Note.added, ascending: false)], animation: .easeIn) var results : FetchedResults<Note>
    
    @Environment(\.managedObjectContext) var context
    
    var body: some View {
        VStack{
            List {
                ForEach(results, id: \.self) {
                    TableRowView(note: $0)
                }
                .onDelete {offset in
                    isDelete = true
                    deleteNote = results[offset.first!]
                }
            }
            .listStyle(CarouselListStyle())
            .overlay(
                Text(results.isEmpty ? "Нет заметок" : "")
            )
        }
        .navigationTitle("Список")
        .alert(isPresented: $isDelete, content: {
            Alert(title: Text("Подтверждение"), message: Text("Удалить эту заметку?"), primaryButton: .default(Text("Да"), action: {
                deleteNote(note: deleteNote)
            }), secondaryButton: .destructive(Text("Отмена")))
        })
    }
    
    func deleteNote(note: Note?) {
        if note == nil {
            return
        }
        context.delete(note!)
        do {
            try context.save()
        } catch {
            print(error.localizedDescription)
        }
    }
}

struct TableView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TableView()
        }
    }
}
