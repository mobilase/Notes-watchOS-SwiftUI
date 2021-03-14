//
//  SearchView.swift
//  NotesSwiftUI WatchKit Extension
//
//  Created by Сергей Лавров on 14.03.2021.
//

import SwiftUI

struct SearchView: View {
    
    @State var search: String = ""
    @State var editSearch = false
    
    @Environment(\.managedObjectContext) var context
    @Environment(\.presentationMode) var presentation
        
    var body: some View {
        VStack {
            TextField(
                "Что искать?",
                text: $search) {
                editSearch in self.editSearch = editSearch
            }
            NavigationLink(destination: FoundView(search: search), label: {
                Text("Искать")
                    .padding(.vertical, 10)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .background(Color("green"))
                    .cornerRadius(15)
            })
            .padding(.horizontal)
            .buttonStyle(PlainButtonStyle())
            .disabled(search == "")
        }
        .navigationTitle("Поиск")
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
