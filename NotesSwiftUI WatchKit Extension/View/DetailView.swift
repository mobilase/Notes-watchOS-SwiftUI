//
//  NoteItem.swift
//  Notes WatchKit Extension
//
//  Created by Сергей Лавров on 08.03.2021.
//

import SwiftUI

struct DetailView: View {
    
    var title: String
    var text: String
    
    var body: some View {
        VStack(alignment: .leading){
            Text(title).font(.title);
            Text(text).font(.body);
            NavigationLink(destination:EditView(), label: {
                Text("Изменить")
            }).background(Color.green).cornerRadius(5.0)
        }
        .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/,
               maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,
               minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/,
               maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,
               alignment: .topLeading)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(title: "Title", text: "Text")
    }
}
