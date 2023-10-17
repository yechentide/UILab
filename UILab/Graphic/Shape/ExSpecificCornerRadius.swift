//
// ExSpecificCornerRadius.swift
// Created on 2023/10/18
//

import SwiftUI

fileprivate struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
}

struct ExSpecificCornerRadius: View {
    var xcode15: some View {
        HStack {
            UnevenRoundedRectangle(cornerRadii: .init(bottomLeading: 30, topTrailing: 30))
                .frame(width: 100, height: 100)
            UnevenRoundedRectangle(cornerRadii: .init(topLeading: 30, bottomTrailing: 30), style: .continuous)
                .frame(width: 100, height: 100)
        }
    }

    var xcode14: some View {
        HStack {
            Rectangle()
                .frame(width: 100, height: 100)
                .cornerRadius(30, corners: [.topLeft, .bottomRight])
            Rectangle()
                .frame(width: 100, height: 100)
                .cornerRadius(30, corners: [.bottomLeft, .topRight])
        }
    }

    var body: some View {
        VStack {
            xcode15
            xcode14
        }
    }
}

#Preview {
    ExSpecificCornerRadius()
}
