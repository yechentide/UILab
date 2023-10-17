//
// ExLiteral.swift
// Created on 2023/10/17
//

import SwiftUI

struct ExLiteral: View {
    // Color Literal
    // Color(#colorLiteral(red: 0.1, green: 0.1, blue: 0.1, alpha: 1))
    let color = Color(#colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1))
    // Image Literal
    // Image(uiImage: #imageLiteral(resourceName: "YOUR-IMAGE"))
    let image = Image(uiImage: #imageLiteral(resourceName: "icon04"))

    var body: some View {
        ZStack {
            Rectangle()
                .foregroundStyle(color)
                .ignoresSafeArea()
            image
                .resizable()
                .aspectRatio(1, contentMode: .fit)
                .frame(width: 200, height: 200)
        }
    }
}

#Preview {
    ExLiteral()
}
