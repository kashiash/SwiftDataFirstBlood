//
//  BookDetailView.swift
//  SwiftDataFirstBlood
//
//  Created by Jacek Kosinski U on 18/12/2023.
//

import SwiftUI

struct BookDetailView: View {
    let book: Book

    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss

    @State private var isEditing = false

    @State private var title: String = ""
    @State private var author: String = ""
    @State private var publishedYear: Int? = nil

    init(book: Book) {
        self.book = book
        self._title = State(initialValue: book.title)
        self._author = State(initialValue: book.author)
        self._publishedYear = State(initialValue: book.publishedYear)
    }

    var body: some View {
        Form {
            if isEditing {
                Group {
                    TextField("Book title", text: $title)
                    TextField("Book author", text: $author)
                    TextField("Published year", value: $publishedYear, formatter: NumberFormatter())
                        .keyboardType(.numberPad)
                }
                .textFieldStyle(.roundedBorder)
            } else {
                Text(book.title)
                Text(book.author)
                Text(book.publishedYear.description)
            }
        }
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button(isEditing ? "Done" : "Edit") {
                    isEditing.toggle()
                }
            }
        }
        .navigationTitle("Book Detail")
    }
}

//#Preview {
//    BookDetailView()
//}
