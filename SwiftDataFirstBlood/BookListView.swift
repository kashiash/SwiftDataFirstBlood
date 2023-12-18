//
//  BookListView.swift
//  SwiftDataFirstBlood
//
//  Created by Jacek Kosinski U on 18/12/2023.
//

import SwiftUI
import SwiftData

struct BookListView: View {
    @Environment(\.modelContext) private var context
    @Query private var books: [Book]
    @State private var presentAddNew = false

    var body: some View {
        NavigationStack {
            List {
                ForEach(books) { book in
                    BookCellView(book: book)
                }
                .onDelete(perform: delete(indexSet:))
            }
            .navigationBarTitle("Books")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button{
                        presentAddNew.toggle()
                    } label: {
                        Image(systemName: "plus.circle.fill")
                    }
                    .buttonStyle(.borderedProminent)
                    .sheet(isPresented: $presentAddNew, content: {
                        AddNewBookView()
                    })
                }
            }
        }
    }
    private func delete(indexSet: IndexSet) {
        indexSet.forEach { index in
            let book = books[index]
            context.delete(book)

            do {
                try context.save()
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}

#Preview {
    BookListView()
        .modelContainer(for: [Book.self])
}
