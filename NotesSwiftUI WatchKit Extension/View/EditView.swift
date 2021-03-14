//
//  AddNote.swift
//  Notes WatchKit Extension
//
//  Created by Сергей Лавров on 08.03.2021.
//

import SwiftUI

struct EditView: View {
    
    @State var note: Note
    
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
            Button(action: saveNote, label: {
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
        .navigationTitle("Изменение")
        .onLoad{
            title = note.title ?? ""
            text = note.text ?? ""
        }
    }
    
    func saveNote() {
        note.title = title
        note.text = text
        note.edited = Date()
        do{
            try context.save()
            presentation.wrappedValue.dismiss()
        } catch {
            print(error.localizedDescription)
        }
    }
}

struct EditView_Previews: PreviewProvider {
    static var previews: some View {
        EditView(note: Note())
    }
}
