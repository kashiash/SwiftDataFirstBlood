//
//  BookListView.swift
//  SwiftDataFirstBlood
//
//  Created by Jacek Kosinski U on 18/12/2023.
//

import SwiftUI
import SwiftData

struct BookListView: View {
    @Environment(\.modelContext) private var context
    @Query private var books: [Book]
    @State private var presentAddNew = false
    
    @State private var searchTerm: String = ""
    var filteredBooks: [Book] {
        guard searchTerm.isEmpty == false else { return books }
        return books.filter { $0.title.localizedCaseInsensitiveContains(searchTerm) }
    }
    
    var body: some View {
        NavigationStack {
            BookListSubview(searchTerm: searchTerm)
                .searchable(text: $searchTerm, prompt: "Search book title")
                .navigationDestination(for: Book.self) { book in
                    BookDetailView(book: book)
                }
                .searchable(text: $searchTerm, prompt: "Search book title")
        }
    }
}

//#Preview {
//    BookListView()
//        .modelContainer(for: [Book.self])
//}
