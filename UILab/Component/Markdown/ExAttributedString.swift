//
// ExAttributedString.swift
// Created on 2023/10/17
//

import SwiftUI

struct ExAttributedString: View {
    private let markdown = "Visit [Design Code](https://designcode.io) to learn how to `code` and _design_."
    @State private var myString: AttributedString = ""

    var body: some View {
        Text(myString)
            .padding()
            .onAppear {
                do {
                    myString = try AttributedString(markdown: markdown)
                } catch {
                    myString = "Error creating AttributedString"
                }
            }
    }
}

#Preview {
    ExAttributedString()
}
