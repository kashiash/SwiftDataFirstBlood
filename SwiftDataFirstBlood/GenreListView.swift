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
    @State private var sortOption: GenreSortOrder = .forward

    var body: some View {
        NavigationStack {
            GenreListSubview(sortOrder: sortOption)
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
                ToolbarItem(placement: .topBarLeading) {
                    Button{
                        sortOption = sortOption == .forward ? .reverse : .forward
                    } label: {
                        Image(systemName: "arrow.up.arrow.down")
                    }
                    .buttonStyle(.borderedProminent)
                }
            }
        }
    }
}

#Preview {
    GenreListView()
}
