//
//  GenreListSubview.swift
//  SwiftDataFirstBlood
//
//  Created by Jacek Kosinski U on 19/12/2023.
//
import SwiftData
import SwiftUI
import Foundation

struct GenreListSubview: View {
    @Query private var genres: [Genre]
    @Environment(\.modelContext) private var context

    init(sortOrder: GenreSortOrder = .forward) {
        _genres = Query(FetchDescriptor<Genre>(sortBy: [sortOrder.sortOption]), animation: .snappy)
    }

    var body: some View {
        List {
            ForEach(genres) { genre in
                NavigationLink(value: genre) {
                    Text(genre.name)
                }
                .navigationDestination(for: Genre.self) { genre in
                    GenreDetailView(genre: genre)
                }
            }
            .onDelete(perform: deleteGenre(indexSet:))

        }
    }

    private func deleteGenre(indexSet: IndexSet) {
        indexSet.forEach { index in
            let genreToDelete = genres[index]
            context.delete(genreToDelete)
            do {
                try context.save()
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}
