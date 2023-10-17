//
// ExTabViewPagination.swift
// Created on 2023/10/18
//

import SwiftUI

struct ExTabViewPagination: View {
    var body: some View {
        TabView {
            RoundedRectangle(cornerRadius: 30)
                .fill(Color.blue)
                .padding()
            RoundedRectangle(cornerRadius: 30)
                .fill(Color.red)
                .padding()
            RoundedRectangle(cornerRadius: 30)
                .fill(Color.purple)
                .padding()
        }
        .tabViewStyle(.page(indexDisplayMode: .always))
    }
}

#Preview {
    ExTabViewPagination()
}
