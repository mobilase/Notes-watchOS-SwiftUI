//
//  FoundView.swift
//  NotesSwiftUI WatchKit Extension
//
//  Created by Сергей Лавров on 14.03.2021.
//

import SwiftUI

struct FoundView: View {
    
    @State var search: String = ""
    @State private var isDelete = false
    @State private var deleteNote: Note? = nil
    @FetchRequest var results : FetchedResults<Note>

    init(search: String) {
        self._results = FetchRequest<Note>(entity: Note.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Note.added, ascending: false)], predicate: NSPredicate(format: "text CONTAINS[c] %@ or title CONTAINS[c] %@", search, search), animation: .easeIn)
    }
    
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

struct FoundView_Previews: PreviewProvider {
    static var previews: some View {
        FoundView(search: "")
    }
}
