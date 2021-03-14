//
//  TableRowView.swift
//  NotesSwiftUI WatchKit Extension
//
//  Created by Сергей Лавров on 08.03.2021.
//

import SwiftUI

struct TableRowView: View {
    
    @State var note: Note
    
    var body: some View {
        NavigationLink( destination: DetailView(title: note.title ?? "", text: note.text ?? "")) {
            VStack {
                Text(note.title ?? "")
                    .frame(
                        minWidth: 0.0,
                        maxWidth: .infinity,
                        alignment: .topLeading)
                Text(getFormat().string(from: note.edited ?? Date()))
                    .font(.system(size: 8))
                    .foregroundColor(Color("gray"))
            }
        }
    }
    
    func getFormat() -> DateFormatter {
        let format = DateFormatter()
        format.dateFormat = "yyyy.MM.dd"
        return format
    }
}

struct TableRowView_Previews: PreviewProvider {
    static var previews: some View {
        TableRowView(note: Note())
    }
}
