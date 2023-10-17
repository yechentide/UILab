//
// ExMatchedGeometryEffect05.swift
// Created on 2023/10/18
//

import SwiftUI

struct ExMatchedGeometryEffect05: View {
    @Namespace private var heroRing

    private let hourList = ([Int])(1...12)
    private let circleSize: CGFloat = 40
    private let radius: CGFloat = 120
    @State private var current = 1

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                ForEach(hourList, id: \.self) { index in
                    Button {
                        withAnimation(.easeInOut) {
                            current = index
                        }
                    } label: {
                        Text("\(index)")
                    }
                    .frame(width: self.circleSize, height: self.circleSize)
                    .matchedGeometryEffect(id: index, in: heroRing, isSource: true)
                    .background(
                        Circle().foregroundColor(Color(uiColor: .secondarySystemBackground))
                    )
                    .position(
                        x: geometry.size.width/2 + self.radius * CGFloat(sin(Double(index) * .pi/6)),
                        y: geometry.size.height/2 - self.radius * CGFloat(cos(Double(index) * .pi/6))
                    )
                }
            }
        }
        .overlay(
            Circle()
                .matchedGeometryEffect(id: current, in: heroRing, isSource: false)
                .foregroundColor(.blue.opacity(0.2))
        )
    }
}

#Preview {
    ExMatchedGeometryEffect05()
}
