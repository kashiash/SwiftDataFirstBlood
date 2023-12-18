//
//  AddNewGenre.swift
//  SwiftDataFirstBlood
//
//  Created by Jacek Kosinski U on 18/12/2023.
//

import SwiftUI
import SwiftData

struct AddNewGenre: View {
    @State private var name: String = ""

    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        NavigationStack {
            VStack {
                TextField("Add New Genre", text: $name)
                    .textFieldStyle(.roundedBorder)
                    .navigationTitle("Add New Genre")
                    .padding(.horizontal)

                HStack {
                    Button("Save") {
                        let genre = Genre(name: name)
                        context.insert(genre)
                        do {
                            try context.save()
                        } catch {
                            print(error.localizedDescription)
                        }
                        dismiss()
                    }
                    .buttonStyle(.borderedProminent)

                    Button("Cancel") {
                        dismiss()
                    }
                    .buttonStyle(.bordered)
                }

                Spacer()
            }
        }
    }
}

#Preview {
    AddNewGenre()
}
