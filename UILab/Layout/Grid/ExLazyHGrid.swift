//
// ExLazyHGrid.swift
// Created on 2023/10/18
//

import SwiftUI

struct ExLazyHGrid: View {
    var body: some View {
        ScrollView(.horizontal) {
            LazyHGrid(
                rows: [GridItem(.adaptive(minimum: 80), spacing: 8)],
                spacing: 12
            ) {
                ForEach(0 ..< 20) { item in
                    Rectangle().frame(width: 100)
                }
            }
            .frame(height: 500)
        }
    }
}

#Preview {
    ExLazyHGrid()
}
