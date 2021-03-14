//
//  HomeView.swift
//  NotesSwiftUI WatchKit Extension
//
//  Created by Сергей Лавров on 13.03.2021.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        GeometryReader{reader in
            let rect = reader.frame(in: .global)
            VStack(spacing: 4) {
                HStack() {
                    HomeButtonView(dest: AnyView(AddView()), image: "plus", title: "Добавить", rect: rect, color: Color("green"))
                    HomeButtonView(dest: AnyView(TableView()), image: "doc.plaintext", title: "Список", rect: rect, color: Color("blue"))
                }
                .frame(width:rect.width, height:rect.height/2, alignment: .center)
                
                HStack() {
                    HomeButtonView(dest: AnyView(AddView()), image: "magnifyingglass", title: "Искать", rect: rect, color: Color("orange"))
                    HomeButtonView(dest: AnyView(TableView()), image: "gear", title: "Настройки", rect: rect, color: Color("gray"))
                }
                .frame(width:rect.width, height:rect.height/2, alignment: .center)

            }.frame(width:rect.width, height:rect.height, alignment: .center)
            .navigationTitle("Заметки")
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
