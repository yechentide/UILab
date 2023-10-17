//
// ExConditionalModifier.swift
// Created on 2023/10/17
//

import SwiftUI

extension View {
    @ViewBuilder func ifCondition<Content: View>(_ condition: Bool, transform: (Self) -> Content) -> some View {
        if condition {
            transform(self)
        } else {
            self
        }
    }
}

struct ExConditionalModifier: View {
    @State private var shouldBeRed: Bool = true
    @State private var shouldAddShadow: Bool = true

    var body: some View {
        VStack {
            Text("Hello, world!")
                .foregroundColor(shouldBeRed ? .red : .blue)
            Text("Hello, world!")
                .ifCondition(shouldAddShadow) { view in
                    view.shadow(color: .black, radius: 10, x: 0.0, y: 0.0)
                }
                .ifCondition(shouldBeRed) { view in
                    view.foregroundStyle(Color.red)
                }
        }
    }
}

#Preview {
    ExConditionalModifier()
}
