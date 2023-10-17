//
// VerticalBars.swift
// Created on 2023/10/18
//

import SwiftUI

struct VerticalBars: View {
    @State private var shouldAnimate = false

    var body: some View {
        HStack(alignment: .center, spacing: shouldAnimate ? 15 : 5) {
            Capsule(style: .continuous)
                .fill(Color.blue)
                .frame(width: 10, height: 50)
            Capsule(style: .continuous)
                .fill(Color.blue)
                .frame(width: 10, height: 30)
            Capsule(style: .continuous)
                .fill(Color.blue)
                .frame(width: 10, height: 50)
            Capsule(style: .continuous)
                .fill(Color.blue)
                .frame(width: 10, height: 30)
            Capsule(style: .continuous)
                .fill(Color.blue)
                .frame(width: 10, height: 50)
        }
        .background(Color.gray.opacity(0.3))
        .animation(Animation.easeInOut(duration: 1).repeatForever(autoreverses: true), value: shouldAnimate)
        .onAppear {
            self.shouldAnimate = true
        }
    }
}

#Preview {
    VerticalBars()
}
