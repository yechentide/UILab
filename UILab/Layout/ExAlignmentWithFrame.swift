//
// ExAlignmentWithFrame.swift
// Created on 2023/10/18
//

import SwiftUI

struct ExAlignmentWithFrame: View {
    var closeButton: some View {
        Button {
        } label: {
            Image(systemName: "xmark")
                .frame(width: 32, height: 32)
                .background(Circle().stroke())
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
                .padding()
        }
    }

    var body: some View {
        Rectangle()
            .fill(Color.blue.opacity(0.3))
            .ignoresSafeArea()
            .overlay(
                closeButton
            )
    }
}

#Preview {
    ExAlignmentWithFrame()
}
