//
// ExAsyncImage.swift
// Created on 2023/10/17
//

import SwiftUI

struct ExAsyncImage: View {
    private let url = URL(string: "https://avatars.githubusercontent.com/u/48203714?v=4")!

    var body: some View {
        AsyncImage(url: url) { image in
            image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: 220, alignment: .center)
        } placeholder: {
            ProgressView()
        }
    }
}

#Preview {
    ExAsyncImage()
}
