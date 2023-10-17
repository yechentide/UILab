//
// ExLiquid01.swift
// Created on 2023/10/18
//

import SwiftUI

/// https://gist.github.com/Koshimizu-Takehito/a1da84a495f97e805870ecf2a0ce0050
fileprivate enum ID: CaseIterable {
    case center, dragging
}

struct ExLiquid01: View {
    @State var offset = CGSize.zero

    var body: some View {
        Rectangle()
            .fill(.purple)
            .mask {
                Canvas { context, size in
                    context.addFilter(.alphaThreshold(min: 0.4, color: .white))
                    context.addFilter(.blur(radius: 30))
                    context.drawLayer { context in
                        let center = CGPoint(x: size.width / 2, y: size.height / 2)
                        for id in ID.allCases {
                            context.draw(context.resolveSymbol(id: id)!, at: center)
                        }
                    }
                } symbols: {
                    Circle().frame(width: 160, height: 160)
                        .tag(ID.center)
                    Circle().frame(width: 160, height: 160)
                        .offset(offset)
                        .tag(ID.dragging)
                }
            }
            .gesture(
                DragGesture()
                    .onChanged { offset = $0.translation }
                    .onEnded { _ in
                        withAnimation(.interactiveSpring(response: 1, dampingFraction: 0.2, blendDuration: 0.6)) {
                            offset = .zero
                        }
                    }
            )
    }
}

#Preview {
    ExLiquid01()
}
