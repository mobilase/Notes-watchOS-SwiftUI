//
//  NoteItem.swift
//  Notes WatchKit Extension
//
//  Created by Сергей Лавров on 08.03.2021.
//

import SwiftUI

struct NoteItem: View {
    
    var title: String
    var text: String
    
    var body: some View {
        VStack(alignment: .leading){
            Text(title).font(.title);
            Text(text).font(.body)
        }
        .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/,
               maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,
               minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/,
               maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,
               alignment: .topLeading)
    }
}

struct NoteItem_Previews: PreviewProvider {
    static var previews: some View {
        NoteItem(title: "Title", text: "Text")
    }
}
