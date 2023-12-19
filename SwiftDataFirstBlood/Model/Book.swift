//
//  Book.swift
//  SwiftDataFirstBlood
//
//  Created by Jacek Kosinski U on 17/12/2023.
//

import Foundation
import SwiftData

@Model
final class Book {
    var title: String
    var author: String
    var publishedYear: Int

    @Attribute(.externalStorage)
    var cover: Data?

    @Relationship(deleteRule: .cascade, inverse: \Note.book)
    var notes = [Note]()

    @Relationship(deleteRule: .nullify, inverse: \Genre.books)
    var genres = [Genre]()

    init(title: String, author: String, publishedYear: Int) {
        self.title = title
        self.author = author
        self.publishedYear = publishedYear
    }
}
