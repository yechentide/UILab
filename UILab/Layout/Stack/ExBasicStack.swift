//
// ExBasicStack.swift
// Created on 2023/10/17
//

import SwiftUI

struct ExBasicStack: View {
    func makeBlock(_ color: UIColor, _ opacity: Double = 1.0) -> some View {
        RoundedRectangle(cornerRadius: 10)
            .frame(width: 150, height: 100)
            .foregroundStyle(Color(uiColor: color).opacity(opacity))
    }

    var body: some View {
        VStack(alignment: .center, spacing: 16) {
            makeBlock(.green, 0.5)

            HStack {
                makeBlock(.red, 0.5)
                makeBlock(.systemPink, 0.5)
            }
            .padding()
            .background(Color.gray.opacity(0.2))

            ZStack {
                makeBlock(.blue, 0.5)
                makeBlock(.orange, 0.5)
                    .scaleEffect(.init(width: 0.5, height: 0.5))
            }
            .padding()
            .background(Color.gray.opacity(0.2))
        }
    }
}

#Preview {
    ExBasicStack()
}
