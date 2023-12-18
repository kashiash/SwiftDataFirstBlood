//
//  NotesListView.swift
//  SwiftDataFirstBlood
//
//  Created by Jacek Kosinski U on 18/12/2023.
//

import SwiftUI

struct NotesListView: View {
    let book: Book
    @Environment(\.modelContext) private var context

    var body: some View {
        List {
            ForEach(book.notes) { note in

                VStack {
                    Text(note.title)
                        .bold()
                    Text(note.message)

                }
            }
            .onDelete(perform: deleteNote)
        }
    }
    private func deleteNote(indexSet: IndexSet) {
            indexSet.forEach { index in
                let note = book.notes[index]
                context.delete(note)
                book.notes.remove(at: index)
                do {
                    try context.save()
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
}

//#Preview {
//    NotesListView()
//}
