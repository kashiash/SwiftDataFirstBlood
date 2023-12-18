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

    init(title: String, author: String, publishedYear: Int) {
        self.title = title
        self.author = author
        self.publishedYear = publishedYear
    }
}
