//
// ExCanvas01.swift
// Created on 2023/10/18
//

import SwiftUI

struct ExCanvas01: View {
    private let bgColor = Color(.sRGB, red: 230/255, green: 240/255, blue: 1, opacity: 1.0)

    var body: some View {
        Canvas { context, size in
            // Draw background
            let bgPath = Path(CGRect(origin: .zero, size: size))
            context.fill(bgPath, with: .color(bgColor))

            // Draw a square
            var squarePath = Path()
            squarePath.move(to: CGPoint(x: 50, y: 50))
            squarePath.addLine(to: CGPoint(x: 100, y: 50))
            squarePath.addLine(to: CGPoint(x: 100, y: 100))
            squarePath.addLine(to: CGPoint(x: 50, y: 100))
            context.fill(squarePath, with: .color(.blue))

            // Add a Filter: any graphics following this line will have a saturated fill color.
            context.addFilter(.saturation(2.5))

            let w = size.width
            let h = size.height

            // Draw Images
            let image = Image(systemName: "person.fill")
            context.draw(image, at: CGPoint(x: w / 2, y: h / 2.2))

            // Draw Text
            context.draw(Text("SwiftUI Canvas").bold().italic().foregroundColor(.green), at: CGPoint(x: w / 2, y: h / 2))
        }
        .background(Color.gray)
    }
}

#Preview {
    ExCanvas01()
}
