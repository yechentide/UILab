//
// ExOverlay02.swift
// Created on 2023/10/18
//

import SwiftUI

struct ExOverlay02: View {
    private var imgView: some View {
        Image("img01")
            .resizable()
            .frame(width: 200, height: 200)
            .clipShape(Circle())
    }

    var body: some View {
        ScrollView {
            imgView

            imgView
                .shadow(radius: 7)
                .overlay {
                    Circle()
//                        .stroke(.gray, lineWidth: 3)
//                        .stroke(style: .init(dash: [10, 10]))
                        .stroke(.red, style: .init(dash: [10, 10]))
                }
        }
    }
}

#Preview {
    ExOverlay02()
}
