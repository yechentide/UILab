//
// ExGroupBox.swift
// Created on 2023/10/18
//

import SwiftUI

struct ExGroupBox: View {
    @State private var userAgreed = false

    var body: some View {
        GroupBox(
            label: Label("End-User Agreement", systemImage: "building.columns")
        ) {
            ScrollView(.vertical, showsIndicators: true) {
                Text( String(repeating: "hello", count: 300) )
                    .font(.footnote)
            }
            .frame(height: 300)
            Toggle(isOn: $userAgreed) {
                Text("I agree to the above terms")
            }
            Text("A")
        }
    }
}

#Preview {
    ExGroupBox()
}
