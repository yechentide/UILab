//
// ExStyledSFFont.swift
// Created on 2023/10/18
//

import SwiftUI

extension Font {
    static func system(size: CGFloat, weight: UIFont.Weight, width: UIFont.Width) -> Font {
        return Font(
            UIFont.systemFont(
                ofSize: size,
                weight: weight,
                width: width)
        )
    }
}

struct ExStyledSFFont: View {
    var body: some View {
        Text("One place to stack all your cards")
            .font(.system(size: 48, weight: .bold, width: .compressed))
    }
}

#Preview {
    ExStyledSFFont()
}
