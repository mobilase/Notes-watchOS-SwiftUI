//
//  AddNote.swift
//  Notes WatchKit Extension
//
//  Created by Сергей Лавров on 08.03.2021.
//

import SwiftUI

struct AddNoteView: View {
    
    @State var title: String = ""
    @State var text: String = ""
    @State var editTitle = false
    @State var editText = false

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
            Button("Сохранить"){
                NoteList.notes.append(Note(title: title, text: text))
                self.presentation.wrappedValue.dismiss()
            }.background(Color.green).cornerRadius(5.0)
        }
    }
}

struct AddNoteView_Previews: PreviewProvider {
    static var previews: some View {
        AddNoteView()
    }
}
