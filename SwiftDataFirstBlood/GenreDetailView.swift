//
//  GenreDetailView.swift
//  SwiftDataFirstBlood
//
//  Created by Jacek Kosinski U on 19/12/2023.
//

import SwiftUI

struct GenreDetailView: View {
    let genre: Genre

    var body: some View {
        VStack {
            Group {
                if genre.books.isEmpty {
                    ContentUnavailableView("No data", systemImage: "square.stack.3d.up.slash"
                    )
                } else {
                    List(genre.books) { book in
                        Text(book.title)
                    }
                }
            }
            .navigationTitle(genre.name)
        }
    }
}

//#Preview {
//    GenreDetailView()
//}
