//
//  NoteItem.swift
//  Notes WatchKit Extension
//
//  Created by Сергей Лавров on 08.03.2021.
//

import SwiftUI

struct DetailView: View {
    
    @State var note: Note
    
    var body: some View {
        VStack(alignment: .leading){
            NavigationLink(destination: EditView(note: note)) {
                ScrollView {
                    Text(note.text ?? "")
                        .font(.body)
                        .lineLimit(nil)
                        .fixedSize(horizontal: false, vertical: true)
                }
            }
        }
        .navigationTitle(note.title ?? "")
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(note: Note())
    }
}
