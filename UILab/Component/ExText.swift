//
// ExText.swift
// Created on 2023/10/17
//

import SwiftUI

struct ExText: View {
    var body: some View {
        VStack {
            Text("San Francisco")
                .font(.title)
            Text("San Francisco")
               .fontWeight(.bold)
               .font(.system(size: 24, weight: .light, design: .serif))
            Text("San Francisco")
                .fontWeight(.bold)
            Text("San Francisco")
                .italic()
            Text("San Francisco")
                .foregroundColor(.secondary)

            Spacer()

            Text("This sans-serif typeface is the system font for iOS, macOS, and tvOS, and includes a rounded variant. It provides a consistent, legible, and friendly typographic voice.")
                .frame(width: 300, alignment: .leading)

            Spacer()

            Text("This sans-serif typeface is the system font for iOS, macOS, and tvOS, and includes a rounded variant. It provides a consistent, legible, and friendly typographic voice.")
                .frame(width: 300, alignment: .leading)
                .multilineTextAlignment(.center)
                .lineSpacing(20)

            Spacer()

            Text("This sans-serif typeface is the system font for iOS, macOS, and tvOS, and includes a rounded variant. It provides a consistent, legible, and friendly typographic voice.")
                .frame(width: 300, alignment: .leading)
                .multilineTextAlignment(.center)
                .lineLimit(2)
        }
        .padding()
    }
}

#Preview {
    ExText()
}
