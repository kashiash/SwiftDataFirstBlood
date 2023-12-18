//
//  ContentView.swift
//  SwiftDataFirstBlood
//
//  Created by Jacek Kosinski U on 17/12/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var presentAddNew = false
    var body: some View {
        TabView {
            BookListView()
                .tabItem {
                    Image(systemName: "books.vertical.fill")
                    Text("Books")
                }
            GenreListView()
                .tabItem {
                    Image(systemName: "gear.circle")
                    Text("Genre")
                }
        }
    }
}

#Preview {
    ContentView()
}
