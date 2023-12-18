//
//  BookListView.swift
//  SwiftDataFirstBlood
//
//  Created by Jacek Kosinski U on 18/12/2023.
//

import SwiftUI
import SwiftData

struct BookListView: View {
    @Query private var books: [Book]

    var body: some View {
        NavigationView {
            List {
                ForEach(books) { book in
                    BookCellView(book: book)
                }
            }
            .navigationBarTitle("Books")
        }
    }
}

#Preview {
    BookListView()
}
