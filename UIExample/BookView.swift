//
//  BookView.swift
//  UIExample
//
//  Created by stnamco on 2020/06/04.
//  Copyright © 2020 namco. All rights reserved.
//

import SwiftUI

struct BookView: View {
    let title: String
    let author: String
    let coverColor: Color
    @State private var isFavorite: Bool = false

    var body: some View {
        VStack(alignment: .center) {
            HStack {
                Spacer()
                Button(action: {
                    self.isFavorite.toggle()
                }){
                    Text("Button").foregroundColor(.white).bold()
                }
            }
            Text(title).lineLimit(2)
            Text(author)
            Spacer(minLength: 10)
        }
        .padding(20).frame(width: 310, height: 300)
        .background(coverColor)
    }
}

struct BookView_Previews: PreviewProvider {
    static var previews: some View {
        BookView(title: "Test", author: "Hoge", coverColor: Color.gray)
    }
}

