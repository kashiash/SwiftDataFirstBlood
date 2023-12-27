//
//  Previewer.swift
//  SwiftDataFirstBlood
//
//  Created by Jacek Kosinski U on 27/12/2023.
//

import Foundation
import SwiftData


@MainActor
struct Previewer {
    let container: ModelContainer
    let book: Book
    let genre: Genre
    let note: Note

    init() throws {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        container = try ModelContainer(for: Book.self, configurations: config)

        book = Book(title: "Poczytaj mi mamo 1", author: "Julian Tuwim", publishedYear: 1971)
        container.mainContext.insert(book)

        genre = Genre(name: "horror")
        genre.books.append(book)
        container.mainContext.insert(genre)

        note = Note(title: "Fajny tekst", message: "Pies ci morde lizał", book: book)
        container.mainContext.insert(note)

    }
}
