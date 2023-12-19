//
//  BookListSubview.swift
//  SwiftDataFirstBlood
//
//  Created by Jacek Kosinski U on 19/12/2023.
//

import SwiftUI
import SwiftData

struct BookListSubview: View {
    @Environment(\.modelContext) private var context
    @Query private var books: [Book]

    var searchTerm: String

    init(searchTerm: String = "") {
        self.searchTerm = searchTerm
        if searchTerm.isEmpty {
            _books = Query()
        } else {
            _books = Query(filter: #Predicate { $0.title.localizedStandardContains(searchTerm)})
        }
    }
    
    var body: some View {
        List {
            ForEach(books) { book in
                NavigationLink(value: book) {
                    BookCellView(book: book)
                }

            }
            .onDelete(perform: delete(indexSet:))
        }
    }



    private func delete(indexSet: IndexSet) {
        indexSet.forEach { index in
            let book = books[index]
            context.delete(book)

            do {
                try context.save()
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}
