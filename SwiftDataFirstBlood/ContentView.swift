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
        VStack {
            BookListView()

            Button("Add new book") {
                presentAddNew.toggle()
            }
            .sheet(isPresented: $presentAddNew, content: {
                AddNewBookView()
            })
        }
    }
}

#Preview {
    ContentView()
}
