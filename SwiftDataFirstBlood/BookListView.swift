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

    @State private var bookSortOption = SortingOption.none

    var filteredBooks: [Book] {
        guard searchTerm.isEmpty == false else { return books }
        return books.filter { $0.title.localizedCaseInsensitiveContains(searchTerm) }
    }

    var body: some View {
        NavigationStack {
          BookListSubview(searchTerm: searchTerm,  bookSortOption: bookSortOption)

                .navigationDestination(for: Book.self) { book in
                    BookDetailView(book: book)
                }
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button{
                            presentAddNew.toggle()
                        } label: {
                            Image(systemName: "plus.circle.fill")
                        }
                        .buttonStyle(.borderedProminent)
                        .sheet(isPresented: $presentAddNew, content: {
                            AddNewBookView()
                        })
                    }
                    ToolbarItem(placement: .topBarTrailing) {
                        Menu {
                            ForEach(SortingOption.allCases) { sortOption in
                                Button(sortOption.title) {
                                    bookSortOption = sortOption
                                }
                            }
                        } label: {
                            Image(systemName: "ellipsis.circle")
                        }

                    }
                }
        }
        .searchable(text: $searchTerm, prompt: "Search book title")
    }
}

//#Preview {
//    BookListView()
//        .modelContainer(for: [Book.self])
//}
