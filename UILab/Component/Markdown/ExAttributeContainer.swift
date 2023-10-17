//
// ExAttributeContainer.swift
// Created on 2023/10/17
//

import SwiftUI

struct ExAttributeContainer: View {
    var attributedString: AttributedString {
        var container = AttributeContainer()
        container.foregroundColor = .purple.opacity(0.3)
        container.underlineStyle = .single
        container.underlineColor = .blue

        var name = AttributedString("Stephanie")
        name.mergeAttributes(container)
        return "Hello, " + name
    }

    var body: some View {
        Text(attributedString)
            .bold()
    }
}

#Preview {
    ExAttributeContainer()
}
