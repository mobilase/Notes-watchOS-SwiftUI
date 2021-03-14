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
            Text(note.text ?? "").font(.body);
            NavigationLink(destination:EditView(note: note), label: {
                Text("Изменить")
            }).background(Color.green).cornerRadius(5.0)
        }
        .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/,
               maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,
               minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/,
               maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,
               alignment: .topLeading)
        .navigationTitle(note.title ?? "")
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(note: Note())
    }
}
