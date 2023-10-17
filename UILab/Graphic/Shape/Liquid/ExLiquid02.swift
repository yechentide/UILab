//
// ExLiquid02.swift
// Created on 2023/10/18
//

import SwiftUI

/// https://gist.github.com/Koshimizu-Takehito/9844880fdbca9a8b60a1a8831441e1e5
extension ExLiquid02 {
    init(count: Int) {
        self.init(scales: Array(repeating: false, count: count))
    }
}

struct ExLiquid02: View {
    @State private var scales: [Bool]
    let timer = Timer.publish(every: 3, on: .main, in: .common).autoconnect()

    var body: some View {
        GeometryReader { geometry in
            Canvas { context, size in
                context.addFilter(.alphaThreshold(min: 0.3, color: .purple))
                context.addFilter(.blur(radius: 10))
                context.drawLayer { context in
                    let center = CGPoint(x: size.width / 2, y: size.height / 2)
                    for index in 0..<scales.count {
                        context.draw(context.resolveSymbol(id: index)!, at: center)
                    }
                }
            } symbols: {
                ForEach(0..<scales.count, id: \.self) { index in
                    Circle()
                        .frame(
                            width: .random(in: 10...150),
                            height: .random(in: 10...150)
                        )
                        .position(
                            x: .random(in: 0...geometry.size.width),
                            y: .random(in: 0...geometry.size.height)
                        )
                        .scaleEffect(scales[index] ? 1 : 0)
                        .tag(index)
                }
            }
        }
        .onReceive(timer) { _ in
            for index in 0..<scales.count {
                withAnimation(animation()) {
                    scales[index].toggle()
                }
            }
        }

    }

    func animation() -> Animation {
        .easeInOut(duration: .random(in: 1...3))
        .delay(.random(in: 0...2))
    }
}

#Preview {
    ExLiquid02(count: 50)
        .ignoresSafeArea()
}
