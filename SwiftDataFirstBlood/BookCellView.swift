//
//  BookCellView.swift
//  SwiftDataFirstBlood
//
//  Created by Jacek Kosinski U on 18/12/2023.
//

import SwiftUI

struct BookCellView: View {
    let book: Book
    
    var body: some View {
        NavigationLink(value: book) {
            HStack (alignment: .top) {
                if let cover = book.cover, let image = UIImage(data: cover) {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFit()
                        .clipShape(.rect(cornerRadius: 5))
                        .frame(height: 100)
                }
                VStack(alignment: .leading) {
                    Text(book.title)
                        .bold()
                    HStack {
                        Text("Author: \(book.author)")
                        Spacer()
                        Text("Published on: \(book.publishedYear.description)")
                    }
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                    .padding(.top, 20)
                    
                    if !book.genres.isEmpty {
                        HStack {
                            ForEach(book.genres) { genre in
                                Text(genre.name)
                                    .font(.caption)
                                    .padding(.horizontal)
                                    .background(.green.opacity(0.3), in: Capsule())
                            }
                        }
                    }
                }
            }
        }
        .navigationDestination(for: Book.self) { book in
            BookDetailView(book: book)
        }
    }
}

//#Preview {
//    BookCellView()
//}
