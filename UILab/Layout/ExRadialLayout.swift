//
// ExRadialLayout.swift
// Created on 2023/10/18
//

import SwiftUI

fileprivate struct RadialLayout: Layout {
    func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGSize {
        proposal.replacingUnspecifiedDimensions()
    }

    func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) {
        let radius = bounds.width / 3.0
        let angle = Angle.degrees(360.0 / Double(subviews.count)).radians
        for (index, subview) in subviews.enumerated() {
            // Position
            var point = CGPoint(x: 0, y: Int(-radius))
                .applying(CGAffineTransform(rotationAngle: CGFloat(angle) * CGFloat(index)))

            // Center
            point.x += bounds.midX
            point.y += bounds.midY

            // Place subviews
            subview.place(at: point, anchor: .center, proposal: .unspecified)
        }
    }
}

struct ExRadialLayout: View {
    var icons = ["calendar", "message", "figure.walk", "music.note"]
    var numbers = [12,1,2,3,4,5,6,7,8,9,10,11]

    var internalButtons: some View {
        RadialLayout {
            ForEach(icons, id: \.self) { item in
                Circle()
                    .frame(width: 44)
                    .overlay(Image(systemName: item).foregroundColor(.white))
            }
        }
        .frame(width: 120)
    }

    var hours: some View {
        RadialLayout {
            ForEach(numbers, id: \.self) { item in
                Text("\(item)")
                    .font(.system(.title, design: .rounded))
                    .bold()
                    .foregroundColor(.black)
            }
        }
        .frame(width: 240)
    }

    var minutes: some View {
        RadialLayout {
            ForEach(numbers, id: \.self) { item in
                Text("\(item * 5)")
                    .font(.system(.caption, design: .rounded))
                    .foregroundColor(.black)
            }
        }
        .frame(width: 360)
    }

    var body: some View {
        ZStack {
            internalButtons
            hours
            minutes
            Circle()
                .strokeBorder(.black, style: StrokeStyle(lineWidth: 10, dash: [1, 10]))
                .frame(width: 220)
        }
    }
}

#Preview {
    ExRadialLayout()
}
