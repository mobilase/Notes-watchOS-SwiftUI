//
//  NavButtonView.swift
//  NotesSwiftUI WatchKit Extension
//
//  Created by Сергей Лавров on 13.03.2021.
//

import SwiftUI

struct NavButtonView: View {
    var image: String
    var title: String
    var rect: CGRect
    var color: Color
    
    var body: some View {
        VStack(){
            Image(systemName: image)
                .font(.title2)
                .frame(width: rect.width / 3, height: rect.height / 3, alignment: .center)
                .background(color)
                .clipShape(Circle())
            Text(title)
                .font(.body)
                .foregroundColor(.white)
        }.frame(width: rect.width / 2 - 10, height: rect.height / 2 - 10, alignment: .center)
    }
}

struct NavButtonView_Previews: PreviewProvider {
    static var previews: some View {
        NavButtonView(image: "plus", title: "Add", rect: CGRect(x: 200, y: 200, width: 200, height: 200), color: Color("green"))
    }
}
