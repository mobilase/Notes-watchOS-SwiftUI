//
//  AddView.swift
//  NotesSwiftUI WatchKit Extension
//
//  Created by Сергей Лавров on 14.03.2021.
//

import SwiftUI

struct AddView: View {

    @State var title: String = ""
    @State var text: String = ""
    @State var editTitle = false
    @State var editText = false
    
    @Environment(\.managedObjectContext) var context
    @Environment(\.presentationMode) var presentation
        
    var body: some View {
        VStack {
            TextField(
                "Заголовок",
                text: $title) {
                editTitle in self.editTitle = editTitle
                self.editText = false
            }
            TextField(
                "Текст",
                text: $text) {
                editText in self.editText = editText
                self.editTitle = false
            }
            Button(action: addNote, label: {
                Text("Сохранить")
                    .padding(.vertical, 10)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .background(Color("green"))
                    .cornerRadius(15)
            })
            .padding(.horizontal)
            .buttonStyle(PlainButtonStyle())
            .disabled(title == "" && text == "")
        }
        .navigationTitle("Добавление")
    }
    
    func addNote() {
        let note = Note(context: context)
        note.title = title
        note.text = text
        note.added = Date()
        note.edited = Date()
        do{
            try context.save()
            presentation.wrappedValue.dismiss()
        } catch {
            print(error.localizedDescription)
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView()
    }
}
