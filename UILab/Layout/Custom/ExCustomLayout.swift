//
// ExCustomLayout.swift
// Created on 2023/10/18
//

import SwiftUI

fileprivate struct MyLayout: Layout {
    func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGSize {
        proposal.replacingUnspecifiedDimensions()
    }

    func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) {
        for (index, subview) in subviews.enumerated() {
            var point = CGPoint(x: 50 * index, y: 50 * index)
                .applying(CGAffineTransform(rotationAngle: CGFloat(index * 6 + 6)))
            point.x += bounds.midX
            point.y += bounds.midY
            subview.place(at: point, anchor: .center, proposal: .unspecified)
        }
    }
}

struct ExCustomLayout: View {
    var body: some View {
        MyLayout {
            ForEach(0 ..< 5) { item in
                Circle()
                    .frame(width: 44)
                    .overlay(
                        Text("\(item)")
                            .foregroundColor(.white)
                    )
            }
        }
    }
}

#Preview {
    ExCustomLayout()
}
