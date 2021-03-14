//
//  NavButtonView.swift
//  NotesSwiftUI WatchKit Extension
//
//  Created by Сергей Лавров on 13.03.2021.
//

import SwiftUI

struct HomeButtonView: View {
    var dest: AnyView
    var image: String
    var title: String
    var rect: CGRect
    var color: Color
    
    var body: some View {
            NavigationLink(
                destination: dest,
                label: {
                    VStack(){
                        Image(systemName: image)
                            .font(.title2)
                            .frame(width: rect.width / 3, height: rect.height / 3, alignment: .center)
                            .background(color)
                            .clipShape(Circle())
                        Text(title)
                            .font(.system(size: 15))
                            .foregroundColor(.white)
                    }.frame(width: rect.width / 2 - 10, height: rect.height / 2 - 10, alignment: .center)
                }
            )
            .buttonStyle(PlainButtonStyle())
        }

}

struct HomveButtonView_Previews: PreviewProvider {
    static var previews: some View {
        HomeButtonView(dest: AnyView(EditView()), image: "plus", title: "Add", rect: CGRect(x: 150, y: 150, width: 150, height: 150), color: Color("green"))
    }
}
