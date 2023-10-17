//
// ExDrag.swift
// Created on 2023/10/18
//

import SwiftUI

struct ExDrag: View {
    @State private var viewState = CGSize.zero

    var body: some View {
        RoundedRectangle(cornerRadius: 30)
            .fill(Color.blue)
            .frame(width: 300, height: 400)
            .offset(x: viewState.width, y: viewState.height)
            .gesture(
                DragGesture()
                    .onChanged { value in
                        viewState = value.translation
                    }
                    .onEnded { value in
                        withAnimation(.spring()) {
                            viewState = .zero
                        }
                    }
            )
    }
}

#Preview {
    ExDrag()
}
