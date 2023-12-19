//
//  GenreListView.swift
//  SwiftDataFirstBlood
//
//  Created by Jacek Kosinski U on 18/12/2023.
//

import SwiftUI
import SwiftData

struct GenreListView: View {
    @Query(sort: \Genre.name) private var genres: [Genre]
    @State private var presentAddNew = false
    @Environment(\.modelContext) private var context

    var body: some View {
        NavigationStack {
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
            .navigationTitle("Literary Genres")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button{
                        presentAddNew.toggle()
                    } label: {
                        Image(systemName: "plus.circle.fill")
                    }
                    .buttonStyle(.borderedProminent)
                    .sheet(isPresented: $presentAddNew, content: {
                        AddNewGenre()
                            .presentationDetents([.fraction(0.3)])
                            .interactiveDismissDisabled()
                    })
                }
            }
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

#Preview {
    GenreListView()
}
