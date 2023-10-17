//
// ExAnyLayout.swift
// Created on 2023/10/18
//

import SwiftUI

struct ExAnyLayout: View {
    private enum LayoutType {
        case vStack
        case hStack
        case zStack
        var value: AnyLayout {
            switch self {
                case .vStack: AnyLayout(VStackLayout())
                case .hStack: AnyLayout(HStackLayout())
                case .zStack: AnyLayout(ZStackLayout())
            }
        }
        func next() -> LayoutType {
            switch self {
                case .vStack: .hStack
                case .hStack: .zStack
                case .zStack: .vStack
            }
        }
    }
    @State private var layoutType: LayoutType = .vStack
    private let icons = ["calendar", "message", "figure.walk", "music.note", "star"]

    var body: some View {
        layoutType.value {
            ForEach(icons, id: \.self) { icon in
                Circle()
                    .frame(width: 44)
                    .overlay(Image(systemName: icon).foregroundColor(.white))
            }
        }
        .onTapGesture {
            withAnimation(.spring()) {
                layoutType = layoutType.next()
            }
        }
    }
}

#Preview {
    ExAnyLayout()
}
