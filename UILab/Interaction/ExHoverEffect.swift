//
// ExHoverEffect.swift
// Created on 2023/10/18
//

import SwiftUI

// iPadOS & MacOS only
struct ExHoverEffect: View {
    @State var isHover = false

    var body: some View {
        VStack {
            Button(action: {}) {
                Text("Hover Effect")
            }
            .padding()
            .contentShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
            .hoverEffect(.lift)

            Text("Hover Effect")
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                        .trim(from: isHover ? 0 : 1, to: 1)
                        .stroke(Color.black.opacity(1), lineWidth: 1)
                )
                .scaleEffect(isHover ? 1.2 : 1)
                .animation(.spring(), value: isHover)
                .onHover { hover in
                    isHover = hover
                }
        }
    }
}

#Preview {
    ExHoverEffect()
}
