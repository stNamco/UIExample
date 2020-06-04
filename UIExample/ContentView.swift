//
//  ContentView.swift
//  UIExample
//
//  Created by stnamco on 2020/05/12.
//  Copyright © 2020 namco. All rights reserved.
//

import SwiftUI
import UIComponent

private let dateFormatter: DateFormatter = {
    let dateFormatter = DateFormatter()
    dateFormatter.dateStyle = .medium
    dateFormatter.timeStyle = .medium
    return dateFormatter
}()

struct ContentView: View {
    @State private var dates = [Date]()

    var body: some View {
        NavigationView {
            MasterView(dates: $dates)
                .navigationBarTitle(Text("Master"))
                .navigationBarItems(
                    leading: EditButton(),
                    trailing: Button(
                        action: {
                            withAnimation { self.dates.insert(Date(), at: 0) }
                        }
                    ) {
                        Image(systemName: "plus")
                    }
                )
        }.navigationViewStyle(DoubleColumnNavigationViewStyle())
    }
}

struct MasterView: View {
    @Binding var dates: [Date]

    var body: some View {
        List {
            ForEach(dates, id: \.self) { date in
                NavigationLink(
                    destination: DetailView(selectedDate: date)
                ) {
                    Text("\(date, formatter: dateFormatter)")
                        .foregroundColor(.blue)
                }
            }.onDelete { indices in
                indices.forEach { self.dates.remove(at: $0) }
            }
        }
    }
}

struct DetailView: View {
    var selectedDate: Date?
    let bookStore = BookStore()

    var body: some View {
        VStack(spacing: 40) {
            Text("SubTitle")
            NavigationLink(destination: SecondBookContentView().environmentObject(bookStore), label: {
                Text("BookView")
            })
            HStack(spacing: 30) {
                Text("ABC")
                Text("アイウエオ")
                Text("アボガドトースト").layoutPriority(1)
                Text("アーモンドバタートースト")
            }
            ZStack {
                Text("TestCustomView").zIndex(1)
                UIComponent.HogeView()
            }.frame(width: 400, height: 400)
            Group {
                if selectedDate != nil {
                    Text("\(selectedDate!, formatter: dateFormatter)")
                } else {
                    Text("Detail view content goes here")
                }
            }.background(Color.gray).offset(x: 40, y: 0)
        }
        .navigationBarTitle(Text("Detail"))
        .navigationBarItems(trailing: NavigationLink(destination: ChildView(), label: {
            Text("Test")
        })).onAppear {
            print("appeared")
            self.bookStore.fetch(id: 1)
        }
    }

    var shareButton: some View {
        Button(action: {
            print("Button Tapped")
        }){
            Text("Button")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
