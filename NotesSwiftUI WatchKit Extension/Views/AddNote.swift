//
//  AddNote.swift
//  Notes WatchKit Extension
//
//  Created by Сергей Лавров on 08.03.2021.
//

import SwiftUI

struct AddNote: View {
    @State var title: String = ""
    @State var text: String = ""
    @State var editTitle = false
    @State var editText = false

    @Environment(\.presentationMode) var presentation
    
    var body: some View {
        VStack {
            TextField(
                "Текст",
                text: $text) {
                editText in self.editText = editText
                self.editTitle = false
            }
            Button("Сохранить"){
                ListModel.addData(note: NoteModel(title: title, text: text))
                self.presentation.wrappedValue.dismiss()
            }.background(Color.green).cornerRadius(5.0)
        }
    }
}

extension TextField {
    typealias StringCompetition = (String) -> Void
    
    func presentInputController(withSuggestions suggestions: [String], competition: @escaping StringCompetition) {
        WKExtension.shared()
            .visibleInterfaceController?
            .presentTextInputController(withSuggestions: suggestions, allowedInputMode: .plain, completion: { result in
                guard let result = result as? [String], let first = result.first else {
                    competition("")
                    return
                }
                competition(first)
            })
    }
}

struct AddNote_Previews: PreviewProvider {
    static var previews: some View {
        AddNote()
    }
}
