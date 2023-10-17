//
// ExLazyVGrid.swift
// Created on 2023/10/18
//

import SwiftUI

struct ExLazyVGrid: View {
    var body: some View {
        LazyVGrid(
            columns: [GridItem(.adaptive(minimum: 80), spacing: 16)],
            spacing: 16) {

            ForEach(0 ..< 6) { item in
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.blue)
                    .frame(height: 100)
            }
        }
        .padding()
    }
}

#Preview {
    ExLazyVGrid()
}
