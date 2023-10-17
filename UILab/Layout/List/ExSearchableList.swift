//
// ExSearchableList.swift
// Created on 2023/10/18
//

import SwiftUI

fileprivate struct Author: Identifiable {
    var id = UUID()
    var name: String
}
fileprivate let authors = [
    Author(name: "Meng To"),
    Author(name: "Stephanie Diep"),
    Author(name: "Willie Yam"),
    Author(name: "Sai Kambampati")
]

struct ExSearchableList: View {
    @State private var text = ""
    @State private var updatedAuthors: [Author] = []

    var body: some View {
        NavigationView {
            List(text == "" ? authors : updatedAuthors) {
                    Text($0.name)
            }
            .searchable(text: $text)
        }
        .onChange(of: text) { _, searchValue in
            updatedAuthors = authors.filter { $0.name.contains(searchValue)}
        }
    }
}

#Preview {
    ExSearchableList()
}
