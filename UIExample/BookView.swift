//
//  BookView.swift
//  UIExample
//
//  Created by stnamco on 2020/06/04.
//  Copyright © 2020 namco. All rights reserved.
//

import SwiftUI

//struct BookContentView: View {
////    @State private var isFavorite: Bool = false
////    @ObservedObject var bookStore = BookStore()
//    ＠EnvironmentObject var bookStore: BookStore
//
//    init() {
//        bookStore.fetch(id: 1)
//    }
//
//    var body: AnyView {
//        guard let book = bookStore.book else {
//            return AnyView(Text("Loading..."))
//        }
//
//        return AnyView(
//            BookView(book: book, isFavorite: $bookStore.isFavorite)
//        )
//    }
//}

struct SecondBookContentView: View {

    @EnvironmentObject var bookStore: BookStore

    var body: AnyView {
        return bookStore.isLoading ? AnyView(Text("isLoading")) : AnyView(BookView())
    }
}



struct BookView: View {
    //    let title: String
    //    let author: String
    //    let coverColor: Color
    //    @State private var isFavorite: Bool = false

    //    var book: Book
    //    @Binding var isFavorite: Bool

    @EnvironmentObject var bookStore: BookStore

    var body: AnyView {
        guard let book = bookStore.book else {
            return AnyView(Text("Loading..."))
        }

        return AnyView(VStack(alignment: .center) {
            HStack {
                Spacer()
                Button(action: {
//                    self.$bookStore.isFavorite.toggle()

                }){
                    Text("Button").foregroundColor(.white).bold()
                }
            }
            Text(book.title).lineLimit(2)
            Text(book.author)
            Circle().frame(width: 40)
            Spacer(minLength: 10)
        }.padding(20).frame(width: 310, height: 300)

        )
    }
}

struct BookContentView_Previews: PreviewProvider {

    static var previews: some View {
//        BookContentView()
        let store = BookStore()
        return SecondBookContentView().environmentObject(store)
    }
}


// MARK: - Model

struct Book {
    let id: Int
    let title: String
    let author: String
    let coverColor: Color
}

// MARK: - Store

class BookStore: ObservableObject {
    @Published var book: Book? = nil

    var isFavorite: Bool = false {
        willSet {
            if newValue != isFavorite {
                objectWillChange.send()
            }
        }
    }

    var isLoading: Bool = false {
        willSet {
            if newValue != isLoading {
                objectWillChange.send()
            }
        }
    }

    func fetch(id: Int) {
        if let book = book, id == book.id { return }
        isLoading = true

        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.book = Book(id: 1, title: "HogeNote", author: "Hoge", coverColor: .green)
            self.isFavorite = false
            self.isLoading = false
        }
    }
}
