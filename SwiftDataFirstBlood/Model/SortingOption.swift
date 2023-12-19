//
//  SortingOption.swift
//  SwiftDataFirstBlood
//
//  Created by Jacek Kosinski U on 19/12/2023.
//

import Foundation

enum SortingOption: String, Identifiable, CaseIterable {

    var id: Self { return self }

    case title
     case author
     case publishedYear
     case none

    var title: String {
        switch self {
        case .title:
            return "Title"
        case .author:
            return "Author"
        case .publishedYear:
            return "Published Year"
        case .none:
            return "None"
        }
    }

    var sortOption: SortDescriptor<Book> {
        switch self {
        case .title:
            SortDescriptor(\Book.title, order: .forward)
        case .author:
            SortDescriptor(\Book.author, order: .forward)
        case .publishedYear:
            SortDescriptor(\Book.publishedYear, order: .forward)
        case .none:
            SortDescriptor(\Book.title)
        }
    }
}
