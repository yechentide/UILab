//
// ExLazyStack.swift
// Created on 2023/10/17
//

import SwiftUI

struct ExLazyStack: View {
    func makeBlock(text: String, _ color: Color, _ opacity: Double = 1.0) -> some View {
        Text(text)
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .foregroundStyle(color.opacity(opacity))
                    .shadow(radius: 20)
            )
            .onAppear {
                print("Block \(text)(\(color)) appeared.")
            }
    }

    var lazyHStack: some View {
        LazyHStack(spacing: 5) {
            ForEach(0 ..< 100) { number in
                makeBlock(text: "\(number)", .pink)
            }
        }
    }

    var lazyVStack: some View {
        LazyVStack(spacing: 5) {
            ForEach(0 ..< 100) { number in
                makeBlock(text: "\(number)", .blue)
            }
        }
    }

    var body: some View {
        VStack(spacing: 0) {
            ScrollView(.horizontal) {
                lazyHStack
            }
            .background(Color.gray.opacity(0.25))
            Divider()
            ScrollView(.vertical) {
                lazyVStack
            }
            .background(Color.gray.opacity(0.5))
        }
    }
}

#Preview {
    ExLazyStack()
}
