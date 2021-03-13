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
                    NavigationLink(
                        destination: AddNoteView(),
                        label: {
                            NavButtonView(image: "plus", title: "Add", rect: rect, color: Color("green"))
                        }
                    )
                    .buttonStyle(PlainButtonStyle())
                    NavigationLink(
                        destination: TableView(notes: NoteList.notes),
                        label: {
                            NavButtonView(image: "doc.plaintext", title: "List", rect: rect, color: Color("blue"))
                        }
                    )
                    .buttonStyle(PlainButtonStyle())
                }
                .frame(width:rect.width, height:rect.height/2, alignment: .center)
                
                HStack() {
                    NavigationLink(
                        destination: AddNoteView(),
                        label: {
                            NavButtonView(image: "star", title: "Rating", rect: rect, color: Color("yellow"))
                        }
                    )
                    .buttonStyle(PlainButtonStyle())
                    NavigationLink(
                        destination: TableView(notes: NoteList.notes),
                        label: {
                            NavButtonView(image: "gear", title: "Settings", rect: rect, color: Color("gray"))
                        }
                    )
                    .buttonStyle(PlainButtonStyle())
                }
                .frame(width:rect.width, height:rect.height/2, alignment: .center)

            }.frame(width:rect.width, height:rect.height, alignment: .center)
        }
    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
