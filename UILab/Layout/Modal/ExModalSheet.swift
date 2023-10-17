//
// ExModalSheet.swift
// Created on 2023/10/18
//

import SwiftUI

struct ExModalSheet: View {
    @State private var showModal = false

    var body: some View {
        Button(action: {
            showModal = true
        }) {
            Text("Sign in")
        }
        .sheet(isPresented: $showModal) {
            Text("AAA")
                .presentationDetents([.height(200), .medium, .large])
                .presentationDragIndicator(.automatic)
        }
    }
}

#Preview {
    ExModalSheet()
}
